SECTION "Shiny Pokemon Functions", ROMX

;joenote - Custom functions to handle shiny pokemon

;joenote - check if enemy mon has gen2 shiny DVs
;zero flag is set if not shiny	
CheckEnemyShinyDVs:
	push hl
	ld hl, wEnemyMonDVs
	call ShinyDVsChecker
	jr z, .end
	ld a, $01
	and a 
.end
	pop hl
	ret

CheckPlayerShinyDVs:
	push hl
	ld hl, wBattleMonDVs
	call ShinyDVsChecker
	jr z, .end
	ld a, $01
	and a 
.end
	pop hl
	ret
	
CheckLoadedShinyDVs:
	push hl
	ld hl, wLoadedMonDVs
	call ShinyDVsChecker
	jr z, .end
	ld a, $01
	and a 
.end
	pop hl
	ret

ShinyDVsChecker2:	;uses DE instead of HL to better call across banks
	ld h, d
	ld l, e
ShinyDVsChecker:	;return z flag set if not shiny or cleared z flag if shiny
	ld a, [hl]	;load MSB
	bit 5, a	;bit 5 of the MSB need to be a 1 for shininess
	jr z, .end_zero
	and $0F	;now mask out the lesser nybble of the MSB
	cp $0A	;need to be a DV of 10 for shininess
	jr nz, .end_zero
	inc hl
	ld a, [hl]	;load LSB
	cp $AA	;need to be DVs of 10 for shininess
	jr nz, .end_zero
	ld a, $01
	and a 
	ret
.end_zero
	xor a
	ret

;Generate DVs for wild pokemon with 50% shiny chance
; PureRGBnote: writes result to wEnemyMonDVs (farcall clobbers a/b on return)
; Uses Random + hRandomAdd so we get the value after farcall
DetermineWildMonDVs:
	; 50% chance to generate shiny DVs (bit 7 == 0 for 128/256 = 50%)
	farcall Random
	ldh a, [hRandomAdd]
	and $80
	jr nz, .do_random
	;shiny DVs: MSB $2A, LSB $AA
	ld hl, wEnemyMonDVs
	ld a, $2A
	ld [hli], a
	ld a, $AA
	ld [hl], a
	ret
.do_random
	farcall Random
	ldh a, [hRandomAdd]
	ld b, a
	farcall Random
	ldh a, [hRandomAdd]
	ld hl, wEnemyMonDVs
	ld [hli], a
	ld [hl], b
	ret

ShinyPlayerAnimation:
	; No animation when player sends out shiny — only palette + symbol
	ld a, [wUnusedD366]
	bit 0, a
	jr nz, .noPlayerShiny
	farcall CheckPlayerShinyDVs
	jr z, .noPlayerShiny
	farcall SkipPlayerShinybit
	push bc
	ld b, SET_PAL_BATTLE
	call RunPaletteCommand
	pop bc
.noPlayerShiny
	ret
	
; Wild battle: palette + symbol + shiny encounter animation, then set bit 7
ShinyEnemyPaletteAndSymbolOnly:
	ld a, [wUnusedD366]
	bit 7, a
	ret nz
	farcall CheckEnemyShinyDVs
	ret z
	farcall SkipEnemyShinybit
	push bc
	ld b, SET_PAL_BATTLE
	call RunPaletteCommand
	pop bc
	; Play shiny animation on wild encounter (enemy pic is on screen at .playerSendOutFirstMon)
	ld a, [wIsInBattle]
	dec a
	ret nz
	push de
	ld d, $01
	ld e, XSTATITEM_ANIM
	farcall PlaySelectedAnimation
	pop de
	ret

; Trainer battle: full animation + palette + symbol (enemy pic already on screen)
ShinyEnemyAnimation:
	ld a, [wUnusedD366]
	bit 7, a
	jr nz, .noEnemyShiny
	farcall CheckEnemyShinyDVs
	jr z, .noEnemyShiny
	push de
	ld d, $01
	ld e, XSTATITEM_ANIM ; same as ShinPokered: X stat power-up (spiral inward)
	farcall PlaySelectedAnimation
	pop de
	farcall SkipEnemyShinybit
	push bc
	ld b, SET_PAL_BATTLE
	call RunPaletteCommand
	pop bc
.noEnemyShiny
	ret
	
DoPlayerShinybit:
	ld a, [wUnusedD366]
	res 0, a
	ld [wUnusedD366], a
	ret

SkipPlayerShinybit:
	ld a, [wUnusedD366]
	set 0, a
	ld [wUnusedD366], a
	ret

DoEnemyShinybit:
	ld a, [wUnusedD366]
	res 7, a
	ld [wUnusedD366], a
	ret

SkipEnemyShinybit:
	ld a, [wUnusedD366]
	set 7, a
	ld [wUnusedD366], a
	ret

ShinyStatusScreen:
	ld a, [wPalPacket + 3]
	call ShinyDVConvert
	ld [wPalPacket + 3], a
	farcall PrintShinySymbolStatus
	ret

PrintShinySymbolStatus:
	coord hl, 8, 1
	ld [hl], "<SHINY>"
	ret

ShinyPlayerMon:
	ld a, [wPalPacket + 5]
	call ShinyDVConvert
	ld [wPalPacket + 5], a
	ret

ShinyEnemyMon:
	ld a, [wPalPacket + 7]
	call ShinyDVConvert
	ld [wPalPacket + 7], a
	ret

ShinyDVConvert:	;'a' holds the default value	
	cp PAL_MEWMON
	jr nz, .next1
	ld a, PAL_YELLOWMON
	jr .endConvert
.next1
	cp PAL_BLUEMON
	jr nz, .next2
	ld a, PAL_PURPLEMON
	jr .endConvert
.next2
	cp PAL_REDMON
	jr nz, .next3
	ld a, PAL_PINKMON
	jr .endConvert
.next3
	cp PAL_CYANMON
	jr nz, .next4
	ld a, PAL_GREENMON
	jr .endConvert
.next4
	cp PAL_PURPLEMON
	jr nz, .next5
	ld a, PAL_GRAYMON
	jr .endConvert
.next5
	cp PAL_BROWNMON
	jr nz, .next6
	ld a, PAL_REDMON
	jr .endConvert
.next6
	cp PAL_GREENMON
	jr nz, .next7
	ld a, PAL_BLUEMON
	jr .endConvert
.next7
	cp PAL_PINKMON
	jr nz, .next8
	ld a, PAL_CYANMON
	jr .endConvert
.next8
	cp PAL_YELLOWMON
	jr nz, .next9
	ld a, PAL_BROWNMON
	jr .endConvert
.next9
	cp PAL_GRAYMON
	jr nz, .endConvert
	ld a, PAL_MEWMON
.endConvert
	ret
