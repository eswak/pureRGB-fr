# Changements depuis upstream/master

**Note importante** : Ce projet est **PureGREEN-fr**, un fork de pureRGB. Par conséquent, tous les commentaires de code utilisent le préfixe **`pureGREENFRnote`** au lieu de `PureRGBnote`.

Ce document liste les changements majeurs introduits depuis `upstream/master`.

## 1. Traduction française

### Changements dans les fichiers de texte

Les textes ont été traduits en français et **réorganisés dans différentes banques ROM** car les textes français prennent plus de place que les textes anglais.

**Fichiers modifiés** :
- `data/text/text_1.asm` à `text_7.asm` : Textes traduits
- `data/text/text_2.asm` : Contient maintenant `_MonName1Text`, `_UsedText`, `_MoveNameText` (utilisés par `PrintMonName1Text`)
- `text.asm` : Réorganisation des sections "Text 1" à "Text 16"

**Impact sur les banques** :
- Les textes français sont maintenant dans la section **"Text 2"** (banque différente de Battle Core)
- `PrintMonName1Text` utilise plusieurs `text_far` consécutifs qui chargent des textes depuis différentes banques
- Chaque `text_far` change de banque ROM pour charger le texte, puis devrait restaurer la banque

### Changements dans le moteur de texte

**Fichier** : `home/window.asm`
- **Ajout de `WrapperCallBattleCoreThenRestoreBank`** : Wrapper pour restaurer la banque Battle Core après `PrintMonName1Text`
- Utilisé dans `EnemyCanExecuteMove` et `PlayerCanExecuteMove` pour garantir que la banque est correcte après l'affichage du texte

**Fichier** : `home/text.asm`
- `TextCommand_FAR` : Gère les `text_far` qui chargent du texte depuis d'autres banques
- Sauvegarde la banque actuelle, charge la banque du texte, traite le texte, puis restaure la banque

## 2. Système de Pokémon Shiny

### Nouveaux fichiers

- `custom_functions/func_shiny.asm` : Fonctions pour gérer les Pokémon shiny
- `custom_functions/func_enhancedcolor.asm` : Gestion des couleurs améliorées pour GBC

### Changements dans les fichiers de combat

**Fichier** : `engine/battle/core.asm`
- Ajout de code pour afficher le symbole shiny et les palettes lors de l'envoi d'un Pokémon
- `ShinyEnemyPaletteAndSymbolOnly` : Affiche le symbole shiny pour les Pokémon ennemis
- Modifications dans `StartBattle` et `SlidePlayerAndEnemySilhouettesOnScreen`

**Fichier** : `engine/battle/init_battle_variables.asm`
- Initialisation des flags shiny

**Fichier** : `engine/gfx/palettes.asm`
- Gestion des palettes shiny

**Fichier** : `engine/pokemon/status_screen.asm`
- Affichage shiny dans l'écran de statut

### Changements dans les DVs

**Fichier** : `engine/battle/core.asm`
- `LoadEnemyMonData` : `call BattleRandom` x2 → `farcall DetermineWildMonDVs`
- Les DVs sauvages (shiny) sont maintenant calculés dans une autre banque

## 3. Rematch de dresseurs

**Fichier** : `home/trainers.asm`
- Ajout de code pour gérer les rematchs de dresseurs
- `CheckForEngagingTrainers` : Vérifie si un dresseur veut faire un rematch

## 4. Superbonbons après victoire de dresseur

**Fichier** : `engine/battle/core.asm`
- `TrainerBattleVictory` : Ajout de code pour donner un superbonbon après une victoire de dresseur
- Option contrôlée par `BIT_TRAINER_CANDIES` dans `wOptions3`
- Utilise `callfar GiveItemFromWram` (car `callfar` écrase `bc`)

**Fichier** : `home/give.asm`
- `GiveItemFromWram` : Utilise `wCurItem` / `wItemQuantity` en WRAM pour les appels `callfar`

## 5. Modifications Mew et Dracolosse

**Fichiers** :
- `data/pokemon/base_stats/mew.asm` : Modifications des stats de base de Mew
- `data/pokemon/base_stats/dragonite.asm` : Modifications des stats de base de Dracolosse

## 6. Sprite du joueur

**Fichiers** :
- `gfx/sprites/red.png` : Nouveau sprite du joueur
- `gfx/sprites/red_bike.png` : Sprite du joueur à vélo
- `gfx/player/red.png` : Sprite du joueur pour l'écran de statut
- Modifications dans `engine/battle/draw_hud_pokeball_gfx.asm`

## 7. Changements dans BattleRandom

### `home/random.asm` (ROM0)

**`BattleRandomNonLink`** :
- Routine en ROM0 appelée depuis `BattleRandom` (banque $F) quand ce n'est pas un combat en lien
- Sauvegarde/restaure la banque, appelle `Random` (ROM0), retourne la valeur aléatoire dans `a`
- **Préserve `hl` et `bc`** (important : l'appelant utilise `hl` pour les listes de moves dans DisableEffect/MimicEffect, et `b` pour la précision dans MoveHitTest)
- Utilise `push/pop` + `ret` (et non `pop hl; jp hl` qui écrasait `hl`)

**`Random`** (ROM0) :
- Toujours accessible via `call Random` depuis n'importe quelle banque
- Préserve `hl`, `de`, `bc`, retourne le résultat dans `a`
- Pas besoin de `farcall Random; ldh a, [hRandomAdd]` — un simple `call Random` suffit

### `engine/battle/core.asm` (banque $F)

- `BattleRandom` : utilise `call BattleRandomNonLink` au lieu de l'ancien `jp nz, Random`
- Raison : `Random_` (l'implémentation réelle du RNG) est dans "Battle Engine 1" (banque différente), donc `jp nz, Random` depuis la banque $F ne fonctionnerait pas correctement

### `engine/battle/effects.asm` (banque $F — MÊME section que core.asm)

> **⚠️ POINT CRITIQUE** : `effects.asm` et `core.asm` sont dans la **même section "Battle Core"** (banque $F), définie dans `main.asm` lignes 203–206. Les appels entre ces fichiers doivent utiliser `call`, **PAS** `farcall`.

**Correctif appliqué** : tous les `farcall BattleRandom` (20 occurrences) remplacés par `call BattleRandom`.

**Raison du bug original** : `farcall` passe par `Bankswitch` qui écrase `a` (valeur aléatoire → numéro de banque $F), `b` (seuil de probabilité → numéro de banque $F), et `hl` (pointeur vers données → adresse de la cible farcall). Cela causait :
- Valeurs aléatoires toujours identiques ($F & $7 = 7, $F & $3 = 3, etc.)
- Freeze Disable au tour 1 (lecture mémoire depuis adresse invalide via `hl` écrasé)
- Bug MimicEffect (même pattern de `hl` écrasé)
- Probabilités d'effets secondaires faussées (`cp b` comparait à $F au lieu du seuil)

**Effets concernés** : SleepEffect, PoisonEffect, FreezeBurnParalyzeEffect, StatModifierDownEffect, ThrashPetalDanceEffect, TeleportWildPokemon, TwoToFiveAttacksEffect, FlinchSideEffect, TrappingEffect, ConfusionSideEffect, ConfusionBigSideEffect, ConfusionEffect, MimicEffect, DisableEffect, TriAttackEffect.

Le `farcall Random` dans **TrappingEffect** a aussi été remplacé par `call Random` (ROM0, toujours accessible).

## 8. Changements dans JumpMoveEffect

**Fichier** : `engine/battle/effects.asm`
- **Ajout de restauration de banque** : Après `_JumpMoveEffect`, restaure la banque Battle Core avant de retourner
- Commentaire : "effect routines (e.g. Disable) may call _PrintText which leaves wrong bank"

## 9. Changements dans le layout des banques

**Fichier** : `layout.link`
- Réorganisation des sections pour accommoder les textes français plus longs
- Ajout de nouvelles sections "Text" pour répartir les textes

## 10. Changements dans les constantes

**Fichiers** :
- `constants/charmap.asm` : Ajout de caractères français (accents, etc.)
- `constants/event_constants.asm` : Nouvelles constantes d'événements
- `constants/misc_constants.asm` : Nouvelles constantes diverses
- `constants/ram_constants.asm` : Nouvelles constantes RAM

## 11. Changements dans les données

**Fichiers traduits** :
- `data/items/names.asm` : Noms d'objets
- `data/moves/names.asm` : Noms d'attaques
- `data/moves/field_move_names.asm` : Noms des attaques de terrain
- `data/pokemon/names.asm` : Noms de Pokémon
- `data/pokemon/dex_text.asm` : Textes du Pokédex
- `data/pokemon/dex_entries.asm` : Entrées du Pokédex
- `data/trainers/names.asm` : Noms de dresseurs
- `data/types/names.asm` : Noms de types
- `data/battle/stat_names.asm` : Noms de stats
- `data/battle/stat_mod_names.asm` : Noms de modifications de stats

## 12. Changements dans les menus

**Fichiers** :
- `engine/menus/pokedex.asm` : Ajout de `SetCurBank` autour des lectures d'entrées Pokédex
- `engine/menus/multi_choice_menu.asm` : Modifications pour la traduction
- `engine/menus/options_menu.asm` et variantes : Nouvelles options (shiny, superbonbons, etc.)

## 13. Changements dans les graphismes

**Fichiers** :
- `gfx/font/font.png` : Nouvelle police avec caractères français
- `gfx/font/font_battle_extra.png` : Police supplémentaire pour le combat
- `gfx/font/font_extra.png` : Police supplémentaire
- `gfx/battle/battle_hud_3.png` : Modifications de l'interface de combat

## Résumé des changements liés aux banques

Les changements suivants modifient la gestion des banques ROM :

1. **Traduction française** : Textes déplacés vers d'autres banques, utilisation de `text_far` multiples
2. **BattleRandom** : `BattleRandomNonLink` en ROM0 gère le changement de banque vers `Random`. Préserve `hl`, `bc`.
3. **effects.asm** : utilise `call BattleRandom` (même banque $F) et `call Random` (ROM0) — **PAS** `farcall`
4. **WrapperCallBattleCoreThenRestoreBank** : Wrapper ROM0 pour restaurer la banque après `PrintMonName1Text`
5. **JumpMoveEffect** : Restauration de banque avant le retour

## Fichiers critiques pour le debug de problèmes de banques

1. `main.asm` lignes 203–206 : **définition de la section "Battle Core"** — prouve que `core.asm` et `effects.asm` sont dans la même banque $F
2. `engine/battle/core.asm` : Flux ennemi/joueur, `BattleRandom`, `PrintMonName1Text`
3. `engine/battle/effects.asm` : Effets de combat, `DisableEffect`, `JumpMoveEffect`
4. `home/random.asm` : `BattleRandomNonLink` (ROM0, préserve `hl`/`bc`), `Random` (ROM0)
5. `home/bankswitch.asm` : `Bankswitch` (détruit `a`/`b`/`c`), `SetCurBank`
6. `home/window.asm` : `WrapperCallBattleCoreThenRestoreBank`
7. `layout.link` : Assignation des sections aux banques ROM

## Commandes Git utiles

```bash
# Voir tous les fichiers modifiés
git diff upstream/master --name-only

# Voir les changements dans un fichier spécifique
git diff upstream/master engine/battle/core.asm

# Voir l'historique des commits
git log --oneline upstream/master..HEAD

# Voir les changements liés aux banques
git diff upstream/master --name-only -- '*.asm' | while read f; do
  git diff upstream/master -- "$f" | grep -qE '[Bb]ank|SetCurBank|Bankswitch|farcall|callfar|jpfar|predef|hLoadedROMBank' && echo "$f"
done
```
