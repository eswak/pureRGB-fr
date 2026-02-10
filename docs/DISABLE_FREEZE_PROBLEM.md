# Problème de Freeze avec DISABLE (Entrave) — RÉSOLU

## Résolution

Le bug a été **corrigé** en modifiant 2 fichiers :
1. `home/random.asm` : `BattleRandomNonLink` réécrit pour préserver `hl` et `bc`
2. `engine/battle/effects.asm` : 20x `farcall BattleRandom` → `call BattleRandom` + 1x `farcall Random` → `call Random`

Voir `BANK_CHANGES_REFERENCE.md` §0.2 et `CHANGES_SINCE_UPSTREAM.md` §7 pour les détails complets.

## Symptômes (avant correctif)

Le jeu **plantait/freezait** quand l'ennemi utilisait **ENTRAVE (Disable)** au **1er tour**, juste après l'affichage du texte « MIMITOSS lance ENTRAVE! », et **avant** le démarrage de l'animation.

- Le texte s'affichait correctement
- Le crash survenait **avant** l'animation
- Le crash survenait **uniquement au 1er tour** (car `wPlayerLastSelectedMoveDisable = 0` → chemin `.doRandomSelection`)
- Le crash survenait **uniquement quand l'attaque touchait** (pas quand elle ratait)

## Cause racine

**Deux bugs combinés :**

### Bug 1 : `farcall BattleRandom` dans la même banque

`effects.asm` et `core.asm` sont dans la **même section "Battle Core" (banque $F)** (voir `main.asm` lignes 203-206). Utiliser `farcall` pour appeler une fonction dans la même banque passe inutilement par `Bankswitch`, qui au retour :
- Écrase `a` avec le numéro de banque ($F) au lieu de la valeur aléatoire
- Écrase `b` avec le numéro de banque
- Le macro `farcall` lui-même écrase `hl` avec l'adresse de la cible

### Bug 2 : `BattleRandomNonLink` écrasait `hl`

L'ancienne implémentation utilisait `pop hl; jp hl` pour gérer l'adresse de retour, ce qui écrasait le `hl` de l'appelant. Dans `DisableEffect.doRandomSelection`, `hl` pointait vers `wBattleMonMoves` et était utilisé après l'appel via `add hl, bc; ld a, [hl]` → lecture depuis adresse invalide → freeze.

### Pourquoi uniquement au tour 1

Au tour 1, `wPlayerLastSelectedMoveDisable = 0`, donc `b = 0`, et le code prend le chemin `.doRandomSelection` qui utilise `farcall BattleRandom` avec le pattern `push hl; farcall; add hl, bc`. Aux tours suivants, le chemin `.findPreviousMoveIndex` est pris, qui n'a pas ce problème.

## Bugs cachés supplémentaires (corrigés en même temps)

Le `farcall BattleRandom` causait aussi des bugs non-évidents dans TOUS les effets de combat :
- **Sommeil** : toujours 7 tours ($F & $7 = 7) au lieu de 1-7 aléatoire
- **Confusion** : toujours 5 tours ($F & $3 + 2 = 5) au lieu de 2-5 aléatoire
- **Multi-hit** : toujours le maximum de coups
- **Effets secondaires** : probabilités complètement faussées (`cp b` comparait la valeur "aléatoire" $F au seuil $F au lieu du vrai seuil de probabilité)
- **MimicEffect** : même pattern que Disable, copiait un move depuis une adresse invalide

## Correctif appliqué

### `home/random.asm`
```asm
BattleRandomNonLink::
	push hl          ; préserve hl de l'appelant
	push bc          ; préserve bc de l'appelant
	ldh a, [hLoadedROMBank]
	push af
	ld a, BANK(Random)
	call SetCurBank
	call Random
	ld c, a
	pop af
	call SetCurBank
	ld a, c
	pop bc
	pop hl
	ret              ; retour normal (au lieu de pop hl; jp hl)
```

### `engine/battle/effects.asm`
- 20x `farcall BattleRandom` → `call BattleRandom` (même banque $F)
- 1x `farcall Random; ldh a, [hRandomAdd]` → `call Random` (ROM0, toujours accessible)
- Suppression du code de restauration de banque redondant dans DisableEffect

## Leçons apprises

1. **Toujours vérifier `main.asm`** pour confirmer dans quelle section/banque se trouve un fichier avant d'utiliser `farcall`
2. **`farcall`/`callfar` détruisent `a`, `b`, `c`** — ne jamais les utiliser si on a besoin de ces registres après l'appel
3. **Les fonctions ROM0** (`Random`, `SetCurBank`, etc.) sont toujours accessibles via `call` depuis n'importe quelle banque
4. **Documenter la banque de chaque fichier** dans les fichiers de référence pour éviter de refaire la même erreur
