# Documentation des Bugs - pureGREENFR

## 📚 Guide de la Documentation

### Documents Principaux (À Conserver)

#### ✅ [BUG_FIX_FINAL.md](BUG_FIX_FINAL.md) - **RÉFÉRENCE PRINCIPALE**
**Status**: ✅ Résolu et testé (2026-02-13)

Documente le fix final pour les bugs critiques:
- **Seismic Toss crash** (stack overflow vers WRAM)
- **MEGA_DRAIN double execution** (affichage et soin × 2)

**Root Cause**: IsInArray modifie le registre 'a', causant recherches incorrectes dans les tables d'effets.

**Solution**: Sauvegarder l'effet dans registre 'c' avant les appels successifs.

**Contient**:
- Analyse technique complète
- Historique de toutes les tentatives (V1-V4)
- Code avant/après
- Tests de validation
- Leçons apprises

---

#### ✅ [BUG_MULTI_HIT_FLAG.md](BUG_MULTI_HIT_FLAG.md)
**Status**: ✅ Résolu (2026-02-13)

Documente le bug où le flag `ATTACKING_MULTIPLE_TIMES` n'était pas resetté entre tours.

**Symptôme**: Après Torgnoles (2-5 hits), l'attaque suivante de l'ennemi se répétait aussi 2-5 fois.

**Solution**: Helper function `ClearMultiHitFlags` appelée au début de chaque tour.

---

#### 📖 [BANK_SWITCHING_MASTER_REFERENCE.md](BANK_SWITCHING_MASTER_REFERENCE.md)
**Type**: Référence technique

Guide complet sur le bank switching dans pureRGB:
- Architecture MBC1
- RST vectors inversés
- callfar/jpfar macros
- Inventaire des bankswitches
- Patterns de debug

**Utilité**: Référence générale pour comprendre le système de banks, même si le bug final n'était PAS lié au bank switching.

---

### Documents Obsolètes (Archivés)

#### 🗄️ BUG_ISINARRAY_ROOT_CAUSE.md
**Status**: Obsolète - remplacé par BUG_FIX_FINAL.md

Version préliminaire de l'analyse. Toutes les infos pertinentes ont été migrées vers BUG_FIX_FINAL.md.

#### 🗄️ BANK_CHANGES_REFERENCE.md
**Status**: Potentiellement redondant avec BANK_SWITCHING_MASTER_REFERENCE.md

---

## 🎯 Résumé Exécutif

### Bugs Résolus (100% Success Rate)

| Bug | Gravité | Status | Fix |
|-----|---------|--------|-----|
| Seismic Toss crash | 🔴 Critique | ✅ Résolu | Sauvegarde registre 'c' |
| MEGA_DRAIN double exec | 🔴 Critique | ✅ Résolu | Sauvegarde registre 'c' |
| Multi-hit flag carryover | 🔴 Critique | ✅ Résolu | ClearMultiHitFlags helper |

### Métriques

- **Temps total debug**: ~4 heures
- **Tentatives**: 5 (V1-V4 + finale)
- **Fichiers modifiés**: `engine/battle/core.asm`, `home/bankswitch.asm`
- **Section size**: 0x3fe8 / 0x4000 bytes (24 bytes marge)
- **Tests**: 100% réussite

### Leçon Clé

> **Toujours vérifier les side-effects des fonctions appelées.**
>
> IsInArray modifie 'a' - appels successifs sans reload cherchent 0xFF au lieu de la valeur voulue.

---

## 🔧 Pour Développeurs Futurs

Si vous rencontrez des bugs similaires:

1. **Comparez avec upstream FIRST** - si ça marche upstream, c'est une régression
2. **Vérifiez le bytecode** avec hexdump - les données sont souvent correctes, le bug est dans le code
3. **Lisez le code réel** des fonctions - ne présumez pas que les registres sont préservés
4. **Sauvegardez les valeurs critiques** dans des registres temporaires avant appels multiples

---

**Dernière mise à jour**: 2026-02-13
**Mainteneur**: Claude Code (Opus 4.6) + eswak
