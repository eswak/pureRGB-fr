; pureGREENFRnote: Called from BattleRandom (in Battle Core bank) when not link battle.
; Switches to BANK(Random), calls Random, restores bank, returns random value in a.
; Preserves hl and bc (caller relies on hl for move lists, bc for accuracy/index).
BattleRandomNonLink::
	push hl
	push bc
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
	ret

Random::
; Return a random number in a.
; For battles, use BattleRandom.
	push hl
	push de
	push bc
	farcall Random_
	ldh a, [hRandomAdd]
	pop bc
	pop de
	pop hl
	ret
