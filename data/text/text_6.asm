_ItemUseBallText00::
	text "Il évite la BALL!"

	para "Capture"
	line "impossible!"
	prompt

_ItemUseBallText01::
	text "Vous manquez le"
	line "#MON!"
	prompt

_ItemUseBallText02::
	text "Zut de flûte! Il"
	line "s'est libéré!"
	prompt

_ItemUseBallText03::
	text "Méga-mince..."
	line "Presque!"
	prompt

_ItemUseBallText04::
	text "Pas d'bol, hein?"
	prompt

_ItemUseBallText05::
	text "Top cool!"
	line "@"
	text_ram wEnemyMonNick
	text " est"
	cont "capturé!@"
	text_end

_ItemUseBallText07::
	text_ram wBoxMonNicks
	text " est"
	line "transféré au PC"
	cont "de LEO!"
	prompt

_ItemUseBallText08::
	text_ram wBoxMonNicks
	text " est"
	line "transféré au PC"
	cont "inconnu!"
	prompt

_NoBoxSlotsLeftText::
	text "La BOITE @"
	text_ram wBoxNumString
	text " est"
	line "maintenant pleine."
	para "Il est temps de"
	line "changer de boite!@"
	text_end

_BoxSlotsLeftText::
	text_ram w2CharStringBuffer
	text " places restantes"
	line "dans la BOITE @"
	text_ram wBoxNumString
	text ".@"
	text_end

_ItemUseBallText06::
	text "Le profil de"
	line "@"
	text_ram wEnemyMonNick
	text " est"
	cont "transféré sur le"
	cont "#DEX!@"
	text_end

_SurfingGotOnText::
	text "<PLAYER> monte sur"
	line "@"
	text_ram_namebuffer
	text "!"
	prompt

_AlreadySurfingText::
	text "Vous SURFEZ déjà."
	prompt

_LavaSurfingText::
	text "SURFER sur la"
	line "lave?!"
	cont "Impossible."
	prompt

_ApexChipPutOnPokeballText::
	text "Vous avez installé"
	line "la PUCE APEX sur"
	para "la Poké Ball de"
	line "@"
	text_ram_namebuffer
	text ".@"
	text_asm
	ld a, SFX_SWITCH
	rst _PlaySound
	call WaitForSoundToFinish
	ld c, 50
	rst _DelayFrames
	ld a, SFX_TRADE_MACHINE
	rst _PlaySound
	call WaitForSoundToFinish
	ld c, 50
	rst _DelayFrames
	rst TextScriptEnd

_ApexChipDVsMaxedText::
	text "Le potentiel de"
	line "@"
	text_ram_namebuffer
	text_start
	cont "est maximisé!"
	para "Les DV sont au"
	line "maximum!"
	prompt

_ApexChipAlreadyUsedText::
	text "Une PUCE APEX est"
	line "déjà installée sur"
	para "la Poké Ball de"
	line "@"
	text_ram_namebuffer
	text "."
	prompt

_BoosterChipInstalledText::
	text "Vous avez branché"
	line "la PUCE BOOSTER"
	cont "sur votre ceinture"
	cont "de Poké Balls."

	para "Tous les #MON"
	line "gagneront plus"
	cont "d'EXP!@"
	text_end

_VitaminStatRoseText::
	text_ram_stringbuffer
	text " de"
	line "@"
	text_ram_namebuffer
	text_start
	cont "augmente."
	prompt

_VitaminNoEffectText::
	text "Ca ne marche pas."
	prompt

_ItemUseNoEffectText::
_RareCandyNoEffectText::
	text "Sans effet."
	prompt

_ThrewBaitText::
	text "<PLAYER> lance"
	line "un APPAT."
	done

_ThrewRockText::
	text "<PLAYER> lance"
	line "un CAILLOU."
	done

_PlayedFluteNoEffectText::
	text "Vous jouez de la"
	line "#FLUTE."

	para "Super!!! Ca c'est"
	line "d'la zique!"
	prompt

_FluteWokeUpText::
	text "Tous les #MON"
	line "endormis se"
	cont "réveillent."
	prompt

_PlayedFluteHadEffectText::
	text "<PLAYER> joue de"
	line "la #FLUTE.@"
	text_end

_CoinCaseNumCoinsText::
	text "Jetons"
	line "@"
	text_bcd wPlayerCoins, 2 | LEADING_ZEROES | LEFT_ALIGN
	text " "
	prompt

_ItemfinderFoundItemText::
	text "Ouais!!!!"
	line "Le CHERCH'OBJET"
	cont "signale un objet"
	cont "dans l'coin!"
	prompt

_ItemfinderFoundNothingText::
	text "Non..."
	line "Le CHERCH'OBJET"
	cont "ne signale rien."
	prompt

_RaisePPWhichTechniqueText::
	text "Monter les PP de"
	line "quelle attaque?"
	done

_RestorePPWhichTechniqueText::
	text "Remplir les PP de"
	line "quelle attaque?"
	done

_PPMaxedOutText::
	text "PP de @"
	text_ram_stringbuffer
	text_start
	line "sont au max."
	prompt

_PPIncreasedText::
	text "PP de @"
	text_ram_stringbuffer
	text_start
	line "augmentés."
	prompt

_PPRestoredText::
	text "PP restaurés."
	prompt

_BootedUpTMText::
	text "CT enclenchée!"
	prompt

_BootedUpHMText::
	text "CS enclenchée!"
	prompt

_TeachMachineMoveText::
	text "Elle contient:"
	line "@"
	text_ram_stringbuffer
	text "!"

	para "Apprendre"
	line "@"
	text_ram_stringbuffer
	text " à"
	cont "un #MON?"
	done

_MonCannotLearnMachineMoveText::
	text_ram_stringbuffer
	text " est"
	line "incompatible avec"
	cont "@"
	text_ram_namebuffer
	text "."

	para "Instruction de"
	line "@"
	text_ram_stringbuffer
	text_start
	cont "impossible."
	prompt

_ItemUseNotTimeText::
	text "CHEN: Allô?"
	line "<PLAYER>? C'est"
	cont "pas l'moment de"
	cont "faire ça!"
	prompt

_ItemUseValuableText::
	text "Ça a l'air"
	line "précieux!"
	para "Le vendre serait"
	line "une bonne idée."
	prompt

_TopSecretKeyText::
	text "Cette clé ressemble"
	line "à la CLE SECRETE."
	para "Elle est beaucoup"
	line "plus usée."
	para "Qu'est-ce qu'elle"
	line "ouvre?"
	para "Peut-être une"
	line "porte sur"
	cont "l'ILE CRAMOISIE?"
	para "Il y a écrit"
	line "-S2- dessus."
	prompt

_ItemUseFossilText::
	text "Ce fossile est"
	line "agréable à"
	cont "admirer!"
	para "Peut-être le"
	line "mettre dans le PC"
	cont "jusqu'à trouver"
	cont "une utilité."
	prompt

_ItemUseInBattleText::
	text "Cet objet ne peut"
	line "être utilisé que"
	cont "pendant un combat"
	cont "#MON."
	prompt

_ItemUseNotYoursToUseText::
	text "C'est pas à toi!"
	prompt

_ThrowBallAtTrainerMonText1::
	text "Le dresseur dévie"
	line "la BALL!"
	prompt

_ThrowBallAtTrainerMonText2::
	text "Voler, c'est mal!"
	prompt

_NoCyclingAllowedHereText::
	text "Interdit de"
	next "pédaler ici!!!"
	prompt

_NoSurfingHereText::
	text "Pas de SURF sur"
	line "@"
	text_ram_namebuffer
	text " ici!"
	prompt

_BoxFullCannotThrowBallText::
	text "La BOITE #MON"
	line "est pleine! Objet"
	cont "inutilisable!"
	prompt

_ItemUseCameraInBattleText::
	text "Pas le temps de"
	line "prendre une photo"
	cont "en combat!"
	prompt
