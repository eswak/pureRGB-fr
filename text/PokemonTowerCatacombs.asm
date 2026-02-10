_PokemonTowerCatacombsTorchedGraveText::
	text "ICI REPOSE KOKO"
	line "LE NOADKOKO"
	para "KOKO a péri dans"
	line "un incendie."
	; fall through
_PokemonTowerCatacombsWavedStaff::
	para "<PLAYER> agite le"
	line "BATON DE VOYANT."
	prompt 

_PokemonTowerCatacombsTorchedGraveText2::
	text "BESOIN@"
	text_dots 3
	text ""
	para "D'EAU@"
	text_dots 3
	text ""
	para "MAINTENANT!@"
	text_dots 3
	text ""
	done

_PokemonTowerCatacombsMonSpeaksText::
	text "Ecoute, enfant!"
	para "L'esprit du"
	line "#MON parle"
	cont "par ma voix:"
	para "@"
	text_dots 3
	text ""
	done

_PokemonTowerCatacombsTorchedAfterText::
	text ""
	para "Mon dresseur"
	line "n'avait pas"
	cont "d'extincteur!"
	para "Pourquoi être"
	line "si imprévoyant??"
	; fall through
_PokemonTowerCatacombsSpiritDissipatedText::
	para "@"
	text_dots 3
	text ""
	para "L'esprit semble"
	line "apaisé."
	para "Il est parti"
	line "dans l'au-delà!"
	done

_PokemonTowerCatacombsChunkyGraveText::
	text "ICI REPOSE ZAPPY"
	line "LE RAICHU"
	para "ZAPPY est mort"
	line "d'une crise"
	cont "cardiaque en"
	cont "dormant.@"
	text_jump _PokemonTowerCatacombsWavedStaff

_PokemonTowerCatacombsChunkyGraveText2::
	text "J'AI FAIM@"
	text_dots 3
	text ""
	done

_PokemonTowerCatacombsChunkyAfterText::
	text ""
	para "J'aimais beaucoup"
	line "mon dresseur!"
	para "Elle me donnait"
	line "plein de bonnes"
	cont "choses!"
	para "J'ai trop mangé"
	line "je crois!"
	para "Oups!"
	para "Tu as à manger?"
	para "Non?"
	para "Tant pis!"
	para "J'attendrai mon"
	line "dresseur dans"
	cont "l'au-delà!@"
	text_jump _PokemonTowerCatacombsSpiritDissipatedText

_PokemonTowerCatacombsPainlessGraveText::
	text "ICI REPOSE TUFF"
	line "LE GRODOUDOU"
	para "TUFF est mort"
	line "d'un traumatisme"
	cont "crânien.@" 
	text_jump _PokemonTowerCatacombsWavedStaff

_PokemonTowerCatacombsPainlessGraveText2::
	text "SE BATTRE@"
	text_dots 3
	text ""
	para "PLUS@"
	text_dots 3
	text ""
	para "FORT@"
	text_dots 3
	text ""
	done

_PokemonTowerCatacombsPainlessAfterText::
	text ""
	para "Mon dresseur m'a"
	line "fait tant"
	cont "combattre"
	cont "que j'ai des"
	cont "lésions"
	cont "cérébrales!"
	para "Je voulais juste"
	line "le rendre heureux!"
	para "On aurait dû"
	line "connaître nos"
	cont "limites!@"
	text_jump _PokemonTowerCatacombsSpiritDissipatedText

_PokemonTowerCatacombsIrradiatedGraveText::
	text "ICI REPOSE BOB"
	line "LE TYGNON"
	para "BOB est mort avec"
	line "son dresseur"
	cont "d'une maladie"
	cont "des radiations.@"
	text_jump _PokemonTowerCatacombsWavedStaff

_PokemonTowerCatacombsIrradiatedGraveText2::
	text "QU'EST-CE@"
	text_dots 3
	text ""
	cont "QUI M'ARRIVE??@"
	text_dots 3
	text ""
	done

_PokemonTowerCatacombsIrradiatedAfterText::
	text ""
	para "Mon dresseur et"
	cont "moi"
	line "avons pénétré"
	cont "dans une grotte"
	cont "interdite!"
	para "On ne savait pas"
	line "que c'était un"
	cont "dépôt de déchets"
	cont "nucléaires!"
	para "Il ne fallait"
	line "pas y aller!@"
	text_jump _PokemonTowerCatacombsSpiritDissipatedText

_PokemonTowerCatacombsDarkChannelerText::
	text "Kekeke, tu as"
	line "un peu la"
	cont "frousse?"
	para "Tu veux remonter?"
	done

_PokemonTowerCatacombsDarkChannelerTextYes::
	text "Suis-moi, enfant!"
	done

_GhostMarowakAfterGiovanniText::
	text "<PLAYER>!"
	para "C'est l'esprit"
	line "de MAROWAK qui"
	cont "parle par le"
	cont "ROI DU KARATE."
	para "Merci d'avoir"
	line "vaincu la <TEAM>"
	cont "<ROCKET>."
	para "Mon dernier voeu"
	line "était de m'en"
	cont "débarrasser."
	para "Si tu peux,"
	line "emmène-moi au"
	cont "sous-sol de la"
	cont "TOUR #MON."
	para "Là je pourrai"
	line "enfin reposer."
	done

_ViridianGymHiker3WhatText::
	text "Hein??"
	para "Qu'est-ce qui"
	line "s'est passé?"
	para "Comment je suis"
	line "arrivé ici?"
	done

_DarkChannelerGoDownText::
	text "Hmm? Je sens un"
	line "esprit parmi tes"
	cont "#MON."
	para "Hoho! La mère"
	line "MAROWAK?"
	para "Elle veut reposer"
	line "dans sa tombe?"
	para "C'est en bas"
	line "dans les"
	cont "catacombes."
	para "Je te laisse"
	line "descendre pour"
	cont "ce cas spécial."
	para "Tu veux y aller?"
	done

_DarkChannelerCatacombsIntroText::
	text "Suis le chemin"
	line "jusqu'à la tombe"
	cont "de MAROWAK!"
	para "Tu croiseras"
	line "sûrement des"
	cont "esprits errants."
	para "Tiens! Prends mon"
	line "BATON DE VOYANT."
	para "Il révèle et"
	line "purifie les"
	cont "esprits mieux"
	cont "qu'un SYLPHESCOPE!"
	para "Grâce aux sorts"
	line "que j'y ai mis!"
	para "<PLAYER> emprunte"
	line "le BATON DE"
	cont "VOYANT!"
	done

_TorchedOnFire::
	text "@"
	text_ram wEnemyMonNick
	text " est"
	line "consumé par les"
	cont "flammes!"
	prompt

_PainlessBattleInitText::
	text "TUFF ne sentira"
	line "pas tes attaques!"
	prompt

_IrradiatedBattleInitText::
	text "Les radiations"
	line "se répandent!"
	prompt

_IrradiatedGrowsLarger::
	text "IRRADIE se tord"
	line "tandis que son"
	cont "corps grandit!"
	prompt

_CatacombsCuboneText::
	text "On dirait que"
	line "OSSELAIT visite"
	cont "la tombe de sa"
	cont "mère."
	done

_CatacombsMarowakTouchedText::
	text "@"
	text_ram wNameBuffer
	text " a"
	line "l'air tout"
	cont "content!"
	done

_DarkChannelerReunionText::
	text "Quelle touchante"
	line "réunion!"
	para "Mais @"
	text_ram wNameBuffer
	text ""
	line "ne peut pas"
	cont "reposer encore!"
	para "Il y a encore une"
	line "présence maléfique"
	cont "ici!"
	para "Quand elle partira"
	line "tout sera prêt!"
	done

_PokemonTowerCatacombsTheMawGraveText::
	text "ICI REPOSE UN"
	line "NOSFERAPTI NOTOIRE"
	para "Ce NOSFERAPTI a"
	line "tué son dresseur"
	cont "et a continué"
	cont "sa folie"
	cont "meurtrière."
	para "On ne sait pas"
	line "s'il avait un"
	cont "surnom.@"
	text_jump _PokemonTowerCatacombsWavedStaff

_PokemonTowerCatacombsTheMawGraveText2::
	text "TU MEURS"
	cont "MAINTENANT"
	done

_PokemonTowerB1FTheMawUsedHyperBeamText::
	text "L'esprit maléfique"
	line "utilise"
	cont "ULTRALASER!"
	done

_PokemonTowerB1FMarowakBlockedHyperBeamText::
	text "@"
	text_ram wNameBuffer
	text " a"
	line "bloqué"
	cont "l'ULTRALASER"
	cont "pour protéger"
	cont "OSSELAIT!"
	para "Mais le rayon"
	line "était trop fort!"
	para "@"
	text_ram wNameBuffer
	text " ne"
	line "peut plus garder"
	cont "sa forme"
	cont "physique!"
	done

_PokemonTowerB1FMarowakBuffedCubone::
	text "L'esprit de @"
	text_ram wNameBuffer
	text ""
	line "a pris OSSELAIT"
	cont "et lui a transmis"
	cont "tout son pouvoir!"
	para "OSSELAIT rejoint"
	line "ton équipe."
	prompt

_PokemonTowerB1FTheMawAttacked::
	text "C'est l'heure"
	line "du combat!"
	para "L'esprit maléfique"
	line "a attaqué!"
	done

_CubonePoweredUp::
	text "L'esprit de @"
	text_ram wTrainerName
	text ""
	line "a transmis une"
	cont "énergie divine"
	cont "à OSSELAIT!"
	prompt

_CuboneGainedUltimateProtection::
	text "OSSELAIT obtient"
	line "une protection"
	cont "ultime!"
	prompt

_TheMawMeltedIntoShadows::
	text "L'esprit maléfique"
	line "s'est dissipé"
	cont "dans l'ombre"
	cont "pour toujours."
	done

_GhostMarowakOneLastTime::
	text "@"
	text_ram wTrainerName
	text " a"
	line "utilisé ses"
	cont "dernières forces"
	cont "pour apparaître"
	cont "une dernière fois."
	prompt

_PokemonTowerGhostMarowakAfterText::
	text ""
	para "Merci"
	line "<PLAYER>!"
	para "Je peux enfin"
	line "reposer en paix!"
	para "Je t'aime"
	cont "OSSELAIT!"
	para "Mais maman doit"
	line "partir."
	para "Ne sois pas"
	cont "triste."
	para "Profite de la vie-"
	para "Au revoir..."
	prompt

_PokemonTowerCatacombsDoneText::
	text "Merci d'avoir"
	line "fait mon boulot!"
	para "La VOYANTE SOMBRE"
	line "a repris son"
	cont "BATON DE VOYANT."
	para "On remonte!"
	done

_PokemonTowerCatacombsGoBackDown::
	text "Tu veux"
	line "redescendre?"
	done