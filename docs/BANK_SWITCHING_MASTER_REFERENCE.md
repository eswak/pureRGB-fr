# Bank Switching - Référence Maître Complète

**Dernière mise à jour**: 2026-02-13
**Status**: ⚠️ BUGS TOUJOURS PRÉSENTS malgré tous les fixes

---

## Table des Matières

1. [Symptômes des Bugs](#symptômes-des-bugs)
2. [Architecture du Système](#architecture-du-système)
3. [Historique des Tentatives de Fix](#historique-des-tentatives-de-fix)
4. [État Actuel du Code](#état-actuel-du-code)
5. [Analyses et Découvertes](#analyses-et-découvertes)
6. [Pistes de Debug Restantes](#pistes-de-debug-restantes)
7. [Inventaires Complets](#inventaires-complets)
8. [Références Techniques](#références-techniques)

---

## 1. Symptômes des Bugs

### Bug #1: Seismic Toss / Super Fang - Crash Systématique

**Reproductibilité**: 100%
**Moment**: Après animation et calcul de dégâts, avant le texte suivant

**Comportement**:
- Écran devient noir
- Émulateur ouvre le debugger (sp=bfff, pc=d142)
- Stack corruption évidente

**Moves affectés**:
- Seismic Toss (SPECIAL_DAMAGE_EFFECT = 0x29)
- Super Fang (SPECIAL_DAMAGE_EFFECT = 0x29)

### Bug #2: MEGA_DRAIN - Double Exécution

**Reproductibilité**: 100%
**Moment**: Après calcul de dégâts

**Comportement**:
- Le Pokémon est soigné **2 fois** (1 fois normalement, 1 fois de 1 HP seulement)
- Le texte "sucked health" est affiché **2 fois**

**Moves affectés**:
- MEGA_DRAIN (DRAIN_HP_EFFECT = 0x03)
- ABSORB devrait avoir le même problème

### Bug #3: Skull Bash - Crash Intermittent

**Reproductibilité**: Sporadique
**Moment**: Variable

**Comportement**: Similaire à Seismic Toss mais pas systématique

---

## 2. Architecture du Système

### 2.1 Layout des Banques ROM

Selon `layout.link`:

```
ROM0 (0x0000-0x3FFF)  - Home bank (always loaded)
ROMX $F (0x4000-0x7FFF) - Battle Core
ROMX $10 (0x4000-0x7FFF) - Battle Core Data + other
```

**Bank Battle Core (0x0F)**:
- engine/battle/core.asm
- engine/battle/effects.asm
- data/battle/*.asm (tables d'effets)

### 2.2 Tables d'Effets

Toutes localisées dans **Bank 0x0F**:

```
0f:4000 ResidualEffects1          ; Effets non-side (Haze, Teleport, Mist, etc.)
0f:401b ResidualEffects2          ; Effets de stats, Bide, Sleep
0f:4041 AlwaysHappenSideEffects   ; Effets qui s'exécutent même si ennemi KO
0f:4058 SpecialEffects            ; Effets déjà traités, ne pas réexécuter
0f:4069 SpecialEffectsCont        ; Effets pré-dommage (Thrash, Trapping)
```

**Contenu des tables**:

```asm
AlwaysHappenSideEffects:
    db DRAIN_HP_EFFECT           ; 0x03 ← MEGA_DRAIN
    db EXPLODE_EFFECT
    db DREAM_EATER_EFFECT
    db PAY_DAY_EFFECT
    db TWO_OR_THREE_ATTACKS_EFFECT
    db TWO_TO_FIVE_ATTACKS_EFFECT
    db ATTACK_TWICE_EFFECT
    db RECOIL_EFFECT
    db BIG_RECOIL_EFFECT
    db TWINEEDLE_EFFECT
    db ATTACK_UP_SIDE_EFFECT
    db BONEMERANG_EFFECT
    db EXPLODE_RECOIL_EFFECT
    db -1

SpecialEffects:
    db DRAIN_HP_EFFECT           ; 0x03 ← MEGA_DRAIN aussi!
    db EXPLODE_EFFECT
    db DREAM_EATER_EFFECT
    db PAY_DAY_EFFECT
    db SWIFT_EFFECT
    db TWO_OR_THREE_ATTACKS_EFFECT
    db TWO_TO_FIVE_ATTACKS_EFFECT
    db CHARGE_EFFECT
    db SUPER_FANG_EFFECT
    db SPECIAL_DAMAGE_EFFECT     ; 0x29 ← Seismic Toss
    db FLY_EFFECT
    db ATTACK_TWICE_EFFECT
    db JUMP_KICK_EFFECT
    db RECOIL_EFFECT
    db BIG_RECOIL_EFFECT
    db ATTACK_UP_SIDE_EFFECT
    db EXPLODE_RECOIL_EFFECT
    db -1
```

### 2.3 Vecteurs RST (PureRGB modifié)

**IMPORTANT**: PureRGB a **inversé** rst $00 et rst $08 par rapport à pokered original!

```asm
SECTION "rst0", ROM0[$0000]
_Bankswitch::
    jp Bankswitch        ; ← rst $00 = c7

SECTION "rst8", ROM0[$0008]
_Predef::
    jp Predef            ; ← rst $08 = cf
```

**Conséquence**: `callfar` utilise `rst $00` (c7), PAS rst $08!

### 2.4 Macro callfar

```asm
MACRO callfar
    ld hl, \1
    ld b, BANK(\1)
    rst _Bankswitch      ; ← rst $00 en pureRGB
ENDM
```

**Bankswitch fait automatiquement PUSH/POP**:

```asm
Bankswitch::
    ldh a, [hLoadedROMBank]
    push af                    ; ← PUSH banque actuelle
    ld a, b
    call SetCurBank            ; ← Switch vers nouvelle banque
    call hl_caller             ; ← jp hl (exécute fonction)
    pop bc                     ; ← POP banque originale
    ld a, b
    jr SetCurBank              ; ← RESTAURE banque originale
```

### 2.5 JumpMoveEffect Wrapper

Situé dans **Bank 0x0F** (Battle Core):

```
0f:731b JumpMoveEffect
```

Code:

```asm
JumpMoveEffect:
    call _JumpMoveEffect
    ld a, BANK(JumpMoveEffect)  ; = 0x0F
    call SetCurBank
    ld b, $1
    ret
```

**Restaure Bank 0x0F** après exécution d'un effet, même si l'effet a changé de banque.

---

## 3. Historique des Tentatives de Fix

### Tentative V1: Restaurations Manuelles

**Approche**: Ajouter `call RestoreBattleCoreBank` après chaque `callfar`/`predef` susceptible de changer de banque.

**Restaurations ajoutées**:
- Après ApplyAttackToEnemyPokemon
- Après PrintCriticalOHKOText
- Après DisplayEffectiveness
- Après JumpMoveEffect (AlwaysHappenSideEffects)
- Après rst _PrintText (multi-hit)

**Résultat**: ❌ ÉCHEC - Bugs toujours présents

**Raison de l'échec**: `callfar` fait déjà PUSH/POP automatique → restaurations redondantes et inutiles

### Tentative V2: Optimisations

**Approche**: Optimiser les restaurations pour passer sous la limite de section (0x4000 bytes)

**Changements**:
- Créé helper `RestoreBattleCoreBank` dans home/bankswitch.asm
- Supprimé `jr .afterBankRestore` redondants
- Changé `jp` → `jr` pour sauts courts

**Résultat**: ✅ Compilation OK, ❌ Bugs toujours présents

### Tentative V3: Wrappers In-Bank (Actuel)

**Approche**: Créer des wrappers dans la même banque que les tables, inspiré de `CheckIsMistBlockedMoveInBank`

**Wrappers créés**:

```asm
CheckResidualEffects1InBank::        ; 0f:400f
    ld hl, ResidualEffects1
    ld de, 1
    jp IsInArray

CheckResidualEffects2InBank::        ; 0f:4038
    ld hl, ResidualEffects2
    ld de, 1
    jp IsInArray

CheckAlwaysHappenSideEffectsInBank:: ; 0f:404f
    ld hl, AlwaysHappenSideEffects
    ld de, 1
    jp IsInArray

CheckSpecialEffectsInBank::          ; 0f:406c
    ld hl, SpecialEffects
    ld de, 1
    jp IsInArray
```

**Tous les appels `IsInArray` remplacés**:

```asm
; AVANT:
ld hl, AlwaysHappenSideEffects
ld de, 1
call IsInArray

; APRÈS:
call CheckAlwaysHappenSideEffectsInBank
```

**Résultat**: ✅ Compilation OK, ❌ **BUGS TOUJOURS PRÉSENTS**

---

## 4. État Actuel du Code

### 4.1 ExecutePlayerMove (simplifié)

```asm
ExecutePlayerMove:
    ; ... setup ...
    call ApplyAttackToEnemyPokemon          ; Applique dégâts
    call PrintCriticalOHKOText              ; Affiche "Critical Hit!" si applicable
    callfar DisplayEffectiveness            ; Affiche "Super effective!" etc.
    ld a, 1
    ld [wMoveDidntMiss], a
.notDone
    ld a, [wPlayerMoveEffect]
    call CheckAlwaysHappenSideEffectsInBank ; ← Wrapper in-bank
    call c, JumpMoveEffect                  ; Si trouvé, exécute effet
    ld hl, wEnemyMonHP
    ld a, [hli]
    ld b, [hl]
    or b
    ret z                                   ; Retourne si ennemi KO

    ; Multi-hit check
    ld hl, wPlayerBattleStatus1
    bit ATTACKING_MULTIPLE_TIMES, [hl]
    jr z, .executeOtherEffects
    ; ... logique multi-hit ...
    rst _PrintText                          ; "Hit X times!"
    xor a
    ld [wPlayerNumHits], a

.executeOtherEffects
    ld a, [wPlayerMoveEffect]
    and a
    jr z, ExecutePlayerMoveDone
    call CheckResidualEffects1InBank        ; ← Wrapper in-bank
    jr c, ExecutePlayerMoveDone
    call CheckResidualEffects2InBank        ; ← Wrapper in-bank
    jr c, ExecutePlayerMoveDone
    call CheckSpecialEffectsInBank          ; ← Wrapper in-bank
    call nc, JumpMoveEffect                 ; Si PAS trouvé, exécute effet
    jr ExecutePlayerMoveDone
```

### 4.2 Bytecode Compilé (Player flow)

```
0x3D8CF: cd 9c 60     call ApplyAttackToEnemyPokemon
0x3D8D2: cd 30 5c     call PrintCriticalOHKOText
0x3D8D5: 21 c1 41     ld hl, DisplayEffectiveness
0x3D8D8: 06 0e        ld b, BANK(DisplayEffectiveness) ; = 0x0E
0x3D8DA: c7           rst _Bankswitch (callfar)
0x3D8DB: 3e 01        ld a, 1
0x3D8DD: ea f4 cc     ld [wMoveDidntMiss], a
0x3D8E0: fa d3 cf     ld a, [wPlayerMoveEffect]
0x3D8E3: cd 4f 40     call CheckAlwaysHappenSideEffectsInBank ; ← 0f:404f
0x3D8E6: dc 1b 73     call c, JumpMoveEffect
0x3D8E9: 21 e4 cf     ld hl, wEnemyMonHP
... (multi-hit logic) ...
0x3D920: fa d3 cf     ld a, [wPlayerMoveEffect]
0x3D923: a7           and a
0x3D924: 28 23        jr z, ExecutePlayerMoveDone
0x3D926: cd 0f 40     call CheckResidualEffects1InBank        ; ← 0f:400f
0x3D929: 38 1e        jr c, ExecutePlayerMoveDone
0x3D92B: cd 38 40     call CheckResidualEffects2InBank        ; ← 0f:4038
0x3D92E: 38 19        jr c, ExecutePlayerMoveDone
0x3D930: cd 6c 40     call CheckSpecialEffectsInBank          ; ← 0f:406c
0x3D933: d4 1b 73     call nc, JumpMoveEffect
0x3D936: 18 11        jr ExecutePlayerMoveDone
```

### 4.3 Vérification de la Banque des Wrappers

Selon `pokegreen.sym`:

```
0f:4000 ResidualEffects1
0f:400f CheckResidualEffects1InBank     ✅ MÊME BANQUE
0f:401b ResidualEffects2
0f:4038 CheckResidualEffects2InBank     ✅ MÊME BANQUE
0f:4041 AlwaysHappenSideEffects
0f:404f CheckAlwaysHappenSideEffectsInBank ✅ MÊME BANQUE
0f:4058 SpecialEffects
0f:406c CheckSpecialEffectsInBank       ✅ MÊME BANQUE
```

**Conclusion**: Les wrappers SONT dans la bonne banque. Théoriquement, IsInArray devrait TOUJOURS lire les bonnes données.

---

## 5. Analyses et Découvertes

### 5.1 Flux Théorique MEGA_DRAIN

**Effet**: DRAIN_HP_EFFECT (0x03)

**Tables**:
- ✅ Dans `AlwaysHappenSideEffects` (ligne 3)
- ✅ Dans `SpecialEffects` (ligne 5)

**Flux attendu**:

1. `call CheckAlwaysHappenSideEffectsInBank` → **TROUVE** 0x03 → carry SET
2. `call c, JumpMoveEffect` → **EXÉCUTÉ** → DrainHPEffect_ → soigne + texte (1ère fois)
3. Check HP ennemi → pas KO
4. Multi-hit check → non
5. `.executeOtherEffects`:
6. `call CheckResidualEffects1InBank` → PAS trouvé → carry CLEAR
7. `call CheckResidualEffects2InBank` → PAS trouvé → carry CLEAR
8. `call CheckSpecialEffectsInBank` → **TROUVE** 0x03 → carry SET
9. `call nc, JumpMoveEffect` → **PAS exécuté** (carry SET) ✅

**Résultat attendu**: 1 seule exécution de DrainHPEffect_

**Résultat réel**: **2 exécutions** → Le wrapper ne fonctionne PAS comme prévu!

### 5.2 Flux Théorique Seismic Toss

**Effet**: SPECIAL_DAMAGE_EFFECT (0x29)

**Tables**:
- ❌ PAS dans `AlwaysHappenSideEffects`
- ✅ Dans `SpecialEffects` (ligne 14)

**Flux attendu**:

1. `call CheckAlwaysHappenSideEffectsInBank` → **PAS trouvé** → carry CLEAR
2. `call c, JumpMoveEffect` → **PAS exécuté**
3. Check HP ennemi → peut être KO
4. Si KO: `ret z` → retourne
5. Si pas KO: continue vers `.executeOtherEffects`
6. `call CheckSpecialEffectsInBank` → **TROUVE** 0x29 → carry SET
7. `call nc, JumpMoveEffect` → **PAS exécuté** (carry SET) ✅

**Résultat attendu**: Aucune exécution via JumpMoveEffect (dégâts déjà appliqués par ApplyAttackToEnemyPokemon)

**Résultat réel**: **CRASH** → Quelque chose ne va pas!

### 5.3 Hypothèses Pourquoi les Wrappers Ne Fonctionnent Pas

#### Hypothèse A: La Banque Change Entre l'Appel au Wrapper et IsInArray

**Probabilité**: Faible

Le wrapper est une fonction simple:
```asm
CheckSpecialEffectsInBank::
    ld hl, SpecialEffects
    ld de, 1
    jp IsInArray
```

Entre `call CheckSpecialEffectsInBank` et l'exécution de `IsInArray`, il n'y a que:
- `ld hl, ...` (pas de changement de banque)
- `ld de, ...` (pas de changement de banque)
- `jp IsInArray` (jump vers HOME, banque ROMX reste active)

#### Hypothèse B: IsInArray est Appelé Depuis HOME Mais Lit Depuis ROMX Incorrectement

**Probabilité**: Moyenne

IsInArray est dans home/array2.asm (HOME bank). Quand on l'appelle:
- La banque ROMX active reste celle qui était active avant l'appel
- IsInArray fait `ld a, [hl]` qui lit depuis la banque ROMX active
- Si hl = 0x4058 (SpecialEffects) et banque = 0x0F, devrait lire correctement

**MAIS**: Si la banque n'est PAS 0x0F au moment du `call CheckSpecialEffectsInBank`, le wrapper charge l'adresse 0x4058 mais IsInArray lit depuis la MAUVAISE banque!

#### Hypothèse C: La Banque N'est PAS 0x0F Avant l'Appel au Wrapper

**Probabilité**: ÉLEVÉE

Regardons le bytecode juste avant l'appel:

```
0x3D8DA: c7           rst _Bankswitch (DisplayEffectiveness)
0x3D8DB: 3e 01        ld a, 1
0x3D8DD: ea f4 cc     ld [wMoveDidntMiss], a
0x3D8E0: fa d3 cf     ld a, [wPlayerMoveEffect]
0x3D8E3: cd 4f 40     call CheckAlwaysHappenSideEffectsInBank
```

Après `rst _Bankswitch` (callfar DisplayEffectiveness):
- Push 0x0F (si c'était la banque active avant)
- Switch vers 0x0E
- Exécute DisplayEffectiveness
- Pop et restaure... **QUELLE BANQUE?**

**Si la banque AVANT callfar n'était PAS 0x0F, alors après callfar ce ne sera PAS 0x0F!**

#### Hypothèse D: Il y a une Interruption ou un Mécanisme Caché

**Probabilité**: Faible mais possible

VBlank interrupt, LCD interrupt, etc. pourraient changer la banque entre les instructions.

#### Hypothèse E: Le Problème N'est PAS dans IsInArray

**Probabilité**: Moyenne-Élevée

Peut-être que IsInArray TROUVE correctement les effets, mais le problème est AILLEURS:
- Dans DrainHPEffect_ lui-même
- Dans l'application des dégâts
- Dans un autre appel caché à DrainHPEffect_

---

## 6. Pistes de Debug Restantes

### 6.1 Vérifier Quelle Banque est Active

**Méthode**: Ajouter des écritures en WRAM pour tracer la banque active

```asm
; Dans ExecutePlayerMove, avant callfar DisplayEffectiveness:
ldh a, [hLoadedROMBank]
ld [wDebugBankBefore], a

callfar DisplayEffectiveness

ldh a, [hLoadedROMBank]
ld [wDebugBankAfter], a

; Afficher ces valeurs à l'écran
```

**Variables à ajouter**:
```asm
wDebugBankBefore:: ds 1
wDebugBankAfter:: ds 1
wDebugIsInArrayBank:: ds 1
```

### 6.2 Tracer les Appels à DrainHPEffect_

**Méthode**: Ajouter un compteur dans DrainHPEffect_

```asm
DrainHPEffect_:
    ; Incrémenter compteur
    ld hl, wDebugDrainCallCount
    inc [hl]
    ; ... reste du code ...
```

**Afficher le compteur**: Si > 1, on sait qu'il y a double exécution

### 6.3 Vérifier les Résultats d'IsInArray

**Méthode**: Sauvegarder le flag carry après chaque IsInArray

```asm
call CheckSpecialEffectsInBank
jr nc, .notFound
ld a, $FF
jr .saveResult
.notFound
xor a
.saveResult
ld [wDebugSpecialEffectsFound], a
```

### 6.4 Forcer la Banque 0x0F Avant CHAQUE Wrapper

**Méthode**: Ajouter une restauration forcée avant chaque wrapper

```asm
; AVANT CheckAlwaysHappenSideEffectsInBank
ld a, $0F
ldh [hLoadedROMBank], a
ld [MBC1RomBank], a
call CheckAlwaysHappenSideEffectsInBank
```

**Si ça marche**: Confirme que le problème est la banque active avant l'appel
**Si ça ne marche pas**: Le problème est ailleurs

### 6.5 Inspecter DisplayEffectiveness

**Localisation**: engine/battle/display_effectiveness.asm, Bank 0x0E

**À vérifier**:
- Est-ce que DisplayEffectiveness change de banque?
- Est-ce qu'il y a des `callfar`/`predef` dedans?
- Est-ce qu'il restaure correctement?

### 6.6 Chercher Tous les Appels à DrainHPEffect_

**Méthode**: Grep dans tout le code

```bash
grep -r "DrainHPEffect" pureRGB/
```

**Vérifier**: Y a-t-il un autre endroit qui appelle DrainHPEffect_ directement?

### 6.7 Désassembler le ROM Compilé

**Méthode**: Utiliser mgbdis ou un désassembleur Game Boy

```bash
mgbdis -b pokegreen.gbc > disasm.asm
```

**Chercher**: Le bytecode réel de CheckSpecialEffectsInBank pour vérifier qu'il est correct

### 6.8 Test Minimal

**Créer un test case minimal**:

1. Nouveau combat
2. Utiliser MEGA_DRAIN
3. Observer le comportement
4. Compter combien de fois le texte apparaît

**Variation**: Tester avec d'autres move effects pour voir si le problème est généralisé

---

## 7. Inventaires Complets

### 7.1 Tous les callfar dans engine/battle/core.asm (52 total)

Voir [callfar_inventory.md](callfar_inventory.md) pour la liste complète.

**Critiques identifiés**:
- Line 3622: DisplayEffectiveness (player)
- Line 6344: DisplayEffectiveness (enemy)

### 7.2 Tous les predef dans engine/battle/core.asm (36 total)

Voir [predef_inventory.md](predef_inventory.md) pour la liste complète.

**Critiques identifiés**:
- Line 5187: UpdateHPBar2 (dans ApplyDamageToEnemyPokemon)
- Line 5291: UpdateHPBar2 (dans ApplyDamageToPlayerPokemon)
- Line 7459: MoveAnimation (déjà fixé)

### 7.3 Tous les jpfar dans engine/battle/effects.asm (24 total)

Voir [effects_analysis.md](effects_analysis.md) pour la liste complète.

**Status**: ✅ Tous protégés par JumpMoveEffect wrapper

### 7.4 Effets dans AlwaysHappenSideEffects

```
DRAIN_HP_EFFECT           ; 0x03 - MEGA_DRAIN, ABSORB
EXPLODE_EFFECT
DREAM_EATER_EFFECT
PAY_DAY_EFFECT
TWO_OR_THREE_ATTACKS_EFFECT
TWO_TO_FIVE_ATTACKS_EFFECT
ATTACK_TWICE_EFFECT
RECOIL_EFFECT
BIG_RECOIL_EFFECT
TWINEEDLE_EFFECT
ATTACK_UP_SIDE_EFFECT
BONEMERANG_EFFECT
EXPLODE_RECOIL_EFFECT
```

### 7.5 Effets dans SpecialEffects

```
DRAIN_HP_EFFECT           ; 0x03
EXPLODE_EFFECT
DREAM_EATER_EFFECT
PAY_DAY_EFFECT
SWIFT_EFFECT
TWO_OR_THREE_ATTACKS_EFFECT
TWO_TO_FIVE_ATTACKS_EFFECT
CHARGE_EFFECT
SUPER_FANG_EFFECT
SPECIAL_DAMAGE_EFFECT     ; 0x29 - Seismic Toss
FLY_EFFECT
ATTACK_TWICE_EFFECT
JUMP_KICK_EFFECT
RECOIL_EFFECT
BIG_RECOIL_EFFECT
ATTACK_UP_SIDE_EFFECT
EXPLODE_RECOIL_EFFECT
```

---

## 8. Références Techniques

### 8.1 Game Boy Bank Switching

**Adressage ROM**:
- ROM0: 0x0000-0x3FFF (toujours mappée)
- ROMX: 0x4000-0x7FFF (banque sélectionnable)

**MBC1 Control**:
```asm
ld a, BANK_NUMBER
ld [MBC1RomBank], a    ; Écrit à $2000-$3FFF
```

**hLoadedROMBank**: Variable en HRAM qui track la banque active

### 8.2 IsInArray (home/array2.asm)

```asm
IsInArray::
    ; Input: a = valeur cherchée, hl = adresse table, de = taille entrée
    ; Output: carry SET si trouvé, b = index
    ld b, 0
IsInRestOfArray::
    ld c, a
.loop
    ld a, [hl]          ; ← LIT DEPUIS BANQUE ROMX ACTIVE!
    cp -1
    jr z, .notfound
    cp c
    jr z, .found
    inc b
    add hl, de
    jr .loop
.notfound
    and a               ; carry CLEAR
    ret
.found
    scf                 ; carry SET
    ret
```

**Point critique**: `ld a, [hl]` lit depuis la banque ROMX actuellement active. Si hl pointe vers 0x4058 (SpecialEffects en bank 0x0F) mais que la banque active est 0x10, ça lit les données de 0x10:4058, PAS 0x0F:4058!

### 8.3 Différences PureRGB vs Pokered Original

**RST vectors inversés**:
```
PureRGB:           Pokered Original:
rst $00 = Bankswitch   rst $00 = PrintText
rst $08 = Predef       rst $08 = Bankswitch
```

**Macros modifiées**:
```asm
; PureRGB
MACRO callfar
    ld hl, \1
    ld b, BANK(\1)
    rst _Bankswitch    ; ← rst $00
ENDM

; Pokered original
MACRO callfar
    ld b, BANK(\1)
    ld hl, \1
    rst _Bankswitch    ; ← rst $08
ENDM
```

### 8.4 Pattern Existant: CheckIsMistBlockedMoveInBank

**Localisation**: engine/battle/battle_core_data.asm (Bank 0x10)

```asm
INCLUDE "data/battle/mist_blocked_moves.asm"

; Wrapper for CheckIsMistBlockedMove - must be in same bank as MistBlockedMoves for IsInArray to read correctly
CheckIsMistBlockedMoveInBank::
    ld de, 1
    ld hl, MistBlockedMoves
    jp IsInArray
```

**Notre implémentation suit exactement ce pattern** pour AlwaysHappenSideEffects, ResidualEffects1/2, et SpecialEffects.

---

## 9. Conclusion et Questions Ouvertes

### Ce Qui Ne Devrait PAS Être le Problème

1. ✅ Les wrappers sont dans la bonne banque (vérifié dans .sym)
2. ✅ `callfar` restaure automatiquement la banque (vérifié dans Bankswitch code)
3. ✅ Les tables contiennent les bons effets (vérifié dans hexdump ROM)
4. ✅ JumpMoveEffect restaure Bank 0x0F (vérifié dans effects.asm)

### Ce Qui DOIT Être le Problème

1. ⚠️ **La banque active n'est PAS 0x0F au moment de l'appel aux wrappers**
   - Mais pourquoi? `callfar` devrait restaurer!

2. ⚠️ **Il y a un appel caché/interruption qui change la banque**
   - Chercher dans DisplayEffectiveness, PrintCriticalOHKOText, etc.

3. ⚠️ **Le problème n'est PAS dans IsInArray mais ailleurs**
   - Peut-être que DrainHPEffect_ est appelé depuis un autre endroit?
   - Peut-être que le problème est dans DrainHPEffect_ lui-même?

4. ⚠️ **Il y a une incompatibilité ROM/émulateur**
   - Peu probable mais possible

### Prochaines Actions Recommandées

1. **PRIORITÉ 1**: Vérifier quelle banque est active avant/après chaque wrapper (section 6.1)
2. **PRIORITÉ 2**: Tracer combien de fois DrainHPEffect_ est appelé (section 6.2)
3. **PRIORITÉ 3**: Forcer Bank 0x0F avant chaque wrapper pour tester (section 6.4)
4. **PRIORITÉ 4**: Inspecter DisplayEffectiveness pour voir s'il change de banque (section 6.5)

### Questions pour un Futur Agent

1. Quelle est la banque active JUSTE AVANT `call CheckAlwaysHappenSideEffectsInBank`?
2. Est-ce que DisplayEffectiveness ou PrintCriticalOHKOText changent la banque d'une façon imprévue?
3. Y a-t-il des VBlank/LCD interrupts qui changent la banque pendant ExecutePlayerMove?
4. Est-ce que DrainHPEffect_ est appelé depuis un endroit autre que JumpMoveEffect?
5. Est-ce que le problème se reproduit avec ABSORB (même effet DRAIN_HP)?

---

**Fin du document maître - Bonne chance pour le debug!**
