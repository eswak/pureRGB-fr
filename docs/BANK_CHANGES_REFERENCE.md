# Référence des changements de banque (diff upstream/master)

Ce fichier liste **tous les changements liés aux banques ROM** introduits par rapport à `upstream/master`. Il sert à repérer d'éventuels bugs similaires (mauvaise banque active après un appel, crash type Wrap/Bind).

## 0. Bugs corrigés liés aux banques — résumé

### 0.1 Crash Ligotage / Bind (et chaîne d'animation)

- **Symptôme** : plantage (souvent PC = 0x0040) après le texte « X lance LIGOTAGE! », avant ou pendant l'animation.
- **Cause** : dans `engine/battle/animations.asm`, **Func_78e98** était en boucle infinie et ne retournait pas correctement après un **jpfar**.
- **Correctif** : fin de **Func_78e98** réécrite : `pop hl` (adresse de retour vers Bankswitch), `jp hl`. Ne pas dépiler le saved af — Bankswitch fera lui‑même `pop bc` et restaurera la banque.

### 0.2 Freeze Entrave / Disable + Aléatoire cassé dans tous les effets de combat (CORRIGÉ)

- **Symptôme principal** : freeze quand l'ennemi utilise Entrave (Disable) au 1er tour, après le texte mais avant l'animation.
- **Symptômes cachés** : sommeil toujours 7 tours, confusion toujours 5 tours, multi-hit toujours max, probabilités d'effets secondaires (poison, brûlure, paralysie, flinch) complètement faussées.
- **Cause racine** : `farcall BattleRandom` était utilisé dans `effects.asm` alors que **`effects.asm` et `core.asm` sont dans la MÊME banque $F** (section "Battle Core" dans `main.asm`). Le macro `farcall` passe par `Bankswitch` qui, au retour :
  1. **Écrase `a`** avec le numéro de banque sauvegardé (donc `a` = $F au lieu de la valeur aléatoire)
  2. **Écrase `b`** avec le numéro de banque (donc `cp b` compare au numéro de banque au lieu du seuil de probabilité)
  3. **Écrase `hl`** (le macro farcall fait `ld hl, target` avant l'appel)
- **Bug Disable spécifique** : dans `.doRandomSelection`, `hl` devait pointer vers `wBattleMonMoves` après `BattleRandom`. Comme `hl` était écrasé, `add hl, bc; ld a, [hl]` lisait depuis une adresse invalide → freeze ou comportement indéfini.
- **Bug identique dans MimicEffect** : même pattern `push hl; farcall BattleRandom; add hl, bc; ld a, [hl]; pop hl`.
- **Correctif (2 fichiers)** :
  1. **`home/random.asm`** : `BattleRandomNonLink` réécrit pour préserver `hl` et `bc` (utilise `push/pop` + `ret` au lieu de `pop hl; jp hl`)
  2. **`engine/battle/effects.asm`** : tous les `farcall BattleRandom` (20 occurrences) remplacés par `call BattleRandom` (même banque, pas besoin de Bankswitch). Le `farcall Random` dans TrappingEffect remplacé par `call Random` (ROM0, toujours accessible). Code de restauration de banque redondant supprimé dans DisableEffect.
- **Économie** : ~52 octets libérés dans la section Battle Core (qui était proche de la limite de 0x4000).

**Effets corrigés** : SleepEffect, PoisonEffect, FreezeBurnParalyzeEffect, StatModifierDownEffect, ThrashPetalDanceEffect, TeleportWildPokemon, TwoToFiveAttacksEffect, FlinchSideEffect, TrappingEffect, ConfusionSideEffect, ConfusionBigSideEffect, ConfusionEffect, MimicEffect, DisableEffect, TriAttackEffect.

---

## 1. Layout des banques (rappel)

| Banque | Section(s) | Fichiers principaux |
|--------|------------|----------------------|
| ROM0   | Home, RST, VBlank ($0040) | `home/*.asm`, `main.asm` (header) |
| ROMX $E | Battle Engine 3–7, **Predefs**, Slot Machines | predefs, move effects individuels |
| ROMX $F | **Battle Core** | `engine/battle/core.asm` **ET** `engine/battle/effects.asm` |
| ROMX $10 | Battle Core Data, bank10 | `engine/battle/battle_core_data.asm` |
| ROMX $11+ | Maps, Pics, etc. | divers |

> **⚠️ IMPORTANT** : `effects.asm` est dans la **même section "Battle Core" (banque $F)** que `core.asm` !
> Voir `main.asm` lignes 203–206 :
> ```asm
> SECTION "Battle Core", ROMX
> INCLUDE "engine/battle/core.asm"
> INCLUDE "engine/battle/effects.asm"
> ```
> En conséquence, les appels entre `core.asm` et `effects.asm` doivent utiliser `call` (même banque), **PAS** `farcall`/`callfar`.

- **Battle Core** = banque $0F. Tout le flux « tour de combat » (EnemyCanExecuteMove, PlayerCanExecuteMove, PlayMoveAnimation, etc.) **ET tous les effets de combat** (DisableEffect, SleepEffect, etc.) sont dans cette banque.
- **Predef** : sauvegarde la banque appelante dans `wPredefParentBank`, fait le travail, puis restaure avec `jp SetCurBank` (pop af = banque sauvegardée).
- **RST _Bankswitch / farcall / callfar** : pousse AF (banque courante), passe en banque `b`, exécute `jp hl`, au retour dépile et restaure la banque. **Attention** : au retour, `a` et `b` sont écrasés par le numéro de banque sauvegardé, et `c` par les flags. Seuls `d`, `e`, `h`, `l` et les **flags CPU** (Z, C, N, H) sont préservés depuis la fonction appelée.

---

## 2. Fichiers modifiés avec impact « banque »

### 2.1 `engine/battle/core.asm` (Battle Core, banque $F)

| Contexte | Changement | Raison |
|----------|------------|--------|
| **EnemyCanExecuteMove** | `call PrintMonName1Text` → `ld a, BANK(EnemyCanExecuteMove)` + `ld hl, PrintMonName1Text` + `ld b, BANK(PrintMonName1Text)` + `call WrapperCallBattleCoreThenRestoreBank` | Le moteur de texte (text_far) peut laisser une mauvaise banque active → crash après « X lance LIGOTAGE! ». |
| **PlayerCanExecuteMove** | Idem avec `BANK(PlayerCanExecuteMove)` et `WrapperCallBattleCoreThenRestoreBank` | Même correctif côté joueur. |
| **ResidualEffects1 (ennemi)** | `jp c, JumpMoveEffect` → `call c, JumpMoveEffect` | Pour que le retour revienne bien dans le flux et qu'on enchaîne sur SpecialEffectsCont (éviter boucle/crash Wrap/Bind). |
| **ResidualEffects1 (joueur)** | `jp c, JumpMoveEffect` → `call c, JumpMoveEffect` | Même correctif. |
| **GetCurrentMove** | `jp CopyToStringBuffer` → `call CopyToStringBuffer` + `ret` | CopyToStringBuffer est en ROM0 ; pas de Bankswitch, pas de changement de banque. Évite un retour dans la mauvaise banque. |
| **EnemyTrappingContinuation** | Nouveau label : rechargement des données de l'attaque (FarCopyData) puis `jp GetEnemyAnimationType` | Pas d'appel à GetCurrentMove (qui change de banque / texte) quand on continue un trapping. |
| **PlayerTrappingContinuation** | Nouveau label : `jp getPlayerAnimationType` | Même idée : pas GetCurrentMove sur continuation trapping. |
| **playEnemyMoveAnimation** | Avant `call PlayMoveAnimation` : `push af` / `ld a, BANK(PlayMoveAnimation)` / `call SetCurBank` / `pop af` | Garantir banque Battle Core avant l'animation ; `a` doit garder l'ID du move pour PlayMoveAnimation. |
| **playPlayerMoveAnimation** | Même séquence avant `call PlayMoveAnimation` | Idem côté joueur. |
| **PlayMoveAnimation** | Après `predef MoveAnimation` : `ld a, BANK(PlayMoveAnimation)` + `call SetCurBank` puis `jpfar Func_78e98` | Restaurer Battle Core après le predef (au cas où le predef laisse une autre banque active). |
| **TrainerBattleVictory** | `predef_jump AddBCDPredef` → `predef AddBCDPredef` + bloc `callfar GiveItemFromWram` (wCurItem/wItemQuantity en WRAM car callfar écrase bc) | Don d'objet depuis une autre banque sans perdre les args. |
| **LoadEnemyMonData (wild)** | `call BattleRandom` x2 → `farcall DetermineWildMonDVs` | DVs sauvages (shiny) dans une autre banque. |
| **CheckIsMistBlockedMove** | Code local (IsInArray sur MistBlockedMoves) → `callfar CheckIsMistBlockedMoveInBank` | Tables déplacées dans Battle Core Data (banque $10). |
| **CalcCriticalHitRate** | Boucle locale sur HighCriticalMoves → `callfar CalcCriticalHitRateInBank` | Idem, données en banque $10. |

Tout appel **farcall** / **callfar** / **rst _Bankswitch** depuis Battle Core doit soit être suivi d'un retour explicite dans la banque $F (ex. SetCurBank), soit le sous-programme cible doit garantir la restauration (ex. Bankswitch).

---

### 2.2 `engine/battle/battle_core_data.asm` (nouveau, banque $10)

- **CheckIsMistBlockedMoveInBank** : wrapper qui fait `ld de, 1` + `ld hl, MistBlockedMoves` + `jp IsInArray` (doit être dans la même banque que les données).
- **CalcCriticalHitRateInBank** : boucle sur `HighCriticalMoves` (même banque).
- Créé pour déborder la Battle Core (dépassement de taille) ; tout appel depuis la Battle Core vers ces routines se fait en **callfar**.

---

### 2.3 `engine/battle/effects.asm` (banque $F — MÊME banque que Battle Core)

> **⚠️** Ce fichier est dans la section "Battle Core" (banque $F), **PAS** en banque $E.
> Les appels vers `BattleRandom` ou toute routine dans `core.asm` doivent utiliser `call`, pas `farcall`.

- Historique du bug : `call BattleRandom` avait été remplacé par `farcall BattleRandom` (20 occurrences) sur la base d'une erreur de documentation (croyance que effects.asm était en banque $E). Ce remplacement cassait la valeur de retour dans `a` et les registres `b` et `hl`.
- **Correctif** : tous remis en `call BattleRandom`. Le `farcall Random` dans TrappingEffect remplacé par `call Random` (ROM0, toujours accessible directement).
- `JumpMoveEffect` : restaure la banque Battle Core après `_JumpMoveEffect` (les routines d'effet peuvent appeler `_PrintText` qui laisse une mauvaise banque).

---

### 2.4 `home/random.asm` (ROM0)

- **`BattleRandomNonLink`** : appelé depuis `BattleRandom` (banque $F) quand ce n'est pas un combat en lien.
  - Sauvegarde/restaure la banque, appelle `Random` (ROM0) qui fait `farcall Random_` en interne.
  - **Préserve `hl` et `bc`** (utilise `push/pop` + `ret`).
  - Retourne la valeur aléatoire dans `a`.
  - ⚠️ Ancienne version utilisait `pop hl; jp hl` qui écrasait `hl` de l'appelant → causait le freeze Disable et le bug Mimic.
- **`Random`** : en ROM0, toujours accessible via `call Random` depuis n'importe quelle banque. Préserve `hl`, `de`, `bc`. Retourne la valeur dans `a`.

---

### 2.5 `home/window.asm` (ROM0)

- **WrapperCallBattleCoreThenRestoreBank** :
  `a` = banque à restaurer, `hl` = adresse à appeler, `b` = banque de `(hl)`.
  Sauvegarde `a`, passe en banque `b`, pousse une adresse de retour dans le wrapper, `jp hl`. Au retour, restaure la banque avec `a` puis `ret`.
  Utilisé uniquement pour **PrintMonName1Text** depuis Battle Core (ennemi et joueur).

---

### 2.6 `home/give.asm` (ROM0 / Home)

- **GiveItemFromWram** : commentaire indiquant qu'on utilise `wCurItem` / `wItemQuantity` pour les appels **callfar** depuis d'autres banques (car callfar écrase `b`/c avec banque/adresse).

---

### 2.7 `engine/menus/pokedex.asm` (banque variable)

- Ajouts **SetCurBank** / **hLoadedROMBank** autour des lectures d'entrées Pokédex (données en bank10) et pour le texte (text_far).
- Plusieurs blocs « switch to bank, read, switch back » et commentaires du type « Dex entries in bank10 ».

---

### 2.8 `home/predef.asm` (ROM0)

- Non modifié dans le diff, mais **important** : Predef sauve la banque appelante dans `wPredefParentBank` et fait `push af` (cette banque), puis à la fin `pop af` + `jp SetCurBank`. Donc en théorie la banque est restaurée après un predef. Si un predef ou une routine appelée par lui change la banque sans restaurer, on peut quand même se retrouver en mauvaise banque ; d'où la restauration explicite après `predef MoveAnimation` dans PlayMoveAnimation.

---

### 2.9 Autres fichiers (farcall / callfar / predef uniquement)

- **custom_functions/func_shiny.asm** : nombreux **farcall** (Random, Check*ShinyDVs, PlaySelectedAnimation, etc.). Utilise `farcall Random; ldh a, [hRandomAdd]` comme contournement (fonctionnel mais verbeux — `call Random` suffirait car Random est en ROM0).
- **engine/gfx/palettes.asm** : farcall (CheckEnemyShinyDVs, ShinyEnemyMon, MakeOverworldBGMapAttributes, etc.).
- **engine/pokemon/status_screen.asm** : farcall (CheckLoadedShinyDVs, ShinyStatusScreen).
- **home/vblank.asm** : farcall (GBCEnhancedRedrawRowOrColumn).
- **home/trainers.asm** : utilisation de SetCurBank / banque (à vérifier dans le diff si besoin).
- **engine/menus/text_box.asm** : commentaire sur copie de nom vers wStringBuffer pour PlaceString (home).
- **engine/gbc/bg_map_attributes.asm** : rVBK / VRAM bank (pas ROM bank).
- **macros/farcall.asm** : alias **callba** = farcall.
- **ram/wram.asm** / **ram/wram2.asm** : commentaires sur WRAM bank 0 vs 2 (GBC), pas ROM.

---

## 3. Règles critiques pour éviter les bugs « banque »

### 3.1 Comprendre ce que `farcall`/`callfar` détruit

```
Après farcall/callfar (Bankswitch) :
  a  = ÉCRASÉ (numéro de banque sauvegardé)
  b  = ÉCRASÉ (numéro de banque sauvegardé)
  c  = ÉCRASÉ (flags du push af initial)
  d  = préservé (valeur de la fonction appelée)
  e  = préservé (valeur de la fonction appelée)
  h  = préservé (valeur de la fonction appelée)
  l  = préservé (valeur de la fonction appelée)
  Flags (Z, C, N, H) = préservés (de la fonction appelée)
```

**Conséquence** : ne JAMAIS utiliser `a`, `b` ou `c` après un `farcall`/`callfar` pour récupérer une valeur de retour. Utiliser les flags, `d`/`e`/`h`/`l`, ou des variables en mémoire (WRAM/HRAM).

### 3.2 Quand utiliser `call` vs `farcall`

- **`call`** : la cible est dans la **même banque** que l'appelant, ou en **ROM0** (toujours accessible). Préserve tous les registres sauf ceux modifiés par la fonction appelée.
- **`farcall`/`callfar`** : la cible est dans une **autre banque**. Passe par Bankswitch. Détruit `a`, `b`, `c`.
- **Fonctions ROM0** (`Random`, `SetCurBank`, `PrintText`, etc.) : toujours accessibles via `call` depuis n'importe quelle banque.

### 3.3 Points de risque spécifiques

1. **Après tout predef** appelé depuis Battle Core
   - Le predef est censé restaurer la banque ; si une sous-routine du predef change de banque et ne restaure pas, on peut être en mauvaise banque au retour.
   - **Déjà corrigé** : après `predef MoveAnimation` dans `PlayMoveAnimation` (SetCurBank Battle Core avant jpfar).

2. **Après tout rst _Bankswitch / callfar / farcall** depuis Battle Core
   - Bankswitch sauve et restaure la banque au retour. Si le code appelé fait un **ret** alors que la pile attend un retour Bankswitch (ex. jpfar qui ne « retourne » pas proprement), on peut sauter n'importe où (ex. vecteur VBlank $0040).
   - Vérifier que **jpfar** n'est utilisé que vers des routines qui ne font pas un simple `ret` vers l'appelant (ou que la pile est gérée correctement).

3. **Chaîne texte (PrintMonName1Text, text_far, CopyToStringBuffer)**
   - Déjà corrigé avec WrapperCallBattleCoreThenRestoreBank et avec `call CopyToStringBuffer` + `ret` au lieu de `jp CopyToStringBuffer` depuis GetCurrentMove.

4. **Trapping (Wrap/Bind)**
   - Continuation sans recalcul : ne pas appeler GetCurrentMove (risque banque/texte). Utiliser EnemyTrappingContinuation / PlayerTrappingContinuation.
   - ResidualEffects1 : utiliser `call c, JumpMoveEffect` et non `jp c, JumpMoveEffect`.

5. **Animation (PlayMoveAnimation → predef MoveAnimation → jpfar Func_78e98)**
   - Restauration Battle Core après le predef (déjà en place).
   - **Correction importante** : `Func_78e98` (dans `engine/battle/animations.asm`) était en boucle infinie (fall-through + ret) et ne devait pas dépiler le saved af : seulement `pop hl` puis `jp hl` pour revenir à Bankswitch, qui fait alors `pop bc` et restaure la banque.

---

## 4. Checklist pour chercher d'autres bugs similaires

- [x] `effects.asm` : tous les `farcall BattleRandom` remplacés par `call BattleRandom` (même banque $F)
- [x] `effects.asm` : `farcall Random` dans TrappingEffect remplacé par `call Random` (ROM0)
- [x] `home/random.asm` : `BattleRandomNonLink` préserve `hl` et `bc`
- [ ] Depuis Battle Core : après chaque **predef**, y a-t-il une raison de forcer `ld a, BANK(...)` + `call SetCurBank` ?
- [ ] Depuis Battle Core : après chaque **callfar** / **farcall** dont la cible peut changer la banque en interne, la banque est-elle bien Battle Core au retour ?
- [ ] Tout **jp c, JumpMoveEffect** ou équivalent depuis le flux principal de tour de combat est-il bien **call c, JumpMoveEffect** ?
- [ ] Toute utilisation de **GetCurrentMove** sur un tour de continuation trapping est-elle évitée ?
- [ ] Tout appel à une routine « texte » depuis Battle Core passe-t-il par un wrapper qui restaure la banque ?
- [ ] Les `farcall Random; ldh a, [hRandomAdd]` dans `func_shiny.asm` pourraient être simplifiés en `call Random` (ROM0).

---

## 5. Génération de cette liste

Pour régénérer la liste des fichiers .asm touchés par des changements « banque » par rapport à upstream :

```bash
cd pureRGB
git diff upstream/master --name-only -- '*.asm' | while read f; do
  git diff upstream/master -- "$f" | grep -qE '[Bb]ank|SetCurBank|Bankswitch|farcall|callfar|jpfar|predef|hLoadedROMBank' && echo "$f"
done
```

Puis inspecter chaque fichier avec `git diff upstream/master -- <fichier>` pour les lignes concernées.
