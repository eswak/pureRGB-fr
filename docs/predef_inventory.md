# Inventaire complet des predef dans engine/battle/core.asm

Total: 36 predef identifiés

## Légende
- ✅ = Restauration de banque confirmée
- ❌ = Pas de restauration de banque
- ⚠️ = Restauration conditionnelle ou incertaine
- 🔍 = À vérifier
- 🟢 = Sûr (predef qui ne change pas de banque)

---

## Liste complète

### Line 169: predef CopyUncompressedPicToTilemap
**Contexte**: Copie image non compressée
**Restauration**: 🔍 À vérifier
**Criticité**: 🟢 Faible (init)

### Line 229: predef BGLayerScrollingUpdate
**Contexte**: Scrolling BG layer
**Restauration**: 🔍 À vérifier
**Criticité**: 🟢 Faible (GBC)
**Note**: gbcnote - consolidated into a predef

### Line 370: predef FlagActionPredef
**Contexte**: Action sur flag
**Restauration**: 🔍 À vérifier
**Criticité**: 🟢 Faible

### Line 373: predef FlagActionPredef
**Contexte**: Action sur flag
**Restauration**: 🔍 À vérifier
**Criticité**: 🟢 Faible

### Line 828: predef UpdateHPBar2
**Contexte**: Mise à jour barre HP
**Restauration**: 🔍 À vérifier
**Criticité**: 🟡 Moyenne (pendant combat)

### Line 1139: predef AddBCDPredef
**Contexte**: Addition BCD
**Restauration**: 🔍 À vérifier
**Criticité**: 🟢 Faible

### Line 1234: predef FlagActionPredef
**Contexte**: Clear gain exp flag
**Restauration**: 🔍 À vérifier
**Criticité**: 🟢 Faible

### Line 1363: predef FlagActionPredef
**Restauration**: 🔍 À vérifier
**Criticité**: 🟢 Faible

### Line 1366: predef FlagActionPredef
**Restauration**: 🔍 À vérifier
**Criticité**: 🟢 Faible

### Line 1539: predef FlagActionPredef
**Restauration**: 🔍 À vérifier
**Criticité**: 🟢 Faible

### Line 1544: predef FlagActionPredef
**Restauration**: 🔍 À vérifier
**Criticité**: 🟢 Faible

### Line 1691: predef AnimateSendingOutMon
**Contexte**: Animation envoi Pokémon
**Restauration**: 🔍 À vérifier
**Criticité**: 🟡 Moyenne

### Line 2022: predef LoadMonBackPic
**Contexte**: Charger sprite dos
**Restauration**: 🔍 À vérifier
**Criticité**: 🟡 Moyenne

### Line 2052: predef AnimateSendingOutMon
**Restauration**: 🔍 À vérifier
**Criticité**: 🟡 Moyenne

### Line 2072: predef CopyDownscaledMonTiles
**Restauration**: 🔍 À vérifier
**Criticité**: 🟢 Faible

### Line 2082: predef CopyDownscaledMonTiles
**Restauration**: 🔍 À vérifier
**Criticité**: 🟢 Faible

### Line 2147: predef DrawHP
**Contexte**: Dessiner HP
**Restauration**: 🔍 À vérifier
**Criticité**: 🟡 Moyenne

### Line 2681: predef StatusScreenLoop
**Contexte**: Écran de statut
**Restauration**: 🔍 À vérifier
**Criticité**: 🟡 Moyenne

### Line 2737: predef FlagActionPredef
**Restauration**: 🔍 À vérifier
**Criticité**: 🟢 Faible

### Line 2740: predef FlagActionPredef
**Restauration**: 🔍 À vérifier
**Criticité**: 🟢 Faible

### Line 3228: predef PrintMoveType
**Contexte**: Afficher type d'attaque
**Restauration**: 🔍 À vérifier
**Criticité**: 🟡 Moyenne

### Line 4202: predef PredefShakeScreenHorizontally
**Contexte**: Secouer écran
**Restauration**: 🔍 À vérifier
**Criticité**: 🟢 Faible (effet visuel)

### Line 5187: predef UpdateHPBar2
**Contexte**: Animer barre HP qui diminue
**Restauration**: 🔍 À vérifier
**Criticité**: 🔴 CRITIQUE (dans ApplyDamageToEnemyPokemon)
**Note**: POTENTIELLEMENT PROBLÉMATIQUE - appelé juste avant DrawHUDsAndHPBars

### Line 5291: predef UpdateHPBar2
**Contexte**: Animer barre HP (player)
**Restauration**: 🔍 À vérifier
**Criticité**: 🔴 CRITIQUE (dans ApplyDamageToPlayerPokemon)

### Line 6941: predef WriteMonMoves
**Contexte**: Écrire attaques
**Restauration**: 🔍 À vérifier
**Criticité**: 🟢 Faible

### Line 6971: predef IndexToPokedex
**Contexte**: Index vers Pokédex
**Restauration**: 🔍 À vérifier
**Criticité**: 🟢 Faible

### Line 6981: predef FlagActionPredef
**Contexte**: Marquer Pokémon vu
**Restauration**: 🔍 À vérifier
**Criticité**: 🟢 Faible

### Line 7024: predef BattleTransition
**Contexte**: Transition de combat
**Restauration**: 🔍 À vérifier
**Criticité**: 🟢 Faible (init)

### Line 7459: predef MoveAnimation ⚠️ DÉJÀ NOTÉ
**Contexte**: Animation d'attaque
**Restauration**: ✅ OUI (ligne 7460)
**Criticité**: 🔴 CRITIQUE
**Code**:
```asm
predef MoveAnimation
; pureGREENFRnote: Restore Battle Core bank after predef (predef can leave wrong bank active)
ld a, BANK(PlayMoveAnimation)
call SetCurBank
```
**Note**: Fix déjà appliqué dans pureGREENFR

### Line 7537: predef CopyUncompressedPicToTilemap
**Restauration**: 🔍 À vérifier
**Criticité**: 🟢 Faible (init)

### Line 7586: predef CopyUncompressedPicToTilemap
**Restauration**: 🔍 À vérifier
**Criticité**: 🟢 Faible (init)

### Line 7709: predef CopyDownscaledMonTiles
**Restauration**: 🔍 À vérifier
**Criticité**: 🟢 Faible (init)

### Line 7717: predef CopyDownscaledMonTiles
**Restauration**: 🔍 À vérifier
**Criticité**: 🟢 Faible (init)

### Line 7821: predef ScaleSpriteByTwo
**Restauration**: 🔍 À vérifier
**Criticité**: 🟢 Faible (init)

---

## Analyse de criticité

### 🔴 PRIORITÉ CRITIQUE (3)
- Line 5187: UpdateHPBar2 (dans ApplyDamageToEnemyPokemon)
- Line 5291: UpdateHPBar2 (dans ApplyDamageToPlayerPokemon)
- Line 7459: MoveAnimation (déjà fixé)

### 🟡 PRIORITÉ MOYENNE (9)
- Appels pendant l'exécution du combat
- UpdateHPBar2, DrawHP, AnimateSendingOutMon, etc.

### 🟢 PRIORITÉ FAIBLE (24)
- FlagActionPredef (multiples instances)
- Prédef d'initialisation
- Effets visuels non-critiques

---

## Suspects prioritaires

### UpdateHPBar2 dans ApplyDamage (Lines 5187, 5291)

Ces predef sont appelés JUSTE AVANT `jp DrawHUDsAndHPBars`. Si UpdateHPBar2 change de banque, cela pourrait causer des problèmes similaires au bug déjà corrigé.

**À vérifier** : Est-ce que UpdateHPBar2 restaure la banque avant de retourner ?

Si non, il faudrait ajouter une restauration de banque APRÈS UpdateHPBar2 et AVANT le jp DrawHUDsAndHPBars.

---

## Prochaines actions

1. ✅ Inventaire complet effectué
2. ⏳ Vérifier si UpdateHPBar2 restaure la banque
3. ⏳ Analyser les autres predef critiques
4. ⏳ Ajouter restaurations si nécessaire

