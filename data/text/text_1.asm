_CardKeySuccessText1::
	text "Bingo!@"
	text_end

_CardKeySuccessText2::
	text_start
	line "La CARTE MAGN. a"
	cont "ouvert la porte!"
	done

_CardKeyFailText::
	text "Zut! Il faut une"
	line "CARTE MAGN.!"
	done

_CardKeyDoneText::
	text "Toutes les portes"
	line "CARTE MAGN. ont"
	cont "été ouvertes!"
	
	para "Plus besoin de"
	line "cette CARTE MAGN."

	para "<PLAYER> l'a laissée"
	line "dans la fente!"
	done

_TrainerNameText::
	text_ram_namebuffer
	text ": @"
	text_end

_NoNibbleText::
	text "Même pas une"
	line "touche..."
	prompt

_NothingHereText::
	text "On dirait qu'il"
	line "n'y a rien ici."
	prompt

_ItsABiteText::
	text "Oh!"
	line "Ca mord!!!"
	prompt

_ExclamationText::
	text "!"
	done

;_GroundRoseText:: ; unused
;	text "Ground rose up"
;	line "somewhere!"
;	done

_BoulderText::
	text "Sans FORCE, ça"
	line "ne bougera pas!"
	done

_StrengthActive::
	text "Ce rocher peut"
	line "être déplacé!"
	done

_MartSignText::
	text "Faites le plein"
	line "d'objets!"
	cont "BOUTIQUE PKMN"
	done

_PokeCenterSignText::
	text "Soignez vos"
	line "#MON!"
	cont "CENTRE PKMN"
	done

_FoundItemText::
	text "<PLAYER> obtient..."
	line "@"
	text_ram_stringbuffer
	text "!@"
	text_end

_FoundMultipleItemText::
	text "<PLAYER> obtient..."
	line "@"
	text_ram_stringbuffer
	text " ×@"
	text_ram wTempStore1
	text "!@"
	text_end

_NoMoreRoomForItemText::
	text "Votre inventaire"
	line "est plein!"
	done

_OaksAideHiText::
	text "Salut! Tu te"
	line "rappelles? Je"
	cont "suis l'assistant"
	cont "du Prof. Chen!"

	para "Si tu attrapes @"
	text_decimal hOaksAideRequirement, 1, 3
	text " #MON"
	cont "différents, je"
	cont "suis censé"
	cont "t'offrir..."
	cont "@"
	text_ram wOaksAideRewardItemName
	text "!"

	para "Alors <PLAYER>,"
	line "as-tu attrapé au"
	cont "moins @"
	text_decimal hOaksAideRequirement, 1, 3
	text " #MON"
	cont "différents?"
	done

_OaksAideUhOhText::
	text "Voyons voir..."
	line "Oh! Tu n'as"
	cont "attrapé que @"
	text_decimal hOaksAideNumMonsOwned, 1, 3
	text_start
	cont "#MON!"

	para "Il t'en faut @"
	text_decimal hOaksAideRequirement, 1, 3
	text_start
	line "différents pour"
	cont "mériter..."
	cont "@"
	text_ram wOaksAideRewardItemName
	text "."
	done

_OaksAideComeBackText::
	text "Dans ce cas..."

	para "Reviens quand tu"
	line "auras @"
	text_decimal hOaksAideRequirement, 1, 3
	text " #MON"
	cont "différents pour"
	cont "obtenir"
	cont "@"
	text_ram wOaksAideRewardItemName
	text "."
	done

_OaksAideHereYouGoText::
	text "Super! Tu as"
	line "@"
	text_decimal hOaksAideNumMonsOwned, 1, 3
	text " #MON"
	cont "différents!"
	cont "Félicitations!"

	para "Voici ta"
	line "récompense!"
	prompt

_OaksAideGotItemText::
	text "<PLAYER> obtient"
	line "@"
	text_ram wOaksAideRewardItemName
	text "!@"
	text_end

_OaksAideNoRoomText::
	text "Oh! Tu n'as plus"
	line "de place pour"
	cont "@"
	text_ram wOaksAideRewardItemName
	text "."
	done

_ConversionEnteredAttackModeText::
	text "<USER>"
	line "passe en mode"
	cont "ATTAQUE!"
	prompt

_ConversionEnteredDefenseModeText::
	text "<USER>"
	line "passe en mode"
	cont "DEFENSE!"
	prompt

_ConversionAlreadyDefenseModeText::
	text "<USER> est"
	line "déjà en mode"
	cont "DEFENSE."
	prompt

_RematchTrainerText::
	text "Une revanche?"
	done

_EnhancedGBCColorsInfoText::
	text "Active les couleurs"
	line "GBC améliorées"
	cont "quand activé."
	done

_FuchsiaMeetingRoomOaksAideGreeting::
	text "Hé, <PLAYER>!"
	line "Comment ça va?"
	para "Je suis un des"
	line "aides du PROF."
	cont "CHEN!"
	para "Si tu as attrapé"
	line "50 #MON ou plus,"
	para "j'améliore ta"
	line "CARTE!"
	prompt

_FuchsiaMeetingRoomOaksAideHowMany::
	text "Combien de #MON"
	line "as-tu attrapés?"
	prompt

_FuchsiaMeetingRoomOaksAideNotEnough::
	text "@"
	text_decimal wNumSetBits, 1, 3
	text "? Pas assez!"
	line "Allez, courage!"
	para "Je crois en toi,"
	line "tu peux y arriver!"
	done

_FuchsiaMeetingRoomOaksAideEnough::
	text "@"
	text_decimal wNumSetBits, 1, 3
	text "? Fantastique!"
	line "On améliore la"
	cont "CARTE!"
	para "Une fonction sera"
	line "ajoutée."
	para "Elle affichera"
	line "les #MON"
	cont "sauvages par zone!"
	para "Appuie sur A sur"
	line "une zone!"
	para "Montre-moi ta"
	line "CARTE<...>"
	done


_FuchsiaMeetingRoomOaksAideNoTownmap::
	text "Quoi?!"
	para "Tu n'as pas de"
	line "CARTE?"
	para "Retourne à BOURG"
	line "PALETTE et"
	cont "demande aux gens!"
	para "Quelqu'un te"
	line "donnera une CARTE!"
	done

_FuchsiaMeetingRoomOaksAideGoodLuck::
	text "Bonne chance pour"
	line "ton voyage!"
	para "Je suis avec toi,"
	line "<PLAYER>!"
	done

_GenericThereWeGoText::
	text "Et voilà!"
	prompt
