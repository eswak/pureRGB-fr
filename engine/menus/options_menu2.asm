; PureRGBnote: ADDED: one of the new pages in the options menu. This one's for main gameplay features.

DEF OPTIONS_PAGE_2_COUNT EQU 6 ; number of options on this page
DEF OPTIONS_PAGE_2_NUMBER EQU 2 ; must be 1 digit

DEF OPTION_COLORS_LEFT_XPOS EQU 8
DEF OPTION_COLORS_MIDDLE_XPOS EQU 11
DEF OPTION_COLORS_RIGHT_XPOS EQU 16
DEF OPTION_ALT_PALETTES_LEFT_XPOS EQU 4
DEF OPTION_ALT_PALETTES_RIGHT_XPOS EQU 11
DEF OPTION_MUSIC_LEFT_XPOS EQU 12
DEF OPTION_MUSIC_RIGHT_XPOS EQU 15
DEF OPTION_AUDIO_PAN_LEFT_XPOS EQU 12
DEF OPTION_AUDIO_PAN_RIGHT_XPOS EQU 16
DEF OPTION_BIKE_SONG_LEFT_XPOS EQU 12
DEF OPTION_BIKE_SONG_RIGHT_XPOS EQU 15
DEF OPTION_GBC_FADE_LEFT_XPOS EQU 12
DEF OPTION_GBC_FADE_RIGHT_XPOS EQU 16

DEF OPTION_ALT_PALETTES_BIT EQU BIT_ALT_PKMN_PALETTES
DEF OPTION_MUSIC_BIT EQU BIT_MUSIC
DEF OPTION_AUDIO_PAN_BIT EQU BIT_AUDIO_PAN
DEF OPTION_BIKE_SONG_BIT EQU BIT_BIKE_MUSIC


OptionsMenu2Header:
	dw DrawOptions2Menu
	dw Options2SetCursorPositionActions
	dw SetOptions2FromCursorPositions
	dw Options2LeftRightFuncs
	dw DisplayBattleOptions
	dw DisplayOptionMenu
	dw OptionsPage2AorSelectButton
	dw OptionsMenu2InfoTextJumpTable
	; fall through
DisplayOptions2:
	ld hl, OptionsMenu2Header
	ld bc, OptionsMenu2Data
	jp DisplayOptionMenuCommon

; first byte = y coord
; second byte = which option on the page it is (cancel always = max option value)
Options2YCoordVariableOffsetList:
	db 3, 0
	db 7, 1
	db 9, 2
	db 11, 3
	db 13, 4
	db 15, 5
	db PAGE_CONTROLS_Y_COORD, MAX_OPTIONS_PER_PAGE

OptionsMenu2Data:
	db OPTIONS_PAGE_2_COUNT ; length of list
	db OPTIONS_PAGE_2_NUMBER ; current page
	db HOW_MANY_MAIN_OPTIONS_PAGES ; how many pages in total
	dw Options2YCoordVariableOffsetList

Options2SetCursorPositionActions:
	dw SetColorsCursorPosition
	dw SetAltPalettesCursorPosition
	dw SetMusicCursorPosition
	dw SetAudioPanCursorPosition
	dw SetBikeSongCursorPosition
	dw SetGBCFadeCursorPosition

Options2LeftRightFuncs:
	dw CursorInColors
	dw CursorInAltPalettes
	dw CursorInMusic
	dw CursorInAudioPan
	dw CursorInBikeSong
	dw CursorInGBCFade
	dw CursorCancelRow

DrawOptions2Menu:
	hlcoord 0, 0
	lb bc, 15, 18
	call TextBoxBorder
	hlcoord 1, 1
	ld de, Options2Text
	call PlaceString
	ld a, [wOptions2]
	and %01000011
	jp PrintSGBYellowOptionNumbers

Options2Text:
	db   "OPTIONS 2"
	next " COLOR: OG SGB  Y "
	next " ALT PKMN COLORS:"
	next "    OFF    ON"
	next " MUSIC:     OG OG+"
	next " AUDIO PAN: OFF ON"
	next " BIKE SONG: ON OFF"
	next " GBC FADE:  OFF ON@"

OptionsPage2AorSelectButton:
	ld a, [hJoy5]
	bit BIT_A_BUTTON, a
	jp z, OptionsPageAorSelectButtonDefault
	; fall through
OptionsPage2AButton:
	ld a, [Options2YCoordVariableOffsetList]
	ld b, a
	ld a, [wTopMenuItemY]
	cp b ;is the cursor on the COLORS row?
	jr nz, .done
	ld a, [wTopMenuItemX]
	cp OPTION_COLORS_LEFT_XPOS ; is the cursor on OG?
	jr z, .done ; don't toggle if on OG
	call ToggleAltSGBYellowColors
.done
	and a ; clear carry
	ret

CursorInColors:
	push bc
	xor a
	call PrintSGBYellowOptionNumbers ; if we move left or right on the COLORS menu we will switch back to SGB1 and Y1 visually
	pop bc
	call GetTwoBitXPosition
	ld a, b
	ld [wOptions1CursorX], a
	jp EraseOldMenuCursor

CursorInAltPalettes:
	ld a, [wOptions2CursorX] ; battle animation cursor X coordinate
	xor %1111 ; toggle between 4 and 11
	ld [wOptions2CursorX], a
	jp EraseOldMenuCursor

CursorInMusic:
	ld a, [wOptions3CursorX] ; music X coordinate
	xor %11 ; toggle between 12 and 15
	ld [wOptions3CursorX], a
	jp EraseOldMenuCursor

CursorInAudioPan:
	ld a, [wOptions4CursorX] ; battle animation cursor X coordinate
	xor %11100 ; toggle between 12 and 16
	ld [wOptions4CursorX], a
	jp EraseOldMenuCursor

CursorInBikeSong:
	ld a, [wOptions5CursorX] ; battle animation cursor X coordinate
	xor %11 ; toggle between 12 and 15
	ld [wOptions5CursorX], a
	jp EraseOldMenuCursor

CursorInGBCFade:
	ld a, [wOptions6CursorX] ; battle animation cursor X coordinate
	xor %11100 ; toggle between 12 and 16
	ld [wOptions6CursorX], a
	jp EraseOldMenuCursor

GetTwoBitXPosition:
	ld a, b
	bit BIT_D_LEFT, b ; did the player press the left button
	ld a, [wOptions1CursorX] ; battle animation cursor X coordinate
	jr nz, .left
	ld b, OPTION_COLORS_LEFT_XPOS
	cp OPTION_COLORS_RIGHT_XPOS
	ret z
	ld b, OPTION_COLORS_MIDDLE_XPOS
	cp OPTION_COLORS_LEFT_XPOS
	ret z
	ld b, OPTION_COLORS_RIGHT_XPOS
	ret
.left
	ld b, OPTION_COLORS_MIDDLE_XPOS
	cp OPTION_COLORS_RIGHT_XPOS
	ret z
	ld b, OPTION_COLORS_LEFT_XPOS
	cp OPTION_COLORS_MIDDLE_XPOS
	ret z
	ld b, OPTION_COLORS_RIGHT_XPOS
	ret

; sets the options variable according to the current placement of the menu cursors in the options menu
SetOptions2FromCursorPositions:
	ld a, [wOptions2]
	ld b, a
	ld d, a
	; shinpokerednote: ADDED: save enhanced colors state before changing
	ld a, [wUnusedD721]
	push af
	push bc
	call SetTwoBitPropFromXPosition
	ld hl, wOptions2
	ld a, [wOptions2CursorX] ; alt palettes cursor X coord
	lb bc, BIT_ALT_PKMN_PALETTES, OPTION_ALT_PALETTES_RIGHT_XPOS
	call SetSingleBitOption
	ld a, [wOptions3CursorX] ; music cursor X coord
	lb bc, OPTION_MUSIC_BIT, OPTION_MUSIC_RIGHT_XPOS
	call SetSingleBitOption
	ld a, [wOptions4CursorX] ; audio pan cursor X coord
	lb bc, OPTION_AUDIO_PAN_BIT, OPTION_AUDIO_PAN_RIGHT_XPOS
	call SetSingleBitOption
	ld a, [wOptions5CursorX]
	lb bc, OPTION_BIKE_SONG_BIT, OPTION_BIKE_SONG_RIGHT_XPOS
	call SetSingleBitOption
	ld a, [wOptions6CursorX]
	lb bc, BIT_GBC_FADE, OPTION_GBC_FADE_RIGHT_XPOS
	call SetSingleBitOption
	pop bc
	pop af ; restore old enhanced colors state
	ld c, a
	jp CompareOptions2

SetTwoBitPropFromXPosition:
	ld a, [wOptions1CursorX] ; colors x coordinate
	cp OPTION_COLORS_RIGHT_XPOS 
	jr z, .option1setRight
	cp OPTION_COLORS_MIDDLE_XPOS 
	jr z, .option1setMiddle
.option1setLeft
	ld b, PALETTES_DEFAULT
	; shinpokerednote: ADDED: disable enhanced colors when not Y
	ld a, [wUnusedD721]
	res 7, a
	ld [wUnusedD721], a
	jr .done
.option1setRight
	ld a, [wOptions2]
	and %01000011
	cp PALETTES_YELLOW2
	ret z ; preserve Y2/Y3 state when moving to Y
	ld b, PALETTES_YELLOW
	; shinpokerednote: ADDED: disable enhanced colors when moving to Y (will be set by ToggleAltSGBYellowColors if Y3)
	ld a, [wUnusedD721]
	res 7, a
	ld [wUnusedD721], a
	jr .done
.option1setMiddle
	ld a, [wOptions2]
	and %01000011
	cp PALETTES_SGB2
	ret z ; preserve SGB2 state when moving to SGB
	ld b, PALETTES_SGB
	; shinpokerednote: ADDED: disable enhanced colors when not Y
	ld a, [wUnusedD721]
	res 7, a
	ld [wUnusedD721], a
.done
	ld a, [wOptions2]
	and %10111100 ; reset bit 6 when moving between main color modes
	xor b
	ld [wOptions2], a
	ret

CompareOptions2:
	; b = old setting of Options2 before changing it
	; c = old setting of wUnusedD721 before changing it
	ld hl, wOptions2
	ld a, b ; old Options2
	and %01000011
	ld d, a
	ld a, [hl] ; new Options2
	and %01000011
	cp d
	jp nz, RunDefaultPaletteCommand ; reset palettes if main color mode changed
	; check if we're switching to/from Y3 (Y2 + enhanced colors)
	ld a, [hl] ; new Options2
	and %01000011
	cp PALETTES_YELLOW2
	jr nz, .notY2orY3
	; we're in Y2 mode, check if enhanced colors state changed
	ld a, [wUnusedD721]
	bit 7, a ; new enhanced colors state
	ld e, a
	ld a, c
	bit 7, a ; old enhanced colors state
	cp e
	jp nz, RunDefaultPaletteCommand ; refresh if enhanced colors toggle changed
	jr .checkOtherOptions
.notY2orY3
	; not in Y2/Y3 mode, check if we were in Y3 before
	ld a, b ; old Options2
	and %01000011
	cp PALETTES_YELLOW2
	jr nz, .checkOtherOptions
	ld a, c ; old wUnusedD721
	bit 7, a
	jr z, .checkOtherOptions
	; was Y3, now something else - refresh palettes
	jp RunDefaultPaletteCommand
.checkOtherOptions
	ld a, [wNewInGameFlags]
	bit IN_GAME, a
	ret z ; don't need to do anything else if we're in the title screen menus
	ld a, b
	and 1 << BIT_BIKE_MUSIC
	ld c, a
	ld a, [hl]
	and 1 << BIT_BIKE_MUSIC
	cp c
	jr nz, .tryPlayBikeMusic
	ld a, b
	and 1 << BIT_MUSIC
	ld c, a
	ld a, [hl]
	and 1 << BIT_MUSIC
	cp c
	jr nz, .tryChangeMusic
	ret
.tryPlayBikeMusic
	ld a, [wWalkBikeSurfState]
	cp BIKING
	ret nz
	ld a, [wCurMapConnections]
	bit BIT_EXTRA_MUSIC_MAP, a
	jp z, PlayDefaultMusic
.extraMusicBank
	ld d, 1
	jpfar TryPlayExtraMusic
.tryChangeMusic
	ld a, [wCurMapConnections]
	bit BIT_EXTRA_MUSIC_MAP, a
	ret z
	jr .extraMusicBank

SetColorsCursorPosition:
	ld hl, wOptions2
	call GetTwoBitXPositionFromOptions
	call LoadXValueAndGetHLCoord
	jp PlaceUnfilledRightArrow

SetAltPalettesCursorPosition:
	ld hl, wOptions2
	ld a, OPTION_ALT_PALETTES_RIGHT_XPOS
	ld d, OPTION_ALT_PALETTES_LEFT_XPOS
	ld c, OPTION_ALT_PALETTES_BIT
	jp SetSingleBitOptionCursorPosition

SetMusicCursorPosition:
	ld hl, wOptions2
	ld a, OPTION_MUSIC_RIGHT_XPOS
	ld d, OPTION_MUSIC_LEFT_XPOS
	ld c, OPTION_MUSIC_BIT
	jp SetSingleBitOptionCursorPosition

SetAudioPanCursorPosition:
	ld hl, wOptions2
	ld a, OPTION_AUDIO_PAN_RIGHT_XPOS
	ld d, OPTION_AUDIO_PAN_LEFT_XPOS
	ld c, OPTION_AUDIO_PAN_BIT
	jp SetSingleBitOptionCursorPosition

SetBikeSongCursorPosition:
	ld hl, wOptions2
	ld a, OPTION_BIKE_SONG_RIGHT_XPOS
	ld d, OPTION_BIKE_SONG_LEFT_XPOS
	ld c, OPTION_BIKE_SONG_BIT
	jp SetSingleBitOptionCursorPosition

SetGBCFadeCursorPosition:
	ld hl, wOptions2
	ld a, OPTION_GBC_FADE_RIGHT_XPOS
	ld d, OPTION_GBC_FADE_LEFT_XPOS
	ld c, BIT_GBC_FADE
	jp SetSingleBitOptionCursorPosition

GetTwoBitXPositionFromOptions:
	ld a, [hl]
	and %11 ;only care about first two bits
	ld b, OPTION_COLORS_LEFT_XPOS
	ret z
	cp %11
	ld b, OPTION_COLORS_RIGHT_XPOS
	ret z
	ld b, OPTION_COLORS_MIDDLE_XPOS
	ret

ToggleAltSGBYellowColors:
	ld a, SFX_PRESS_AB
	rst _PlaySound
	ld a, [wOptions2]
	and %11 ; check only bits 0-1 to see if we're in Y mode
	cp %11 ; PALETTES_YELLOW has bits 0-1 = %11
	jr nz, .notYellow
	; We're on Y, cycle between Y1, Y2, Y3
	ld a, [wOptions2]
	bit BIT_SECONDARY_PALETTES, a
	jr z, .isY1
	; bit 6 is set, so we're either Y2 or Y3
	ld a, [wUnusedD721]
	bit 7, a
	jr z, .isY2
	; Currently Y3, go back to Y1
	ld a, [wOptions2]
	res BIT_SECONDARY_PALETTES, a
	ld [wOptions2], a
	ld a, [wUnusedD721]
	res 7, a
	ld [wUnusedD721], a
	jr .doneYellow
.isY2
	; Currently Y2, go to Y3
	ld a, [wUnusedD721]
	set 7, a
	ld [wUnusedD721], a
	jr .doneYellow
.isY1
	; Currently Y1, go to Y2
	ld a, [wOptions2]
	set BIT_SECONDARY_PALETTES, a
	ld [wOptions2], a
	ld a, [wUnusedD721]
	res 7, a
	ld [wUnusedD721], a
.doneYellow
	ld a, [wOptions2]
	and %01000011
	call PrintSGBYellowOptionNumbers
	jp RunDefaultPaletteCommand
.notYellow
	; We're on SGB, toggle between SGB1 and SGB2
	ld a, [wOptions2]
	xor %01000000
	ld [wOptions2], a
	and %01000011
	call PrintSGBYellowOptionNumbers
	jp RunDefaultPaletteCommand

; input: a = color mode indicator. Bit 6 indicates if alternate color mode is activated. First 2 bits indictate the main color mode.
PrintSGBYellowOptionNumbers:
	hlcoord 15, 3
	cp %01000001
	ld [hl], "2"
	jr z, .next
	ld [hl], "1"
.next
	hlcoord 18, 3
	cp %01000011
	jr nz, .notY2orY3
	; shinpokerednote: ADDED: check if Y3 is selected (Y2 + enhanced colors)
	ld a, [wUnusedD721]
	bit 7, a
	ld [hl], "3"
	ret nz
	ld [hl], "2"
	ret
.notY2orY3
	ld [hl], "1"
	ret


OptionsMenu2InfoTextJumpTable:
	dw ColorsOptionInfoText
	dw AltPkmnColorsInfoText
	dw MusicInfoText
	dw AudioPanInfoText
	dw BikeSongInfoText
	dw GBCFadeInfoText

ColorsOptionInfoText:
	text_far _ColorsOptionInfoText
	text_end

AltPkmnColorsInfoText:
	text_far _AltPkmnColorsInfoText
	text_end	

MusicInfoText:
	text_far _MusicInfoText
	text_end

AudioPanInfoText:
	text_far _AudioPanInfoText
	text_end

BikeSongInfoText:
	text_far _BikeSongInfoText
	text_end

GBCFadeInfoText:
	text_far _GBCFadeInfoText
	text_end
