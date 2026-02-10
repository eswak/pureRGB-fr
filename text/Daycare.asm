_DaycareGentlemanIntroText::
	text "Je tiens une"
	line "PENSION. Tu veux"
	cont "que j'eleve un"
	cont "de tes #MON?"
	done

_DaycareGentlemanWhichMonText::
	text "Quel #MON"
	line "dois-je elever?"
	prompt

_DaycareGentlemanWillLookAfterMonText::
	text "Bien, je m'occupe"
	line "de @"
	text_ram wNameBuffer
	text_start
	cont "un moment."
	prompt

_DaycareGentlemanComeSeeMeInAWhileText::
	text "Reviens me voir"
	line "dans un moment."
	done

_DaycareGentlemanMonHasGrownText::
	text "Ton @"
	text_ram wNameBuffer
	text_start
	line "a bien grandi!"

	para "En niveau, il a"
	line "pris @"
	text_decimal wDayCareNumLevelsGrown, 1, 3
	text "!"

	para "Je suis pas"
	line "genial?"
	prompt

_DaycareGentlemanOweMoneyText::
	text "Tu me dois ¥@"
	text_bcd wDayCareTotalCost, 2 | LEADING_ZEROES | LEFT_ALIGN
	text_start
	line "pour recuperer"
	cont "ce #MON."
	done

_DaycareGentlemanGotMonBackText::
	text "<PLAYER> recupere"
	line "@"
	text_ram wDayCareMonName
	text "!"
	done

_DaycareGentlemanMonNeedsMoreTimeText::
	text "Deja de retour?"
	line "Ton @"
	text_ram wNameBuffer
	text_start
	cont "a besoin de"
	cont "rester un peu."
	prompt
