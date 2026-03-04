DEF OPTIONS_PAGE_5_COUNT EQU 7 ; 5 upstream + bonbons + déblocage
DEF OPTIONS_PAGE_5_NUMBER EQU 5
DEF OPTIONS_PAGE_5_TOGGLE_COUNT EQU 6

; format: "bit set" x position, "bit not set" x position, which bit it is, pointer to wram variable
Options3XPosBitData:
	db 15, 12, FLAG_LEARNSETS_DISABLED % 8
	dw wEventFlags + (FLAG_LEARNSETS_DISABLED / 8)
	db 14, 11, BIT_NEW_TITLE_SCREEN
	dw wSpriteOptions2
	db 14, 11, BIT_SKIP_INTRO
	dw wSpriteOptions2
	db 14, 11, FLAG_FLASHING_REDUCED % 8
	dw wEventFlags + (FLAG_FLASHING_REDUCED / 8)
	db 15, 11, FLAG_IMPERIAL_METRIC % 8
	dw wEventFlags + (FLAG_IMPERIAL_METRIC / 8)
	db 11, 15, BIT_TRAINER_CANDIES
	dw wOptions3


OptionsMenu3Header:
	dw DrawOptionsMenu3
	dw Options3SetCursorPositionActions
	dw SetOptions3FromCursorPositions
	dw Options3LeftRightFuncs
	dw DisplayOptionMenu
	dw DisplaySpriteOptions
	dw OptionsPage3AorSelectButton
	dw Options3InfoTextJumpTable
	; fall through
DisplayOptions3:
	ld hl, OptionsMenu3Header
	ld bc, OptionsMenu3Data
	jp DisplayOptionMenuCommon

; first byte = y coord
; second byte = which option on the page it is (cancel always = max option value)
Options3CoordOffsetList:
	db 3, 0
	db 5, 1
	db 7, 2
	db 9, 3
	db 11, 4
	db 13, 5
	db 15, 6
	db PAGE_CONTROLS_Y_COORD, MAX_OPTIONS_PER_PAGE

OptionsMenu3Data:
	db OPTIONS_PAGE_5_COUNT ; length of list
	db OPTIONS_PAGE_5_NUMBER ; current page
	db HOW_MANY_MAIN_OPTIONS_PAGES ; how many pages in total
	dw Options3CoordOffsetList

Options3SetCursorPositionActions:
	dw SetCursorPositionFromOptions3
	dw SetCursorPositionFromOptions3
	dw SetCursorPositionFromOptions3
	dw SetCursorPositionFromOptions3
	dw SetCursorPositionFromOptions3
	dw SetCursorPositionFromOptions3
	dw SetDeblocageCursorPosition

OptionsMenu3Text:
	db   "OPTIONS 3"
	next " LEARNSETS: ON OFF"
	next " TITRE:    OG Pure"
	next " INTRO:    ON  OFF"
	next " FLASHS:   OG  <-"
	next " UNITES:   IMP MET"
	next " BONBONS:  ON  OFF"
	next " DEBLOCAGE@"

DrawOptionsMenu3:
	hlcoord 0, 0
	lb bc, 15, 18
	call TextBoxBorder
	hlcoord 1, 1
	ld de, OptionsMenu3Text
	jp PlaceString

Options3LeftRightFuncs:
	dw Options3CursorToggleFunc15
	dw Options3CursorToggleFunc14
	dw Options3CursorToggleFunc14
	dw Options3CursorToggleFunc14
	dw Options3CursorToggleFunc15b
	dw Options3CursorToggleFunc15b
	dw OptionsDoNothing
	dw CursorCancelRow

Options3CursorToggleFunc14:
	ld b, %101
	jp GenericOptionsCursorToggleFunc

Options3CursorToggleFunc15:
	ld b, %11
	jp GenericOptionsCursorToggleFunc

Options3CursorToggleFunc15b:
	ld b, %100
	jp GenericOptionsCursorToggleFunc

SetDeblocageCursorPosition:
	ld a, 1
	ld [wOptions7CursorX], a
	ret

SetOptions3FromCursorPositions:
	ld de, wOptions1CursorX
	ld hl, Options3XPosBitData
	ld b, OPTIONS_PAGE_5_TOGGLE_COUNT
	jp LoopGenericSetOptionsFromCursorPositions

SetCursorPositionFromOptions3:
	ld hl, Options3XPosBitData
	jp SetGenericCursorPositionFromOptions

OptionsPage3AorSelectButton:
	ldh a, [hJoy5]
	bit BIT_SELECT, a
	jr nz, .showInfo
	bit BIT_A_BUTTON, a
	jr z, .noAction
	ld a, [wCurrentOptionIndex]
	cp 6
	jr z, .doUnlock
.noAction
	and a
	ret
.showInfo
	ld a, [wTopMenuItemY]
	cp PAGE_CONTROLS_Y_COORD
	ret z
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
	ld a, [wDoUnlockFromOptions]
	and a
	jr z, .redrawMenu
	and a
	ret
.redrawMenu
	scf
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
	dw LearnsetsInfoText
	dw TitleInfoText
	dw IntroInfoText
	dw FlashingInfoText
	dw UnitsInfoText
	dw TrainerCandiesInfoText
	dw DeblocageInfoText

LearnsetsInfoText:
	text_far _LearnsetsInfoText
	text_end

TitleInfoText:
	text_far _TitleInfoText
	text_end

IntroInfoText:
	text_far _IntroInfoText
	text_end

FlashingInfoText:
	text_far _FlashingInfoText
	text_end

UnitsInfoText:
	text_far _UnitsInfoText
	text_end

TrainerCandiesInfoText:
	text_far _TrainerCandiesInfoText
	text_end

DeblocageInfoText:
	text_far _DeblocageInfoText
	text_end
