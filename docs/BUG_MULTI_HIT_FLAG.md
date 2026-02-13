# Bug: Multi-Hit Flag Non-Resetté Entre Tours

**Date découverte**: 2026-02-13
**Reproductibilité**: 100%
**Gravité**: 🔴 Critique

## Symptôme

Après avoir utilisé **Torgnoles** (Fury Swipes - attaque 2-5 fois), l'attaque suivante de l'**ennemi** (par exemple **Écras'Face** / Slam - normalement 1 fois) **se répète aussi 2-5 fois**.

## Cause Probable

Le flag `ATTACKING_MULTIPLE_TIMES` dans `wPlayerBattleStatus1` ou `wEnemyBattleStatus1` n'est pas correctement resetté entre les tours, ou il y a confusion entre les flags player/enemy.

## Localisation du Code

### Où le Flag est SET

**engine/battle/effects.asm** (effet multi-hit):
```asm
set ATTACKING_MULTIPLE_TIMES, [hl]  ; mon is now attacking multiple times
```

### Où le Flag est RESET

**engine/battle/core.asm**:

1. **Ligne 927**: Quand enemy mon faint
2. **Ligne 1263**: Quand player mon faint
3. **Ligne 3671**: Quand player termine série multi-hit
4. **Ligne 6384**: Quand enemy termine série multi-hit

## Flux Attendu vs Réel

### Attendu

1. **Tour N**: Player utilise Torgnoles
   - `set ATTACKING_MULTIPLE_TIMES` sur `wPlayerBattleStatus1`
   - Attaque 2-5 fois
   - Quand terminé: `res ATTACKING_MULTIPLE_TIMES` (ligne 3671)

2. **Tour N+1**: Enemy utilise Écras'Face
   - Flag devrait être CLEAR
   - Attaque 1 fois seulement

### Réel

1. **Tour N**: Player utilise Torgnoles
   - `set ATTACKING_MULTIPLE_TIMES`
   - Attaque 2-5 fois
   - Flag pas correctement resetté ❌

2. **Tour N+1**: Enemy utilise Écras'Face
   - Flag encore actif ❌
   - Attaque 2-5 fois (reprend le compte de Torgnoles)

## Hypothèses

### H1: Mauvais Registre HL à Ligne 3671

À la ligne 3671:
```asm
res ATTACKING_MULTIPLE_TIMES, [hl]
```

**Question**: Est-ce que `hl` pointe vraiment vers `wPlayerBattleStatus1`?

Vérifions le code avant:
```asm
ld hl, wPlayerBattleStatus1  ; ligne 3663
bit ATTACKING_MULTIPLE_TIMES, [hl]  ; ligne 3664
jr z, .executeOtherEffects  ; ligne 3665
; ... code ...
res ATTACKING_MULTIPLE_TIMES, [hl]  ; ligne 3671 ← hl devrait toujours pointer vers wPlayerBattleStatus1
```

Entre ligne 3664 et 3671, **hl n'est pas modifié** dans le code visible. Donc hl devrait pointer vers wPlayerBattleStatus1. ✅

### H2: Confusion Player/Enemy Flags

**Attaque multi-hit effect** set le flag sur le **bon** BattleStatus (player ou enemy selon qui attaque)?

**À vérifier dans effects.asm**: Quel registre est utilisé?

### H3: Le Flag est Partagé ou Corrompu

Peut-être que `wPlayerBattleStatus1` et `wEnemyBattleStatus1` partagent des bits ou sont adjacents en mémoire et il y a corruption?

### H4: wPlayerNumAttacksLeft Pas Resetté

Le compteur `wPlayerNumAttacksLeft` pourrait rester à une valeur non-zéro et être réutilisé par l'ennemi au tour suivant.

**À vérifier**: Est-ce que wPlayerNumAttacksLeft est resetté quelque part?

## Actions de Debug

### Action 1: Vérifier que hl Pointe Bien vers wPlayerBattleStatus1

Ajouter avant ligne 3671:
```asm
push hl
ld de, wPlayerBattleStatus1
ld a, h
cp d
jr nz, .wrong
ld a, l
cp e
jr nz, .wrong
pop hl
; Continue normalement
.wrong
; PANIC - hl ne pointe pas où on pense!
```

### Action 2: Forcer Reset des Deux Flags

À la fin de chaque tour, forcer:
```asm
ld hl, wPlayerBattleStatus1
res ATTACKING_MULTIPLE_TIMES, [hl]
ld hl, wEnemyBattleStatus1
res ATTACKING_MULTIPLE_TIMES, [hl]
```

### Action 3: Vérifier effects.asm

Chercher dans effects.asm le code qui set le flag et vérifier qu'il set le bon (player vs enemy).

### Action 4: Tracer les Valeurs

Ajouter des prints pour afficher:
- État du flag avant/après multi-hit
- Valeur de wPlayerNumAttacksLeft
- Valeur de wEnemyNumAttacksLeft

## Relation avec Bugs Bank Switching

Ce bug pourrait être **complètement indépendant** des bugs bank switching (Seismic Toss, MEGA_DRAIN).

**OU** il pourrait être **lié** si les fonctions qui resetent le flag sont dans une mauvaise banque et ne s'exécutent pas correctement.

## Priorité

🔴 **CRITIQUE** - Ce bug affecte le gameplay de base et rend certains combats injouables.

À corriger **en parallèle** avec les bugs bank switching.

---

*Document créé le 2026-02-13 suite à la découverte du bug Torgnoles → Écras'Face*
