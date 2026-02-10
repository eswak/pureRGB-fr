; PureRGBnote: ADDED: Options 3 page - "Bonbons dresseurs" ON/OFF. When ON, player receives 1 super bonbon after each trainer victory.
DEF OPTIONS_PAGE_5_COUNT EQU 2
DEF OPTIONS_PAGE_5_NUMBER EQU 5

; format: "bit set" x position, "bit not set" x position, which bit it is, pointer to wram variable
; ON at x=1 (start of line), OFF at x=10 (same layout as " ON       OFF@" on second line)
Options3XPosBitData:
	db 1, 10, BIT_TRAINER_CANDIES
	dw wOptions3
	db -1

Options3Header:
	dw DrawOptions3Menu
	dw Options3SetCursorPositionActions
	dw SetOptions3FromCursorPositions
	dw Options3LeftRightFuncs
	dw DisplayOptionMenu
	dw DisplaySpriteOptions
	dw OptionsPage3AorSelectButton
	dw Options3InfoTextJumpTable
	; fall through
DisplayOptions3:
	ld hl, Options3Header
	ld bc, Options3Data
	jp DisplayOptionMenuCommon

; Cursor Y: option 0 on "ON/OFF" line (row 2), option 1 on "DEBLOCAGE" line (row 3)
Options3YCoordVariableOffsetList:
	db 2, 0
	db 3, 1
	db PAGE_CONTROLS_Y_COORD, MAX_OPTIONS_PER_PAGE

Options3Data:
	db OPTIONS_PAGE_5_COUNT
	db OPTIONS_PAGE_5_NUMBER
	db HOW_MANY_MAIN_OPTIONS_PAGES
	dw Options3YCoordVariableOffsetList

Options3SetCursorPositionActions:
	dw SetCursorPositionFromOptions3
	dw SetDeblocageCursorPosition
	dw CursorCancelRow

Options3LeftRightFuncs:
	dw GenericOptions3CursorToggleFunc
	dw OptionsDoNothing
	dw CursorCancelRow

SetDeblocageCursorPosition:
	ld a, 1
	ld [wOptions2CursorX], a
	ret

GenericOptions3CursorToggleFunc:
	ld b, $0b ; 11: toggle between x=1 (ON) and x=10 (OFF), since 1 xor 11 = 10 and 10 xor 11 = 1
	jp GenericOptionsCursorToggleFunc

SetOptions3FromCursorPositions:
	ld de, wOptions1CursorX
	ld hl, Options3XPosBitData
	ld b, 1
	xor a
	jp LoopGenericSetOptionsFromCursorPositions

SetCursorPositionFromOptions3:
	ld hl, Options3XPosBitData
	ld de, 0
	jp SetGenericCursorPositionFromOptions

Options3MenuText:
	db   " BONBONS DRESSEURS"
	next " ON       OFF"
	next " DEBLOCAGE@"

DrawOptions3Menu:
	; Box height 5 so border ends just below "DEBLOCAGE" (rows 1-3)
	hlcoord 0, 0
	lb bc, 5, 18
	call TextBoxBorder
	hlcoord 1, 1
	ld de, Options3MenuText
	call PlaceString
	hlcoord 0, 15
	lb bc, 3, SCREEN_WIDTH
	jp ClearScreenArea

OptionsPage3AorSelectButton:
	ldh a, [hJoy5]
	bit BIT_SELECT, a
	jr nz, .showInfo
	bit BIT_A_BUTTON, a
	jr z, .noAction
	ld a, [wCurrentOptionIndex]
	cp 1
	jr z, .doUnlock
.noAction
	and a
	ret
.showInfo
	ld h, b
	ld l, c
	inc hl
	inc hl
	hl_deref
	ld a, [wCurrentOptionIndex]
	call GetAddressFromPointerArray
	call PrintText
	scf
	ret
.doUnlock
	call DoUnlockFromOptions
	and a
	ret

DoUnlockFromOptions:
	xor a
	ld [wDoUnlockFromOptions], a
	callfar CheckIfInFlyMap
	jr z, .canFly
	ld hl, wStatusFlags6
	set BIT_FLY_WARP, [hl]
	set BIT_ESCAPE_WARP, [hl]
	ld hl, wStatusFlags4
	set BIT_UNKNOWN_4_1, [hl]
	res BIT_NO_BATTLES, [hl]
	ld a, 2
	ld [wDoUnlockFromOptions], a
	ret
.canFly
	callfar ChooseFlyDestination
	ld a, [wStatusFlags6]
	bit BIT_FLY_WARP, a
	ret z
	ld a, 2
	ld [wDoUnlockFromOptions], a
	ResetFlag FLAG_DIG_OVERWORLD_ANIMATION
	callfar ClearSafariFlags
	ret

Options3InfoTextJumpTable:
	dw TrainerCandiesInfoText
	dw DeblocageInfoText

TrainerCandiesInfoText:
	text_far _TrainerCandiesInfoText
	text_end

DeblocageInfoText:
	text_far _DeblocageInfoText
	text_end
