# Inventaire complet des callfar dans engine/battle/core.asm

Total: 52 callfar identifiés

## Légende
- ✅ = Restauration de banque confirmée
- ❌ = Pas de restauration de banque
- ⚠️ = Restauration conditionnelle ou incertaine
- 🔍 = À vérifier

---

## Liste complète

### Line 32: callfar LoadPlayerBackPic
**Contexte**: Initialisation du combat
**Restauration**: 🔍 À vérifier
**Criticité**: 🟢 Faible (init)

### Line 300: callfar PrintSafariZoneBattleText
**Contexte**: Safari Zone
**Restauration**: 🔍 À vérifier
**Criticité**: 🟢 Faible (zone spéciale)

### Line 423: callfar CheckPerTurnSpecialBattleEffect
**Contexte**: Début de tour
**Restauration**: 🔍 À vérifier
**Criticité**: 🟡 Moyenne

### Line 503: callfar SwitchEnemyMon
**Contexte**: Switch du Pokémon ennemi
**Restauration**: 🔍 À vérifier
**Criticité**: 🟡 Moyenne

### Line 544: callfar TrainerAI
**Contexte**: IA du dresseur
**Restauration**: 🔍 À vérifier
**Criticité**: 🟡 Moyenne

### Line 574: callfar TrainerAI
**Contexte**: IA du dresseur (2ème appel)
**Restauration**: 🔍 À vérifier
**Criticité**: 🟡 Moyenne

### Line 965: callfar CheckSpecialFaintText
**Contexte**: Texte spécial quand KO
**Restauration**: 🔍 À vérifier
**Criticité**: 🟡 Moyenne

### Line 996: callfar GainExperience
**Contexte**: Gain d'EXP
**Restauration**: 🔍 À vérifier
**Criticité**: 🟢 Faible (fin de combat)

### Line 1063: callfar DrawEnemyPokeballs
**Contexte**: Affichage Pokéballs ennemies
**Restauration**: 🔍 À vérifier
**Criticité**: 🟢 Faible (UI)

### Line 1090: callfar IsFemaleTrainer
**Contexte**: Check dresseur féminin
**Restauration**: 🔍 À vérifier
**Criticité**: 🟢 Faible

### Line 1149: callfar GiveItemFromWram
**Contexte**: Donner objet (Trainer Candy)
**Restauration**: 🔍 À vérifier
**Criticité**: 🟢 Faible

### Line 1634: callfar CheckCanForceSwitch
**Contexte**: Check switch forcé
**Restauration**: 🔍 À vérifier
**Criticité**: 🟡 Moyenne

### Line 1750: callfar EmptyPartyMenuRedraw
**Contexte**: Redessiner menu équipe
**Restauration**: 🔍 À vérifier
**Criticité**: 🟢 Faible (UI)
**Note**: Commentaire "FIXED: minor graphical glitch"

### Line 2016: callfar PrintSendOutMonMessage
**Contexte**: Message envoi Pokémon
**Restauration**: 🔍 À vérifier
**Criticité**: 🟡 Moyenne

### Line 2059: callfar CheckOnSendOutSpecialEffect
**Contexte**: Effet spécial à l'envoi
**Restauration**: 🔍 À vérifier
**Criticité**: 🟡 Moyenne
**Note**: Commentaire "pureGREENFRnote: update from jpfar"

### Line 2115: callfar PlacePlayerHUDTiles
**Contexte**: Affichage HUD joueur
**Restauration**: 🔍 À vérifier
**Criticité**: 🟢 Faible (UI)

### Line 2181: callfar PlaceEnemyHUDTiles
**Contexte**: Affichage HUD ennemi
**Restauration**: 🔍 À vérifier
**Criticité**: 🟢 Faible (UI)

### Line 2683: callfar ReloadEnemyMonPicAfterStatusScreen
**Contexte**: Recharger sprite après écran statut
**Restauration**: 🔍 À vérifier
**Criticité**: 🟢 Faible (UI)

### Line 2692: callfar EmptyPartyMenuRedraw
**Contexte**: Redessiner menu équipe
**Restauration**: 🔍 À vérifier
**Criticité**: 🟢 Faible (UI)
**Note**: Commentaire "FIXED: minor graphical glitch"

### Line 2724: callfar RetreatMon
**Contexte**: Retraite du Pokémon
**Restauration**: 🔍 À vérifier
**Criticité**: 🟡 Moyenne

### Line 2779: callfar FormatMovesString
**Contexte**: Formatage string d'attaques
**Restauration**: 🔍 À vérifier
**Criticité**: 🟢 Faible

### Line 2997: callfar ShowConversionMenu
**Contexte**: Menu Conversion
**Restauration**: 🔍 À vérifier
**Criticité**: 🟢 Faible

### Line 3200: callfar GetMaxPP
**Contexte**: Obtenir PP max
**Restauration**: 🔍 À vérifier
**Criticité**: 🟢 Faible

### Line 3295: callfar AIEnemyTrainerChooseMoves
**Contexte**: IA choix d'attaque
**Restauration**: 🔍 À vérifier
**Criticité**: 🟡 Moyenne

### Line 3337: callfar ChooseMovePPTrack
**Contexte**: Suivi PP d'attaque
**Restauration**: 🔍 À vérifier
**Criticité**: 🟢 Faible

### Line 3386: callfar PrintWaitingText
**Contexte**: Texte d'attente
**Restauration**: 🔍 À vérifier
**Criticité**: 🟢 Faible

### Line 3482: callfar CheckRemapMoveData
**Contexte**: Remap données d'attaque
**Restauration**: 🔍 À vérifier
**Criticité**: 🟡 Moyenne

### Line 3483: callfar CheckSpecialBattleMoveModifiersPlayer
**Contexte**: Modificateurs spéciaux joueur
**Restauration**: 🔍 À vérifier
**Criticité**: 🟡 Moyenne

### Line 3622: callfar DisplayEffectiveness ⚠️ CRITIQUE
**Contexte**: Affichage efficacité après dégâts
**Restauration**: ❌ NON (correction tentée mais échec)
**Criticité**: 🔴 CRITIQUE
**Note**: BUG PRINCIPAL - Seismic Toss / Super Fang crash
**Code suivant**:
```asm
call ApplyAttackToEnemyPokemon
call PrintCriticalOHKOText
callfar DisplayEffectiveness
ld a, 1
ld [wMoveDidntMiss], a
.notDone
ld a, [wPlayerMoveEffect]
ld hl, AlwaysHappenSideEffects
ld de, 1
call IsInArray
call c, JumpMoveEffect
```

### Line 5002: callfar CalcCriticalHitRateInBank
**Contexte**: Calcul taux coup critique
**Restauration**: 🔍 À vérifier
**Criticité**: 🟡 Moyenne

### Line 5336: callfar HideSubstituteShowMonAnim
**Contexte**: Animation Clonage
**Restauration**: 🔍 À vérifier
**Criticité**: 🟢 Faible (anim)

### Line 5558: callfar ShouldMoveGetStabBonus
**Contexte**: Calcul bonus STAB
**Restauration**: 🔍 À vérifier
**Criticité**: 🟡 Moyenne

### Line 6009: callfar CheckIsMistBlockedMoveInBank
**Contexte**: Check Brume bloque attaque
**Restauration**: 🔍 À vérifier
**Criticité**: 🟡 Moyenne

### Line 6192: callfar CheckRemapMoveData
**Contexte**: Remap données attaque (ennemi)
**Restauration**: 🔍 À vérifier
**Criticité**: 🟡 Moyenne

### Line 6193: callfar CheckSpecialBattleMoveModifiersEnemy
**Contexte**: Modificateurs spéciaux ennemi
**Restauration**: 🔍 À vérifier
**Criticité**: 🟡 Moyenne

### Line 6344: callfar DisplayEffectiveness ⚠️ CRITIQUE
**Contexte**: Affichage efficacité (ennemi)
**Restauration**: ❌ NON (correction tentée mais échec)
**Criticité**: 🔴 CRITIQUE
**Note**: Même problème que ligne 3622

### Line 6872: callfar TryRemapTyping
**Contexte**: Remap type
**Restauration**: 🔍 À vérifier
**Criticité**: 🟡 Moyenne

### Line 6946: callfar advancedLoadPP
**Contexte**: Chargement PP avancé
**Restauration**: 🔍 À vérifier
**Criticité**: 🟢 Faible
**Note**: shinpokerednote

### Line 7018: callfar DisplayLinkBattleVersusTextBox
**Contexte**: Combat Link
**Restauration**: 🔍 À vérifier
**Criticité**: 🟢 Faible (Link)

### Line 7025: callfar LoadHudAndHpBarAndStatusTilePatterns
**Contexte**: Chargement patterns HUD
**Restauration**: 🔍 À vérifier
**Criticité**: 🟢 Faible (init)

### Line 7464: callfar Func_78e98
**Contexte**: Fonction GBC
**Restauration**: 🔍 À vérifier
**Criticité**: 🟢 Faible (GBC)
**Note**: Commentaire "Use callfar so Func_78e98 returns via Bankswitch properly"

### Line 7506: callfar TryDoWildEncounter
**Contexte**: Rencontre sauvage
**Restauration**: 🔍 À vérifier
**Criticité**: 🟢 Faible (init)

### Line 7522: callfar InitBattleVariables
**Contexte**: Init variables combat
**Restauration**: 🔍 À vérifier
**Criticité**: 🟢 Faible (init)

### Line 7527: callfar GetTrainerInformation
**Contexte**: Info dresseur
**Restauration**: 🔍 À vérifier
**Criticité**: 🟢 Faible (init)
**Note**: Commentaire "MOVED: this function was moved out of home bank"

### Line 7528: callfar ReadTrainer
**Contexte**: Lecture données dresseur
**Restauration**: 🔍 À vérifier
**Criticité**: 🟢 Faible (init)

### Line 7572: callfar CheckShouldLoadGhostSprite
**Contexte**: Check sprite fantôme
**Restauration**: 🔍 À vérifier
**Criticité**: 🟢 Faible (init)

### Line 7575: callfar LoadGhostData
**Contexte**: Chargement données fantôme
**Restauration**: 🔍 À vérifier
**Criticité**: 🟢 Faible (init)

### Line 7591: callfar GBCSetCPU1xSpeed
**Contexte**: Vitesse CPU GBC
**Restauration**: 🔍 À vérifier
**Criticité**: 🟢 Faible (GBC)
**Note**: shinpokerednote

### Line 7646: callfar CheckInitSpecialBattleEffect
**Contexte**: Init effet spécial combat
**Restauration**: 🔍 À vérifier
**Criticité**: 🟢 Faible (init)

### Line 7649: callfar EndOfBattle
**Contexte**: Fin de combat
**Restauration**: 🔍 À vérifier
**Criticité**: 🟢 Faible (fin)

---

## Analyse de criticité

### 🔴 PRIORITÉ CRITIQUE (2)
- Line 3622: DisplayEffectiveness (joueur)
- Line 6344: DisplayEffectiveness (ennemi)

### 🟡 PRIORITÉ MOYENNE (15)
- Appels pendant l'exécution du tour de combat
- CheckRemapMoveData, CheckSpecialBattleMoveModifiers, etc.

### 🟢 PRIORITÉ FAIBLE (35)
- Appels d'initialisation, UI, effets spéciaux non-critiques

---

## Prochaines actions

1. ✅ Inventaire complet effectué
2. ⏳ Vérifier restauration pour chaque appel critique
3. ⏳ Analyser le code autour des appels critiques
4. ⏳ Identifier le vrai problème pour DisplayEffectiveness

