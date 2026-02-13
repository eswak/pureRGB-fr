# Analyse de engine/battle/effects.asm et move_effects/

## Architecture des effets

### Wrapper de protection : JumpMoveEffect

```asm
JumpMoveEffect:
	call _JumpMoveEffect
	; pureGREENFRnote: FIXED: effect routines (e.g. Disable) may call _PrintText
	; which leaves wrong bank; restore Battle Core before return
	ld a, BANK(JumpMoveEffect)
	call SetCurBank
	ld b, $1
	ret

_JumpMoveEffect:
	ldh a, [hWhoseTurn]
	and a
	ld a, [wPlayerMoveEffect]
	jr z, .next1
	ld a, [wEnemyMoveEffect]
.next1
	dec a
	add a
	ld hl, MoveEffectPointerTable
	ld b, 0
	ld c, a
	add hl, bc
	ld a, [hli]
	ld h, [hl]
	ld l, a
	jp hl  ; Saute vers l'effet
```

### Protection automatique

Tous les effets appelés via JumpMoveEffect sont PROTÉGÉS :
1. L'effet est exécuté (peut changer de banque)
2. L'effet fait `ret`
3. Retour à JumpMoveEffect ligne 4
4. **Ligne 5 : Restauration de la banque Battle Core** ✅
5. Retour à l'appelant avec la bonne banque

## jpfar dans effects.asm

### Pattern utilisé

```asm
SomeEffect:
	; ... code de setup ...
	jpfar RealEffect_  ; Saute vers move_effects/xxx.asm
	; Jamais atteint car jpfar est un saut, pas un appel
```

`RealEffect_` fait son travail puis `ret` qui retourne à JumpMoveEffect (pas à SomeEffect).

### Liste des jpfar (24 identifiés)

1. Line 180: `jpfar DrainHPEffect_` ← MEGA_DRAIN bug ?
2. Line 1088: `jpfar _TeleportEffect`
3. Line 1216: `jpfar OneHitKOEffect_`
4. Line 1341: `jpfar MistEffect_`
5. Line 1344: `jpfar FocusEnergyEffect_`
6. Line 1347: `jpfar DefaultRecoilEffect_`
7. Line 1350: `jpfar BigRecoilEffect_`
8. Line 1353: `jpfar ExplodeRecoilEffect_`
9. Line 1421: `jpfar FirewallEffect_`
10. Line 1424: `jpfar ParalyzeEffect_`
11. Line 1427: `jpfar SubstituteEffect_`
12. Line 1566: `jpfar LeechSeedEffect_`
13. Line 1688: `jpfar PayDayEffect_`
14. Line 1693: `jpfar TriAttackEffect_`
15. Line 1696: `jpfar HazeEffect_`
16. Line 1756: `jpfar HealEffect_`
17. Line 1759: `jpfar TransformEffect_`
18. Line 1762: `jpfar ReflectLightScreenEffect_`
19. Line 1964: `jpfar _DefenseCurlEffect`

**Statut** : ✅ PROTÉGÉS par JumpMoveEffect wrapper

## callfar dans effects.asm

### Liste des callfar (3 identifiés)

1. **Line 1119: `callfar DoubleSlapModifierPart2`**
   - Contexte : Double Slap
   - Statut : 🔍 À vérifier
   - Criticité : 🟡 Moyenne
   - Note : Appel direct, pas via JumpMoveEffect

2. **Line 1463: `callfar ConversionEffect_`**
   - Contexte : Conversion
   - Statut : 🔍 À vérifier
   - Criticité : 🟡 Moyenne
   - Note : Appel direct, pas via JumpMoveEffect

3. **Line 1717: `callfar HealEffect_`**
   - Contexte : Heal
   - Statut : 🔍 À vérifier
   - Criticité : 🟡 Moyenne
   - Note : Appel direct, pas via JumpMoveEffect

4. **Line 1888: `callfar Func_78e98`**
   - Contexte : GBC color
   - Statut : ✅ FIXED (restauration ligne 1890)
   - Criticité : 🟢 Faible
   - Code:
   ```asm
   ; pureGREENFRnote: FIXED: predef/callfar can leave wrong bank
   callfar Func_78e98
   ld a, BANK(PlayBattleAnimationGotID)
   call SetCurBank
   ```

### ⚠️ callfar suspects

Les callfar aux lignes 1119, 1463, 1717 ne sont PAS protégés par le wrapper JumpMoveEffect car ce sont des appels directs.

**Action requise** : Vérifier si ces fonctions restaurent la banque avant de retourner.

## rst _PrintText dans move_effects/

### Problème potentiel

Les fonctions dans move_effects/ peuvent appeler `rst _PrintText` qui change de banque.

Exemple dans `drain_hp.asm`:
```asm
DrainHPEffect_:
	; ... code ...
	ld hl, SuckedHealthText
	; ...
.printText
	rst _PrintText  ← Peut changer de banque
	ret             ← Retourne avec la mauvaise banque ?
```

### Protection existante

Le wrapper JumpMoveEffect restaure la banque APRÈS le retour, donc même si DrainHPEffect_ laisse la mauvaise banque, elle est corrigée.

**MAIS** : Si DrainHPEffect_ est appelé 2 fois (ce qui expliquerait le texte affiché 2 fois pour MEGA_DRAIN), et que la première fois laisse la mauvaise banque, la deuxième exécution pourrait se comporter bizarrement.

## Bug MEGA_DRAIN : Texte affiché 2 fois

### Hypothèse #1 : DrainHPEffect_ appelé 2 fois

Vérifier dans core.asm si DRAIN_HP_EFFECT pourrait être appelé 2 fois :
- Une fois dans AlwaysHappenSideEffects ?
- Une fois ailleurs ?

### Hypothèse #2 : Problème avec _PrintText

Le texte pourrait être affiché une fois normalement, puis une deuxième fois à cause d'un problème de banque qui cause une répétition.

### Action requise

1. Tracer précisément où DrainHPEffect_ est appelé
2. Vérifier si _PrintText peut causer un double affichage
3. Vérifier s'il y a une condition de course

## Recommandations

### Immédiat

1. ✅ JumpMoveEffect wrapper est correct et protège les jpfar
2. ⚠️ Vérifier les 3 callfar non protégés (DoubleSlapModifierPart2, ConversionEffect_, HealEffect_)

### Investigation MEGA_DRAIN

1. Ajouter des traces pour identifier si DrainHPEffect_ est appelé 2 fois
2. Vérifier le flux exact dans AlwaysHappenSideEffects
3. Vérifier si DRAIN_HP_EFFECT est dans plusieurs listes d'effets

### Long terme

Considérer standardiser tous les appels d'effets via le wrapper JumpMoveEffect pour éviter les incohérences.

---

*Dernière mise à jour: 2026-02-12*
