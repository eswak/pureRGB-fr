IncrementDayCareMonExp:
	ld a, [wDayCareInUse]
	and a
	ret z
	; Add 10 exp per step (10x faster than original +1)
	; But the pokemon cannot progress higher than the highest party pokemon
	ld hl, wDayCareMonExp + 2
	ld a, [hl]
	add 10
	ld [hl], a
	jr nc, .getCap
	dec hl
	ld a, [hl]
	inc a
	ld [hl], a
	jr nz, .getCap
	dec hl
	ld a, [hl]
	inc a
	ld [hl], a
.getCap
	; Cap = experience of the party Pokémon with the most experience (24-bit)
	ld a, [wPartyCount]
	and a
	jr z, .defaultCap
	ld b, a
	xor a
	ldh [hExperience], a
	ldh [hExperience + 1], a
	ldh [hExperience + 2], a
	ld hl, wPartyMon1
.partyLoop
	push bc
	push hl
	ld de, MON_EXP
	add hl, de
	ld a, [hli]
	ld b, a
	ld a, [hli]
	ld c, a
	ld a, [hl]
	ld d, a
	; Compare this mon's exp (b,c,d) with current max (hExperience)
	ldh a, [hExperience]
	cp b
	jr c, .copyExp
	jr nz, .nextPartyMon
	ldh a, [hExperience + 1]
	cp c
	jr c, .copyExp
	jr nz, .nextPartyMon
	ldh a, [hExperience + 2]
	cp d
	jr c, .copyExp
	jr .nextPartyMon
.copyExp
	ld a, b
	ldh [hExperience], a
	ld a, c
	ldh [hExperience + 1], a
	ld a, d
	ldh [hExperience + 2], a
.nextPartyMon
	pop hl
	pop bc
	ld de, PARTYMON_STRUCT_LENGTH
	add hl, de
	dec b
	jr nz, .partyLoop
	jr .doCap
.defaultCap
	ld a, $50
	ldh [hExperience], a
	ld a, $FF
	ldh [hExperience + 1], a
	ldh [hExperience + 2], a
.doCap
	; If daycare exp >= cap, clamp to cap (24-bit big-endian compare)
	ld hl, wDayCareMonExp
	ldh a, [hExperience]
	ld b, a
	ld a, [hli]
	cp b
	jr c, .done
	jr nz, .clamp
	ldh a, [hExperience + 1]
	ld b, a
	ld a, [hli]
	cp b
	jr c, .done
	jr nz, .clamp
	ldh a, [hExperience + 2]
	ld b, a
	ld a, [hl]
	cp b
	jr c, .done
.clamp
	ldh a, [hExperience]
	ld [wDayCareMonExp], a
	ldh a, [hExperience + 1]
	ld [wDayCareMonExp + 1], a
	ldh a, [hExperience + 2]
	ld [wDayCareMonExp + 2], a
.done
	ret
