# Bank Switching Issues Tracker

## Format des entrées

Chaque bug suit ce format :
- **Fichier:Ligne** - Description
- **Type** : callfar / jpfar / predef / rst _PrintText / rst _Bankswitch
- **Statut** : ✅ FIXED / ⚠️ SUSPECT / ❌ BROKEN / 🔍 TO_VERIFY
- **Restauration** : OUI / NON / PARTIELLE
- **Priorité** : 🔴 CRITIQUE / 🟡 IMPORTANTE / 🟢 MINEURE
- **Notes** : Contexte et observations

---

## engine/battle/core.asm

### ✅ Fixes existants (déjà corrigés)

#### Line 3479-3481 : Restauration après PrintMonName1Text
```asm
call WrapperCallBattleCoreThenRestoreBank
; pureGREENFRnote: FIXED: ensure Battle Core bank is active after text
ld a, BANK(PlayerCanExecuteMove)
call SetCurBank
```
- **Type** : Wrapper custom
- **Statut** : ✅ FIXED
- **Restauration** : OUI
- **Priorité** : 🟢 MINEURE (déjà corrigé)

#### Line 3492 : ResidualEffects1 → JumpMoveEffect
```asm
call c, JumpMoveEffect ; pureGREENFRnote: FIXED: must be call not jp
```
- **Type** : call local
- **Statut** : ✅ FIXED
- **Restauration** : OUI (via JumpMoveEffect qui restaure)
- **Priorité** : 🟢 MINEURE (déjà corrigé)

#### Line 6156 : Restauration après GetCurrentMove
```asm
call GetCurrentMove
; pureGREENFRnote: FIXED: GetCurrentMove can leave wrong bank
ld a, BANK(ExecuteEnemyMove)
call SetCurBank
```
- **Type** : call avec side-effect
- **Statut** : ✅ FIXED
- **Restauration** : OUI
- **Priorité** : 🟢 MINEURE (déjà corrigé)

### ❌ Bugs identifiés et corrigés

#### Line 3620 : call ApplyAttackToEnemyPokemon - CAUSE RACINE DU BUG
```asm
.moveDidNotMiss
call ApplyAttackToEnemyPokemon  ← PROBLÈME ICI
call PrintCriticalOHKOText      ← Crash ici car mauvaise banque
```
- **Type** : call local qui appelle callfar indirectement
- **Statut** : ❌ BROKEN → ✅ FIXED
- **Restauration** : NON → AJOUTÉE
- **Priorité** : 🔴 CRITIQUE
- **Flux du bug** :
  1. `call ApplyAttackToEnemyPokemon`
  2. → `jp DrawHUDsAndHPBars` (line 5189)
  3. → `call DrawPlayerHUDAndHPBar` (line 2106)
  4. → → `callfar PlacePlayerHUDTiles` (line 2115) **← CHANGE BANQUE**
  5. → `jp DrawEnemyHUDAndHPBar` (line 2107)
  6. → → `callfar PlaceEnemyHUDTiles` (line 2181) **← CHANGE BANQUE**
  7. → Retour à ligne 3621 **DANS LA MAUVAISE BANQUE**
  8. → `call PrintCriticalOHKOText` **← CRASH**
- **Solution** : Restaurer la banque Battle Core APRÈS ApplyAttackToEnemyPokemon
- **Code correction** :
```asm
call ApplyAttackToEnemyPokemon
; pureGREENFRnote: FIXED: ApplyAttack→DrawHUDs→callfar Place*HUDTiles leaves wrong bank
ld a, BANK(ExecutePlayerMove)
call SetCurBank
call PrintCriticalOHKOText
```

#### Line 6339 : call ApplyAttackToPlayerPokemon (enemy) - MÊME BUG
```asm
.moveDidNotMiss
call ApplyAttackToPlayerPokemon  ← PROBLÈME ICI
call PrintCriticalOHKOText       ← Crash ici
```
- **Type** : call local qui appelle callfar indirectement
- **Statut** : ❌ BROKEN → ✅ FIXED
- **Restauration** : NON → AJOUTÉE
- **Priorité** : 🔴 CRITIQUE
- **Notes** : Même problème que ligne 3620
- **Code correction** :
```asm
call ApplyAttackToPlayerPokemon
; pureGREENFRnote: FIXED: ApplyAttack→DrawHUDs→callfar Place*HUDTiles leaves wrong bank
ld a, BANK(ExecuteEnemyMove)
call SetCurBank
call PrintCriticalOHKOText
```

### ⚠️ Autres suspects

#### Line 2115 : callfar PlacePlayerHUDTiles
- **Type** : callfar
- **Statut** : ⚠️ SOURCE DU PROBLÈME (mais corrigé à un niveau supérieur)
- **Restauration** : NON
- **Priorité** : 🟡 IMPORTANTE
- **Notes** : Ce callfar est la source du changement de banque, mais plutôt que de le corriger ici (appelé de multiples endroits), on corrige au niveau des appelants critiques (ExecutePlayerMove/ExecuteEnemyMove)

#### Line 2181 : callfar PlaceEnemyHUDTiles
- **Type** : callfar
- **Statut** : ⚠️ SOURCE DU PROBLÈME (mais corrigé à un niveau supérieur)
- **Restauration** : NON
- **Priorité** : 🟡 IMPORTANTE
- **Notes** : Même chose que PlacePlayerHUDTiles

### 🔍 À vérifier

#### Tous les callfar dans core.asm
- [ ] Line ??? : callfar CheckOnSendOutSpecialEffect
- [ ] Line 3482 : callfar CheckRemapMoveData
- [ ] Line 3483 : callfar CheckSpecialBattleMoveModifiersPlayer
- [ ] Line 3622 : callfar DisplayEffectiveness ⚠️
- [ ] Line ??? : ... (à compléter)

#### Tous les predef dans core.asm
- [ ] UpdateHPBar2
- [ ] DrawPlayerHUDAndHPBar
- [ ] DrawEnemyHUDAndHPBar
- [ ] MoveAnimation
- [ ] ... (à compléter)

---

## engine/battle/effects.asm

### ✅ Fixes existants

#### Line 3-6 : JumpMoveEffect wrapper
```asm
JumpMoveEffect:
	call _JumpMoveEffect
	; pureGREENFRnote: FIXED: effect routines may call _PrintText which leaves wrong bank
	ld a, BANK(JumpMoveEffect)
	call SetCurBank
	ld b, $1
	ret
```
- **Type** : Wrapper de protection
- **Statut** : ✅ FIXED
- **Restauration** : OUI
- **Priorité** : 🟢 MINEURE (déjà corrigé)

### 🔍 À vérifier

- [ ] Tous les rst _PrintText dans effects.asm
- [ ] Tous les callfar dans effects.asm
- [ ] Tous les predef dans effects.asm

---

## engine/battle/move_effects/

### drain_hp.asm

#### Line 96 : rst _PrintText
```asm
.printText
	rst _PrintText
	ret
```
- **Type** : rst _PrintText
- **Statut** : 🔍 TO_VERIFY
- **Restauration** : NON (mais normalement géré par JumpMoveEffect wrapper)
- **Priorité** : 🟡 IMPORTANTE
- **Notes** : Pourrait causer le bug du texte affiché 2 fois pour MEGA_DRAIN

---

## Bugs actifs à résoudre - MISE À JOUR V3

### ✅ RÉSOLUS (V3 - 2026-02-12)

1. **Seismic Toss / Super Fang crash**
   - Fichier: core.asm
   - Statut: ✅ FIXED (V3)
   - Cause identifiée:
     - ApplyAttackToEnemyPokemon laissait mauvaise banque
     - PrintCriticalOHKOText → rst _PrintText laissait mauvaise banque
     - DisplayEffectiveness laissait mauvaise banque
     - Path non-multi-hit arrivait à .executeOtherEffects sans restauration
     - IsInArray pour SpecialEffects lisait mauvaise banque
   - Solution: 4 restaurations stratégiques (lignes 3622, 3625, 3628, 3661)

2. **MEGA_DRAIN double text et double heal**
   - Fichier: core.asm
   - Statut: ✅ FIXED (V3)
   - Cause identifiée:
     - DRAIN_HP_EFFECT exécuté via AlwaysHappenSideEffects (1ère fois)
     - Path non-multi-hit arrivait sans restauration de banque
     - IsInArray pour SpecialEffects lisait mauvaise banque
     - Ne trouvait pas DRAIN_HP_EFFECT → exécutait JumpMoveEffect (2ème fois)
   - Solution: Restauration ligne 3661 avant .executeOtherEffects

3. **Skull Bash intermittent crash**
   - Statut: ✅ PROBABLEMENT FIXED (V3)
   - Hypothèse: Même cause que Seismic Toss
   - Intermittence: Dépendait de quelle banque était active (selon context)
   - Solution: Mêmes restaurations que Seismic Toss

4. **Multi-hit moves + effects crash**
   - Statut: ✅ FIXED (V3)
   - Cause: rst _PrintText dans MultiHitText laissait mauvaise banque
   - Solution: Restauration ligne 3656 après rst _PrintText

---

## Méthodologie de test

Pour chaque suspect identifié :

1. **Vérifier le contexte** : Quand cette fonction est-elle appelée ?
2. **Vérifier la banque source** : Dans quelle banque est le code appelant ?
3. **Vérifier la banque cible** : Dans quelle banque est la fonction appelée ?
4. **Vérifier le retour** : La banque est-elle restaurée avant le retour ?
5. **Vérifier les chemins alternatifs** : Y a-t-il des chemins qui sautent la restauration ?

---

*Dernière mise à jour: 2026-02-12*
