; PureRGBnote: MOVED: These tables and wrappers were moved from Battle Core section to fix bank overflow.
; The Battle Core section exceeded its 0x4000 byte limit by 11 bytes.

INCLUDE "data/battle/mist_blocked_moves.asm"

; Wrapper for CheckIsMistBlockedMove - must be in same bank as MistBlockedMoves for IsInArray to read correctly
CheckIsMistBlockedMoveInBank::
	ld de, 1
	ld hl, MistBlockedMoves
	jp IsInArray

INCLUDE "data/battle/critical_hit_moves.asm"

; Wrapper for critical hit rate calculation - must be in same bank as HighCriticalMoves for the loop to read correctly
; Input: b = base rate (speed/2), c = move id
; Output: b = adjusted crit rate
CalcCriticalHitRateInBank::
	ld hl, HighCriticalMoves
.loop
	ld a, [hli]
	cp -1
	jr z, .notHighCrit
	cp c
	jr nz, .loop
	; high crit move
	sla b
	jr c, .capCritical
	sla b
	jr c, .capCritical
	sla b
	jr nc, .finishcalc
.capCritical
	ld b, $ff
.finishcalc
	ret
.notHighCrit
	srl b
	ret
