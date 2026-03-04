_LearnsetCuteTalk::
	text "J'pourrais parler"
	line "de mon adorable"
	cont "@"
	text_ram_namebuffer
	text " toute"
	cont "la journée!"
	prompt

_LearnsetBeautyTalk::
	text "Reconnais-tu la"
	line "pure et sereine"
	cont "beauté d'un"
	cont "@"
	text_ram_namebuffer
	text "?"
	prompt

_LearnsetLove::
	text "Je veux crier au"
	line "monde entier:"
	cont "@"
	text_ram_cont wNameBuffer
	text "!"
	para "Je l'adore!"
	prompt

_LearnsetRude::
	text "Hé!"
	para "C'est malpoli de"
	line "battre une fille"
	cont "sans la raccom-"
	cont "pagner au CENTRE"
	cont "#MON."
	para "Mon pauvre"
	line "@"
	text_ram_namebuffer
	text "!"
	prompt

_LearnsetKnowAlotAbout::
	text "J'en sais long"
	line "sur @"
	text_ram_namebuffer
	text "."
	para "Je vais partager"
	line "mes secrets!"
	prompt

_LearnsetKnowEverythingAbout::
	text "Je sais tout sur"
	line "@"
	text_ram_namebuffer
	text "!"
	para "Ecoute donc un"
	line "expert!"
	prompt

_LearnsetKnowMoreThanYou::
	text "J'en sais plus"
	line "que toi sur"
	cont "@"
	text_ram_namebuffer
	text "."
	para "Je vais le"
	line "prouver!"
	prompt

_LearnsetBoring::
	text "T'es ennuyeux."
	para "T'entraînerais"
	line "jamais un #MON"
	cont "cool comme"
	cont "@"
	text_ram_namebuffer
	text "."
	para "Tu comprendrais"
	line "pas!"
	prompt

_LearnsetAppreciator::
	text "Il est temps de"
	line "rejoindre<...>"
	para "<...>"
	para "<...>"
	para "Le @"
	text_ram_namebuffer
	text_start
	line "CLUB DES FANS!"
	prompt

_LearnsetMastering::
	text "J'ai passé des"
	line "années à maîtri-"
	cont "ser le dressage"
	cont "de @"
	text_ram_namebuffer
	text "."
	para "Ecoute bien!"
	prompt

_LearnsetCool::
	text "Le niveau de cool"
	line "de @"
	text_ram_namebuffer
	text " est"
	cont "hors limites!"
	para "Ecoute bien, bro!"
	prompt

_LearnsetTough::
	text "Tu trouveras pas"
	line "de #MON plus dur"
	cont "que @"
	text_ram_namebuffer
	text "!"
	para "Tu devrais en"
	line "dresser un!"
	prompt

_LearnsetMystery::
	text "Toi aussi, tu"
	line "t'intéresses à"
	cont "la nature mysté-"
	cont "rieuse de"
	cont "@"
	text_ram_namebuffer
	text "?"
	prompt

_WhileGoingBackToPkmnCenter::
	text "Le @"
	text_ram wTrainerName
	text_start
	line "t'a parlé de"
	cont "@"
	text_ram_namebuffer
	text " en"
	cont "allant au CENTRE"
	cont "#MON."
	prompt

_StartedTalkingAboutDetails::
	text "Le @"
	text_ram wTrainerName
	text_start
	line "a parlé de"
	cont "@"
	text_ram_namebuffer
	text_start
	cont "en grand détail."
	prompt

_ToldAThrillingStory::
	text "Le @"
	text_ram wTrainerName
	text_start
	line "a raconté une"
	cont "histoire palpi-"
	cont "tante sur"
	cont "@"
	text_ram_namebuffer
	text "."
	prompt

_ShowedCoolMoves::
	text "Le @"
	text_ram wTrainerName
	text_start
	line "a montré les"
	cont "meilleurs coups"
	cont "de @"
	text_ram_namebuffer
	text "."
	prompt

_ReadAlotAboutPkmn::
	text "Tu as beaucoup"
	line "lu sur @"
	text_ram_namebuffer
	text "."
	para "Wow, c'est"
	line "si @"
	text_asm
	call Random
	and %111
	ld hl, .astonishing
	jr z, .printDone
.loop
	push af
.loopToNextEntry
	ld a, [hli]
	cp "<PROMPT>"
	jr nz, .loopToNextEntry
	pop af
	dec a
	jr nz, .loop
.printDone
	call TextCommandProcessor
	rst TextScriptEnd
.astonishing
	text "étonnant!"
	prompt
.fascinating
	text "fascinant!"
	prompt
.tantalizing
	text "captivant!"
	prompt
.engrossing
	text "passionnant!"
	prompt
.enthralling
	text "palpitant!"
	prompt
.interesting
	text "intéressant!"
	prompt
.intriguing
	text "intrigant!"
	prompt
.enlightening
	text "enrichissant!"
	prompt

_KeepReadingText::
	text "Continuer?"
	done

_CheckDexToSeeIt::
	text "Vérifie ton #DEX"
	line "pour le lire!"
	done

_WhileGoingHeadingToShipInfirmary::
	text "Le @"
	text_ram wTrainerName
	text_start
	line "t'a parlé de"
	cont "@"
	text_ram_namebuffer
	text " en"
	cont "allant vers"
	cont "l'infirmerie."
	prompt

_LearnsetFondMemories::
	text "Le @"
	text_ram wTrainerName
	text_start
	line "a évoqué de bons"
	cont "souvenirs avec"
	cont "@"
	text_ram_namebuffer
	text "."
	prompt


_PlayedAroundWith::
	text "<PLAYER> et le"
	line "@"
	text_ram wTrainerName
	text " ont"
	cont "joué un peu avec"
	cont "@"
	text_ram_namebuffer
	text "."
	prompt

_LearnsetDream::
	text "Le @"
	text_ram wTrainerName
	text_start
	line "a décrit un rêve"
	cont "étrange à propos"
	cont "de @"
	text_ram_namebuffer
	text "."
	prompt

_BlaineStory::
	text "@"
	text_ram wTrainerName
	text " a"
	line "raconté comment"
	cont "@"
	text_ram_namebuffer
	text " l'a"
	cont "sauvé la vie."
	prompt

_LearnsetNaturalHabitatText::
	text "<PLAYER> observe"
	line "@"
	text_ram_namebuffer
	text " dans"
	cont "son habitat"
	cont "naturel."
	prompt
