# Notes de Debug pour le Freeze DISABLE — RÉSOLU

## Résolution finale

Le freeze a été corrigé. Voir `DISABLE_FREEZE_PROBLEM.md` pour l'analyse complète.

**Résumé** : le bug venait de `farcall BattleRandom` utilisé dans `effects.asm` alors que ce fichier est dans la même banque ($F) que `core.asm`. `farcall` passe par `Bankswitch` qui détruit `a`, `b` et, via le macro, `hl`. La correction consiste à utiliser `call BattleRandom` (même banque) et à réécrire `BattleRandomNonLink` pour préserver `hl`.

## Historique des tentatives (pour référence)

### Tentative 1 : Restauration explicite après WrapperCallBattleCoreThenRestoreBank ❌
**Résultat** : Le freeze persistait. La banque ÉTAIT correcte après le wrapper — le problème n'était pas là.

### Tentative 2 : Restauration après farcall BattleRandom dans DisableEffect ❌
**Résultat** : Le freeze persistait. Restaurer la banque après farcall ne résolvait rien car le vrai problème était que `a` et `hl` étaient écrasés par Bankswitch/farcall.

### Tentative 3 : Restauration dans JumpMoveEffect ✅ (déjà présent, correct mais insuffisant)
**Résultat** : Correct pour les effets qui appellent `_PrintText`, mais ne résolvait pas le bug Disable.

### Correctif final : call BattleRandom + BattleRandomNonLink preserves hl ✅
**Résultat** : Bug résolu. Correction de 2 fichiers, 20+ effets de combat corrigés.

## Clé du diagnostic

La clé pour comprendre ce bug était de tracer **ce que Bankswitch fait aux registres au retour** :

```
Bankswitch::
  ldh a, [hLoadedROMBank]   ; sauve banque courante
  push af                    ; sur la pile
  ld a, b                    ; banque cible
  call SetCurBank            ; switch
  call hl_caller             ; appelle la fonction
  pop bc                     ; b = banque sauvegardée (ÉCRASE b et c !)
  ld a, b                    ; a = banque sauvegardée (ÉCRASE a !)
  ; tombe dans SetCurBank → ret
```

Après `farcall SomeFunc` :
- `a` = numéro de banque (PAS la valeur de retour de SomeFunc)
- `b` = numéro de banque
- `c` = flags du push af initial
- `d`, `e`, `h`, `l` = préservés depuis SomeFunc
- Flags CPU (Z, C, N, H) = préservés depuis SomeFunc

Et le macro `farcall` lui-même fait `ld hl, target` avant l'appel, donc `hl` est aussi écrasé avant que Bankswitch ne soit invoqué.
