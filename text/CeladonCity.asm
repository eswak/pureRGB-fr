_CeladonCityLittleGirlText::
	text "J'ai eu mon"
	line "SMOGO à"
	cont "CRAMOIS'ILE!"

	para "Il est gentil"
	line "mais il crache du"
	cont "poison pour un"
	cont "rien!"
	done

_CeladonCityLittleGirlText2::
	text "Want to see?"
	done

_CeladonCityLittleGirlText3::
	text "Haha, it is pretty"
	line "cool after all!"
	done

_KoffingLearnsetText::
	text "Watch this!"
	para "Go, KOFFING!@"
	text_asm
	ld a, [wPlayerDirection]
	cp PLAYER_DIR_RIGHT
	lb hl, 1, 1
	jr z, .continue
	cp PLAYER_DIR_UP
	lb hl, -1, -1
	jr z, .continue
	cp PLAYER_DIR_DOWN
	lb hl, -1, 1
	jr z, .continue
	lb hl, -2, 0
.continue
	ld de, vNPCSprites tile $78
	lb bc, CELADONCITY_ANIMATION_PROXY, KOFFING
	predef MakePokemonAppearInOverworld
	ld a, KOFFING
	call PlayCry
	rst TextScriptEnd

_CeladonCityGramps1Text::
	text "Héhé! Cette ARENE"
	line "est terrible! Y'a"
	cont "plein d'meufs!"
	done

_CeladonCityGirlText::
	text "Le CASINO n'est"
	line "pas très bon pour"
	cont "notre image!"
	done

_CeladonCityGramps2Text::
	text "Pfff... J'ai tout"
	line "perdu au CASINO!"

	para "J'aurais dû"
	line "acheter un prix"
	cont "avec mes jetons"
	cont "avant de tout"
	cont "claquer!"
	done

_CeladonCityGramps3Text::
	text "Bonjour!"

	para "Enfin tu viens"
	line "me parler!"

	para "Allez, tiens!"
	line "C'est pour toi!"
	prompt

_CeladonCityGramps3Text2::
	text "Hello again!"
	para "Do your #MON"
	line "want to learn?"
	prompt

_CeladonPoolGrampsAfterTeachText::
	text "A new move is"
	line "always exciting!"
	para "Use it well!"
	done

_GenericPlayerReceivedText::
_PewterGymReceivedTM34Text::
_CeruleanGymMistyReceivedTM11Text::
_VermilionGymLTSurgeReceivedTM24Text::
_CeladonGymReceivedTM21Text::
_CeladonMart3FClerkReceivedTM18Text::
_CeladonMartRoofLittleGirlReceivedTM13Text::
_CeladonMartRoofLittleGirlReceivedTM48Text::
_CopycatsHouse2FCopycatReceivedTM31Text::
_MrPsychicsHouseMrPsychicReceivedTM29Text::
_SaffronGymSabrinaReceivedTM46Text::
_FuchsiaGymKogaReceivedTM06Text::
_WardensHouseWardenReceivedHM04Text::
_SafariZoneSecretHouseFishingGuruReceivedHM03Text::
_CinnabarGymBlaineReceivedTM38Text::
_CinnabarLabMetronomeRoomScientist1ReceivedTM35Text::
_ViridianCityFisherReceivedTM42Text::
_ViridianGymGiovanniReceivedTM27Text::
_Route12Gate2FBrunetteGirlReceivedTM39Text::
	text "<PLAYER> reçoit:"
	line "@"
	text_ram_stringbuffer
	text "!@"
	text_end

_CeladonCityGramps3TM41ExplanationText::
	text "La CT41 contient"
	line "E-COQUE!"

	para "Un seul #MON"
	line "peut l'utiliser:"

	para "LEVEINARD!"
	done

_CeladonCityGramps3TM41NoRoomText::
	text "Oh! Ton sac est"
	line "plein!"
	done

_CeladonCityFisherText::
	text "C'est mon copain:"
	line "TARTARD!"

	para "Il n'était qu'un"
	line "TETARTE avant"
	cont "d'utiliser une"
	cont "PIERRE EAU!"
	done

_CeladonCityFisher2Text::
	text "Want to see some"
	line "of its moves?"
	done

_PoliwrathLearnsetText::
	text "Ready, @"
	text_ram_namebuffer
	text "?"
	prompt

_CeladonCityPoliwrathText::
	text "TARTARD: Tarta!"
	line "Taaaar!@"
	text_end

_CeladonCityRocket1Text::
	text "Kesstu mates?"
	done

_CeladonCityRocket2Text::
	text "Laisse la TEAM"
	line "tranquille!"
	done

_CeladonCityTrainerTips1Text::
	text "ASTUCE"

	para "PRECISION +"
	line "augmente la"
	cont "précision des"
	cont "attaques!"

	para "MUSCLE +"
	line "augmente les"
	cont "chances de coups"
	cont "critiques!"

	para "Les meilleurs"
	line "objets sont en"
	cont "vente au CENTRE"
	cont "COMMERCIAL de"
	cont "CELADOPOLE!"
	done

_CeladonCitySignText::
	text "CELADOPOLE"
	line "Ville aux rêves"
	cont "arc-en-ciel"
	done

_CeladonCityGymSignText::
	text "CELADOPOLE"
	line "ARENE #MON"
	cont "CHAMPION: ERIKA"

	para "Le combat par"
	line "les plantes!"
	done

_CeladonCityMansionSignText::
	text "MANOIR CELADON"
	done

_CeladonCityDeptStoreSignText::
	text "Y'a tout c'qui"
	line "t'faut au CENTRE"
	cont "COMMERCIAL de"
	cont "CELADOPOLE!"
	done

_CeladonCityTrainerTips2Text::
	text "ASTUCE"

	para "DEFENSE SPEC"
	line "protège les"
	cont "#MON des atta-"
	cont "ques SPECIALES"
	cont "telles que le feu"
	cont "ou l'eau!"

	para "Y'a tout c'qui"
	line "t'faut au CENTRE"
	cont "COMMERCIAL de"
	cont "CELADOPOLE!"
	done

_CeladonCityPrizeExchangeSignText::
	text "CHANGE"
	line "Des jetons contre"
	cont "de bô prix!"
	done

_CeladonCityGameCornerSignText::
	text "CASINO ROCKET"
	line "Club de jeu"
	cont "pour adultes!"
	done

_CeladonCityText19::
	text "ASTUCE"
	para "Ouvre le menu"
	line "START et descends"
	cont "jusqu'à l'option"
	cont "SAUVEGARDER."
	para "Puis appuie sur"
	line "SELECT pour"
	cont "changer de BOITE"
	cont "<PC> quand tu"
	cont "veux!"
	done

_GenericPackIsFullOfItemsText::
	text "Oh, ton sac est"
	line "plein d'objets!"
	done