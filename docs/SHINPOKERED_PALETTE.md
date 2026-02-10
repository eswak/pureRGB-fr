# Analyse : Import des couleurs améliorées (Enhanced GBC Colors) depuis shinpokered

## Contexte

Le dossier `shinpokered` contient un fork de pokered qui introduit un système de couleurs améliorées pour Game Boy Color. Ce système permet d'attribuer une palette de couleurs par tile sur l'overworld (au lieu d'une seule palette pour tout l'écran), offrant un rendu visuel beaucoup plus riche.

Dans pureRGB/pureGREENFR, ce système a été importé comme option **Y3** dans le menu d'options COLORS (Y1 → Y2 → Y3 en appuyant sur A).

Ce document analyse les différences entre shinpokered et pureRGB pour identifier les changements manquants qui empêchent Y3 de fonctionner correctement.

---

## Architecture du système de couleurs améliorées

### Fichiers principaux

| Fichier | Rôle |
|---------|------|
| `custom_functions/func_enhancedcolor.asm` | Implémentation principale : palettes, mapping tiles→couleurs, transferts VRAM |
| `engine/gfx/palettes.asm` | Intégration dans le système de palettes existant |
| `engine/menus/options_menu2.asm` | Interface utilisateur (option Y3 dans le menu) |
| `home/vblank.asm` | Mise à jour des attributs de couleur pendant le VBlank |
| `home/vcopy.asm` | Sauvegarde du flag row/column pour le VBlank |
| `engine/gbc/gbc_fade.asm` | Fonctions de correction gamma (GetRGB, GammaConv, etc.) |
| `constants/ram_constants.asm` | Constantes (BIT_ENH_GBC_COLORS, etc.) |

### Fonctionnement

1. **Activation** : L'utilisateur sélectionne Y3 dans les options. Cela met :
   - `wOptions2` bits 0-1 = `%11` (Yellow)
   - `wOptions2` bit 6 = 1 (Yellow2 / palettes secondaires)
   - `wUnusedD721` bit 7 = 1 (Enhanced colors activé)

2. **Overworld** : Quand `SetPal_Overworld` est appelé :
   - Vérifie `hGBC != 0` ET `wUnusedD721` bit 7 = 1
   - Set bit 4 de `hFlagsFFFA` (flag "mode enhanced overworld actif")
   - Appelle `MakeOverworldBGMapAttributes` → construit une table d'attributs BG map (32x32) dans WRAM bank 2
   - Appelle `TransferGBCEnhancedBGMapAttributes` → transfère vers VRAM bank 1
   - Appelle `TransferGBCEnhancedOverworldPalettes` → charge les 8 palettes de couleurs

3. **Mises à jour en temps réel** :
   - Quand le joueur se déplace, `RedrawRowOrColumn` sauvegarde un flag dans `$FFEF`
   - Pendant le VBlank, `GBCEnhancedRedrawRowOrColumn` met à jour les attributs de couleur pour les nouvelles lignes/colonnes
   - Quand `rBGP`/`rOBP0`/`rOBP1` changent (fades, menus), `_UpdateGBCPal_BGP`/`_UpdateGBCPal_OBP` redirigent vers les fonctions enhanced

4. **Fenêtres texte** :
   - `MakeAndTransferOverworldBGMapAttributes_OpenText` → met à jour vBGMap1 (fenêtre) avec les bons attributs de couleur
   - `MakeAndTransferOverworldBGMapAttributes_CloseText` → restaure vBGMap0 (fond) après fermeture

### Palettes définies

8 palettes overworld : RED, PINK, PURPLE, GRAY, GREEN, YELLOW, BROWN, BLUE.
Chaque tile de chaque tileset est associé à une de ces 8 palettes via les tables `PalSettings_*`.
La valeur 8 est un "wild card" qui utilise la couleur spécifique de la ville actuelle (`PalSettings_TownSpecialPal`).

3 jeux de palettes : Standard, ColdCavern (Îles Écume), DarkCavern (Grotte Sombre/Rock Tunnel).

---

## Corrections déjà appliquées

### Fix 1 : `_RunPaletteCommand` — Reset du flag enhanced

**Fichier** : `engine/gfx/palettes.asm`

**Problème** : Dans shinpokered, `_RunPaletteCommand` commence par `res 4, [hl]` sur `hFlagsFFFA` pour réinitialiser le flag "enhanced overworld actif". Sans cela, le flag persiste incorrectement quand d'autres commandes palette sont exécutées (combat, menus, etc.).

**Correction appliquée** :
```asm
_RunPaletteCommand:
	; pureGREENFRnote: ADDED: reset enhanced GBC overworld flag
	ld hl, hFlagsFFFA
	res 4, [hl]

	call GetPredefRegisters
	...
```

### Fix 2 : `_UpdateGBCPal_BGP` — Redirection vers le chemin enhanced

**Fichier** : `engine/gfx/palettes.asm`

**Problème** : Dans shinpokered, quand les couleurs enhanced sont actives (`wUnusedD721` bit 7 + `hFlagsFFFA` bit 4), `_UpdateGBCPal_BGP` redirige vers `UpdateEnhancedGBCPal_BGP` au lieu du chemin standard DMGPalToGBCPal. Sans cette redirection, tout changement de `rBGP` (fades, ouverture de menu, etc.) écrase les palettes enhanced avec des palettes standard.

**Correction appliquée** :
```asm
_UpdateGBCPal_BGP::
	; pureGREENFRnote: ADDED: redirect to enhanced color path
	ld a, [wUnusedD721]
	bit 7, a
	jr z, .notEnhancedGBC
	ld hl, hFlagsFFFA
	bit 4, [hl]
	jr z, .notEnhancedGBC
	farcall UpdateEnhancedGBCPal_BGP
	ret
.notEnhancedGBC
	; ... code standard existant ...
```

### Fix 3 : `_UpdateGBCPal_OBP` — Redirection vers le chemin enhanced

**Fichier** : `engine/gfx/palettes.asm`

**Problème** : Même problème que Fix 2, mais pour les palettes d'objets (sprites).

**Correction appliquée** :
```asm
_UpdateGBCPal_OBP::
	; pureGREENFRnote: ADDED: redirect to enhanced color path
	ld a, [wUnusedD721]
	bit 7, a
	jr z, .notEnhancedGBC
	ld hl, hFlagsFFFA
	bit 4, [hl]
	jr z, .notEnhancedGBC
	farcall UpdateEnhancedGBCPal_OBP
	ret
.notEnhancedGBC
	; ... code standard existant ...
```

---

## Corrections à appliquer (appels manquants OpenText/CloseText)

Ces appels gèrent les attributs de couleur de la fenêtre (vBGMap1) et du fond (vBGMap0) quand des boîtes de texte s'ouvrent/ferment. Sans eux, les boîtes de texte en mode Y3 peuvent avoir des couleurs incorrectes.

### 1. `engine/menus/display_text_id_init.asm` — OpenText hook

**shinpokered** : Après `CopyScreenTileBufferToVRAM`, avant de placer la fenêtre à l'écran :
```asm
;GBCNote - for enhanced GBC color
;The Map View tiles for the text display are now in vBGMap1
;This function will make new map attributes based on the current map view
;And then also transfer those attributes to the vBGMap1 space
;That way the window is ready when it gets slid onto the screen by writing to hWY
	callba MakeAndTransferOverworldBGMapAttributes_OpenText
```

**pureRGB** : Appel manquant dans `DisplayTextIDInit`.

### 2. `home/text_script.asm` — CloseText hook

**shinpokered** : Dans la fermeture de la boîte de texte, après `LoadCurrentMapView` :
```asm
;This function will make new map attributes based on the current map view
;And then also transfer those attributes to the vBGMap0 space
;That way the background is ready when the window gets slid off the screen
	callba MakeAndTransferOverworldBGMapAttributes_CloseText
```

**pureRGB** : Appel manquant dans `CloseTextDisplayPart1` (ou équivalent).

### 3. `engine/battle/battle_transitions.asm` — Transition de combat

**shinpokered** : Au début de `BattleTransition`, avant de glisser la fenêtre :
```asm
;GBCnote - for enhanced gbc colors, need to update the window as if opening a menu or text box
;Else colors will be wrong upon writing sliding the window onto the screen
	callba MakeAndTransferOverworldBGMapAttributes_OpenText
```

**pureRGB** : Appel manquant.

### 4. `engine/overworld/cut.asm` — Après animation Coupe

**shinpokered** : Après `LoadCurrentMapView`, appel des deux fonctions :
```asm
;GBCNote - arrange a bit differently for enhanced GBC colors
	call LoadCurrentMapView
	callba MakeAndTransferOverworldBGMapAttributes_OpenText
	callba MakeAndTransferOverworldBGMapAttributes_CloseText
```

**pureRGB** : Appels manquants après `LoadCurrentMapView`.

### 5. `engine/items/item_effects.asm` — Menu items (ItemUseReloadOverworldData)

**shinpokered** : Dans `ItemUseReloadOverworldData`, après `LoadCurrentMapView` :
```asm
;GBCNote - for enhanced GBC color
;makes it so that the vBGMap1 space gets updated for the side menu going away
	call DelayFrame
	callba MakeAndTransferOverworldBGMapAttributes_OpenText
```

**pureRGB** : Appel manquant.

### 6. `scripts/VermilionDock.asm` — Scène du port

**shinpokered** : Après remplissage des tiles d'eau :
```asm
;gbcnote: for enhanced GBC colors, you have to update the palettes for the water tiles just written to vBGMap1
	callba MakeAndTransferOverworldBGMapAttributes_OpenText
```

**pureRGB** : Appel manquant.

---

## Bug latent : Cross-bank call pour gamma correction

### Problème

Dans pureRGB, les fonctions de gamma correction sont dans une banque différente de `func_enhancedcolor.asm` :
- `func_enhancedcolor.asm` → banque $20 (section "Enhanced GBC Colors")
- `gbc_fade.asm` (GetRGB, GammaConv, MixColorMatrix, WriteRGB) → banque $38

Or, `func_enhancedcolor.asm` appelle ces fonctions avec `call` (appel intra-banque) au lieu de `farcall` (appel inter-banque).

Dans shinpokered, `func_gamma.asm` et `func_enhancedcolor.asm` sont dans la même section/banque, donc le `call` fonctionne.

### Impact

Ce bug ne se manifeste QUE quand `hGBC == 2` (mode gamma correction). En `hGBC == 1` (mode GBC normal), le code saute la correction gamma avec `jr nz, .skipGamma`.

### Code concerné

```asm
; dans func_enhancedcolor.asm, BufferAllEnhancedColorsGBC_readwriteinc :
	ldh a, [hGBC]
	cp 2
	jr nz, .skipGamma
	call GetRGB           ; ← cross-bank call! (banque $20 → banque $38)
	call MixColorMatrix   ; ← idem
	call GammaConv        ; ← idem
	call WriteRGB         ; ← idem
```

### Correction possible

Option A : Déplacer `gbc_fade.asm` dans la même section que `func_enhancedcolor.asm`
Option B : Utiliser `farcall` au lieu de `call` pour ces 4 appels
Option C : Mettre les fonctions gamma dans une section `SECTION "Enhanced GBC Colors"` aussi

---

## Éléments déjà correctement intégrés dans pureRGB

Les éléments suivants sont déjà présents et fonctionnels :

- **`custom_functions/func_enhancedcolor.asm`** : Le fichier complet avec toutes les palettes, mappings de tiles, fonctions de transfert, fonctions de fade (Inc/Dec), etc.
- **`engine/menus/options_menu2.asm`** : Interface Y1/Y2/Y3 avec `ToggleAltSGBYellowColors` et `PrintSGBYellowOptionNumbers`
- **`home/vblank.asm`** : Hook VBlank pour `GBCEnhancedRedrawRowOrColumn`
- **`home/vcopy.asm`** : Sauvegarde du flag row/column dans `$FFEF`
- **`SetPal_Overworld.enhancedGBCOverworld`** : Code de setup initial des couleurs enhanced
- **`TransferGBCEnhancedOverworldPalettes`** : Initialisation des palettes avec FadePal4
- **Constantes** : `BIT_ENH_GBC_COLORS`, `ENH_GBC_COLORS`, `PALETTES_YELLOW2`, etc.
- **RAM** : `wGBCFullPalBuffer`, `w2BGMapAttributes`, `w2GBCFullPalBuffer`, `hRGB`
- **`CopyGBCFullPalBuffer1to2`** : Copie buffer principal → buffer secondaire (WRAM bank 2)
- **`DecrementAllColorsGBC_improved` / `IncrementAllColorsGBC_improved`** : Fades améliorés

---

## Priorité des corrections

| Priorité | Correction | Impact |
|----------|-----------|--------|
| **CRITIQUE** | Fix 1-3 dans `palettes.asm` | ✅ FAIT — Sans eux, Y3 ne fonctionne pas du tout |
| **HAUTE** | Hooks OpenText/CloseText (points 1-2) | Couleurs incorrectes dans les boîtes de texte |
| **MOYENNE** | Battle transition (point 3) | Couleurs incorrectes pendant la transition de combat |
| **BASSE** | Cut, Items, VermilionDock (points 4-6) | Cas spécifiques avec couleurs incorrectes |
| **BASSE** | Fix gamma cross-bank | Seulement si hGBC == 2 (mode gamma) |

---

## Commandes utiles

```bash
# Voir le diff complet shinpokered vs upstream pour les palettes
cd shinpokered && git diff upstream/master -- engine/palettes.asm

# Voir les fichiers modifiés liés aux couleurs
cd shinpokered && git diff upstream/master --name-only | grep -iE 'palette|color|enhancedcolor|vblank|vcopy'

# Vérifier les banques dans le fichier symboles
grep "UpdateEnhancedGBCPal\|GetRGB\|GammaConv\|BufferAllEnhancedColorsGBC" pokegreen_debug.sym

# Compiler et tester
cd pureRGB && make
```
