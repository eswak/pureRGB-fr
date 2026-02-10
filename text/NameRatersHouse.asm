_NameRatersHouseNameRaterWantMeToRateText::
	text "Bonjour, bonjour!"
	line "Je suis le juge"
	cont "OFFICIEL des"
	cont "SURNOMS!"

	para "Tu veux que je"
	line "note les surnoms"
	cont "de tes #MON?"
	done

_NameRatersHouseNameRaterWhichPokemonText::
	text "Quel #MON"
	line "dois-je voir?"
	prompt

_NameRatersHouseNameRaterGiveItANiceNameText::
	text_ram wNameBuffer
	text ", c'est ça?"
	line "C'est un surnom"
	cont "correct!"

	para "Mais tu veux"
	line "que je lui donne"
	cont "un plus joli nom?"

	para "Qu'en dis-tu?"
	done

_NameRatersHouseNameRaterWhatShouldWeNameItText::
	text "Bien! Comment"
	line "l'appeler?"
	prompt

_NameRatersHouseNameRaterPokemonHasBeenRenamedText::
	text "OK! Ce #MON"
	line "s'appelle"
	cont "maintenant"
	cont "@"
	text_ram wBuffer
	text "!"

	para "C'est mieux"
	line "qu'avant!"
	done

_NameRatersHouseNameRaterComeAnyTimeYouLikeText::
	text "Parfait! Reviens"
	line "quand tu veux!"
	done

;_NameRatersHouseNameRaterATrulyImpeccableNameText::
;	text_ram wNameBuffer
;	text ", c'est ça?"
;	line "Un nom vraiment"
;	cont "impeccable!"
;
;	para "Prends bien soin"
;	line "de @"
;	text_ram wNameBuffer
;	text "!"
;	done
