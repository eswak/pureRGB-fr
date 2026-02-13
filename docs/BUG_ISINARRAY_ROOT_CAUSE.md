# Analyse Root Cause: IsInArray Ne Trouve Pas Les Effets

**Date**: 2026-02-13
**Gravité**: 🔴 CRITIQUE

## Symptômes Confirmés

1. **Seismic Toss**: Crash avec sp=bfff (stack overflow), pc=d142 (exécution depuis WRAM)
2. **MEGA_DRAIN**: S'exécute 2 fois, affiche le texte 2 fois

## Root Cause Identifiée

**IsInArray ne trouve PAS les effets dans les tables**, même si:
- Les tables sont correctement définies en bank 0x0F
- Les wrappers sont en bank 0x0F
- Forcer bank 0x0F avant les appels ne résout PAS le problème

### Preuve

Pour MEGA_DRAIN (DRAIN_HP_EFFECT = 0x03):
- Est dans `AlwaysHappenSideEffects` (ligne 3)
- Est dans `SpecialEffects` (ligne 5)

**Flow attendu**:
1. `CheckAlwaysHappenSideEffectsInBank` → trouve → carry SET → exécute (1ère fois)
2. `CheckSpecialEffectsInBank` → trouve → carry SET → `call nc` ne s'exécute PAS

**Flow réel**:
1. `CheckAlwaysHappenSideEffectsInBank` → **NE TROUVE PAS** → carry CLEAR → n'exécute pas
2. `CheckSpecialEffectsInBank` → **NE TROUVE PAS** → carry CLEAR → `call nc` exécute (1ère fois)
3. L'effet s'exécute aussi ailleurs → 2ème fois

OU:
1. `CheckAlwaysHappenSideEffectsInBank` → trouve → carry SET → exécute (1ère fois)
2. `CheckSpecialEffectsInBank` → **NE TROUVE PAS** → carry CLEAR → `call nc` exécute (2ème fois)

### Pour Seismic Toss

`SPECIAL_DAMAGE_EFFECT` (0x29) pointe vers `NULL` (0x0000) dans MoveEffectPointerTable.

**Flow attendu**:
1. `CheckSpecialEffectsInBank` → trouve dans SpecialEffects ligne 14 → carry SET
2. `call nc, JumpMoveEffect` → NE s'exécute PAS

**Flow réel**:
1. `CheckSpecialEffectsInBank` → **NE TROUVE PAS** → carry CLEAR
2. `call nc, JumpMoveEffect` → s'exécute
3. `JumpMoveEffect` saute vers NULL (0x0000) → crash

## Tests Effectués (Tous Échoués)

### V1: Restaurations manuelles de banque
- Ajout de `ld a, $0F` + `call SetCurBank` partout
- **Résultat**: Échec

### V2: Optimisations
- **Résultat**: Échec (crash différent)

### V3: Wrappers
- Création de fonctions wrapper dans bank 0x0F
- **Résultat**: Échec

### V4: Force bank 0x0F avant wrappers
- `call RestoreBattleCoreBank` avant chaque appel wrapper
- **Résultat**: **ÉCHEC** ← Ceci invalide l'hypothèse que c'est un simple bank mismatch

## Hypothèse Root Cause

Le problème n'est PAS un simple "bank mismatch". C'est plus profond:

### Hypothèse A: Corruption de registres

Quand `CheckAlwaysHappenSideEffectsInBank` est appelé:
```asm
ld a, [wPlayerMoveEffect]  ; a = 0x03 pour MEGA_DRAIN
call CheckAlwaysHappenSideEffectsInBank
```

Le wrapper fait:
```asm
CheckAlwaysHappenSideEffectsInBank::
    ld hl, AlwaysHappenSideEffects  ; hl pointe vers table
    ld de, 1                         ; de = stride
    jp IsInArray                     ; a devrait toujours être 0x03
```

**MAIS** : Peut-être que `ld hl, AlwaysHappenSideEffects` CORROMPT 'a' d'une manière ou d'une autre?

Non, `ld hl, ...` ne touche pas 'a'.

### Hypothèse B: L'adresse chargée n'est PAS AlwaysHappenSideEffects

Peut-être que `ld hl, AlwaysHappenSideEffects` charge la MAUVAISE adresse?

Vérification dans pokegreen.sym:
- 0f:4041 AlwaysHappenSideEffects
- 0f:4058 SpecialEffects

Les adresses semblent correctes.

### Hypothèse C: IsInArray a un bug

Le code d'IsInArray lit depuis [hl] qui pointe vers ROMX. Si la mauvaise banque est active, il lit les mauvaises données.

```asm
.loop
    ld a, [hl]  ; ← LIT DEPUIS ROMX! Banque doit être 0x0F!
    cp -1
    jr z, .notfound
    cp c
    jr z, .found
    inc b
    add hl, de
    jr .loop
```

**Test effectué**: Forcer bank 0x0F avant wrapper → **ÉCHEC**

Donc même avec bank 0x0F active, IsInArray ne trouve pas!

### Hypothèse D: Les tables ne sont PAS à 0f:4041 en runtime

Peut-être que le linker place les tables ailleurs qu'attendu, et le .sym est incorrect?

**Test**: Vérifier le bytecode réel à l'adresse 0f:4041

### Hypothèse E: La valeur dans wPlayerMoveEffect est corrompue

Peut-être que wPlayerMoveEffect ne contient PAS 0x03 mais autre chose?

**Contre-preuve**: L'effet MEGA_DRAIN s'exécute bien (sinon pas de soin du tout). Donc wPlayerMoveEffect doit être correct.

## Solution Proposée

Utiliser `callfar` au lieu de `jp` direct vers IsInArray, pour garantir que:
1. La banque correcte est active via Bankswitch
2. La banque est restaurée après le retour

### Implémentation

Au lieu de:
```asm
CheckAlwaysHappenSideEffectsInBank::
    ld hl, AlwaysHappenSideEffects
    ld de, 1
    jp IsInArray
```

Créer une fonction dans bank 0x0F:
```asm
_CheckAlwaysHappenSideEffectsInBank:
    ; 'a' contient wPlayerMoveEffect
    ld hl, AlwaysHappenSideEffects
    ld de, 1
    call IsInArray  ; call au lieu de jp pour préserver le retour
    ret             ; retourne avec carry correctement set
```

Et modifier l'appelant:
```asm
ld a, [wPlayerMoveEffect]
ld b, BANK(_CheckAlwaysHappenSideEffectsInBank)
ld hl, _CheckAlwaysHappenSideEffectsInBank
call Bankswitch  ; Garantit bank 0x0F active pendant tout l'appel
```

Cela garantit que:
1. Bank 0x0F est active PENDANT tout l'appel
2. IsInArray lit depuis la bonne banque
3. La banque est restaurée après

## Actions Immédiates

1. Implémenter la solution proposée
2. Tester avec Seismic Toss et MEGA_DRAIN
3. Si ça marche, confirmer que le problème était lié à un timing de bank switching subtil
4. Si ça ne marche pas, investiguer Hypothèse D (tables mal placées) via dump hexadécimal
