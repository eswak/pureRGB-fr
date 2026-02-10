_PewterGymBrockPostBattleAdviceText::
	text "Il y a plusieurs"
	line "types de"
	cont "dresseurs dans le"
	cont "monde!"

	para "Tu sembles être"
	line "un dresseur"
	cont "d'exception!"

	para "Va à l'ARENE"
	line "d'AZURIA pour"
	cont "tester tes"
	cont "capacités."
	done

_PewterGymBrockWaitTakeThisText::
	text "Attends! Prends"
	line "ça avec toi!"
	done

_TM34ExplanationText::
	text_start

	para "Une CT (Capsule"
	line "Tech.) contient"
	cont "une attaque à"
	cont "enseigner à un"
	cont "#MON!"

	para "Une CT ne marche"
	line "qu'une fois!"
	cont "Alors choisis"
	cont "bien le #MON"
	cont "à qui la donner!"

	para "@"
	text_ram wStringBuffer
	text " contient"
	line "PATIENCE!"

	para "Ton #MON"
	line "absorbera les"
	cont "dégâts pour"
	cont "ensuite infliger"
	cont "le double!"
	done

_GenericNoRoomText::
_PewterGymTM34NoRoomText::
	text "Votre inventaire"
	line "est plein!"
	done

_PewterGymBrockReceivedBoulderBadgeText::
	text "Hmm..."
	line "Beau combat."

	para "En reconnaissance"
	line "de ta victoire,"
	cont "voici le BADGE"
	cont "ROCHE!"

	para "<PLAYER> reçoit"
	line "le BADGE ROCHE!@"
	text_end

_PewterGymBrockBoulderBadgeInfoText::
	text_start

	para "C'est un BADGE"
	line "officiel de la"
	cont "LIGUE #MON!"

	para "Les #MON de"
	line "son détenteur"
	cont "deviennent plus"
	cont "puissants!"

	para "La technique"
	line "FLASH peut être"
	cont "utilisée!"
	prompt

_PewterGymCooltrainerMBattleText::
	text "Une minute,"
	line "gamin!"

	para "Tu es encore loin"
	line "de PIERRE, tu"
	cont "vas devoir"
	cont "m'affronter!"
	done

_PewterGymCooltrainerMEndBattleText::
	text "Zut!"

	para "J'aurais dû te"
	line "laisser passer!"
	prompt

_PewterGymCooltrainerMAfterBattleText::
	text "Tu es fort..."
	line "Mais pas autant"
	cont "que PIERRE!"
	done

_PewterGymGuidePreAdviceText::
	text "Salut graine de"
	line "CHAMPION!"

	para "Je ne suis pas"
	line "dresseur mais mes"
	cont "conseils sont"
	cont "avisés!"

	para "Laisse-moi te"
	line "mener à la"
	cont "victoire!"
	done

_PewterGymGuideBeginAdviceText::
	text "OK! C'est"
	line "parti!"
	prompt

_PewterGymGuideAdviceText::
	text "Le 1er #MON"
	line "apparaissant dans"
	cont "un combat est"
	cont "celui en tête de"
	cont "la LISTE #MON!"

	para "En changeant"
	line "l'ordre des"
	cont "#MON, tu"
	cont "peux changer de"
	cont "stratégie!"
	done

_PewterGymGuideFreeServiceText::
	text "C'est gratuit,"
	line "profites-en! "
	prompt

_PewterGymGuidePostBattleText::
	text "Je le savais!"
	line "Tu as l'âme d'un"
	cont "champion!"
	prompt

_PewterGymGuideApexChipText::
	text "Je veux que tu"
	line "aies ça!"
	prompt

_ReceivedApexChipsText::
	text "<PLAYER> reçoit"
	line "2 PUCE APEX!@"
	text_end

_ApexChipExplanationText::
	text_start

	para "La PUCE APEX est"
	line "une micropuce"
	cont "spéciale que j'ai"
	cont "développée."
	
	para "Tu l'installes"
	line "sur la # BALL"
	cont "d'un #MON."

	para "Elle simule"
	line "l'environnement"
	cont "sauvage naturel"
	cont "du #MON"
	cont "dans sa # BALL!"

	para "Elle rend les"
	line "#MON heureux"
	cont "et les aide à"
	cont "atteindre leur"
	cont "potentiel max!"

	para "Utilise-les sur"
	line "tes meilleurs"
	cont "#MON!"

	para "Pour les #MON"
	line "de type ROCHE,"
	cont "une PUCE APEX"
	cont "simule une crête"
	cont "déchiquetée avec"
	cont "des systèmes de"
	cont "grottes et un"
	cont "terrain montagneux"
	cont "escarpé."
	prompt

_AlreadyReceivedApexChipsText::
	text "Parle-moi à la"
	line "prochaine ARENE"
	cont "si tu bats le"
	cont "CHAMPION pour"
	cont "obtenir plus de"
	cont "PUCES APEX!"
	done