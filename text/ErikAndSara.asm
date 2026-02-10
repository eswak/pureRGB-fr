_ErikSaraInSafariZoneText::
	text "Elle est déjà"
	line "dans la ZONE"
	cont "SAFARI?"
	para "J'y vais!"
	para "Merci!"
	done

_SaraErikOutsideText::
	text "Il attend"
	line "dehors à la"
	cont "ZONE SAFARI?"
	para "Quand t'as fini,"
	line "dis-lui d'entrer?"
	para "J'ai payé"
	cont "l'entrée,"
	line "on peut se voir"
	cont "ici."
	para "Merci!"
	done

_WereMarineBiologists:
	para "On est"
	line "biologistes"
	cont "marins!"
	done

_SaraReunitedText::
	text "SARA: Merci"
	cont "d'avoir"
	line "retrouvé mon"
	cont "copain!@"
	text_call _WereMarineBiologists
	para "On habite sur"
	line "la ROUTE 19!"
	para "Viens nous voir"
	line "quand tu veux!"
	prompt

_SaraOkayRicky::
	text "Allez, RICKY!"
	line "C'est parti pour"
	cont "nos recherches!"
	done

_ErikReunitedText::
	text "ERIK: Merci de"
	line "m'avoir aidé à"
	cont "retrouver ma"
	cont "copine!@"
	text_call _WereMarineBiologists
	para "Tu savais qu'il"
	line "y a des DRATINI"
	cont "rares dans les"
	cont "eaux de la ZONE"
	cont "SAFARI?"
	para "Les PECHEURS"
	line "en attrapent."
	done

_ShouldntLookNoOneHome::
	text "No one's home, so"
	line "it's not right to"
	cont "poke about."
	done

_PeriscopeInitialText::
	text "Looks like some"
	line "sort of periscope"
	cont "piped through"
	cont "the glass floor."
	para "Does it look"
	line "underwater?"
	para "Seems to be turned"
	line "off currently."
	done

_ErikSarasHouseNoteNotHomeText::
	text "NOTE: We're off"
	line "studying DRATINI"
	cont "sightings in the"
	cont "SAFARI ZONE!"
	para "-SARA and ERIK"
	done

_ErikSarasHouseNoteHomeText::
	text "RESULTS: DRATINI"
	line "seems to enter"
	cont "the fresh water"
	cont "in the SAFARI"
	cont "ZONE by swimming"
	cont "upstream from"
	cont "the northern"
	cont "VERMILION SEAWAY."
	para "Perhaps this is"
	line "where juveniles"
	cont "go for safety?"
	done

_ErikSarasHousePhoneText::
	text "A bright blue"
	line "rotary phone!"
	para "MARINE SIGHTING"
	line "HOTLINE is"
	cont "written on it."
	done

_ErikSarasHouseDragonairEmailText::
	text "<PARA>Dear SARA"
	line "and ERIK,"
	para "I heard from MISTY"
	line "that she's seen"
	cont "DRAGONAIR while"
	cont "training at the"
	cont "SEAFOAM ISLANDS."
	para "Maybe you should"
	line "take a look?"
	para "-LORELEI"
	done

_ErikSarasHouseLeftBookText::
	text "SECRETS DE LA MER@"
	text_end
_ErikSarasHouseLeftBookText2::
	text "<PARA>Les récifs"
	line "ont une énorme"
	cont "biodiversité."
	para "Des milliers"
	line "d'espèces de"
	cont "#MON resteraient"
	cont "à découvrir"
	cont "dans ces milieux."
	done

_ErikSarasHouseCenterBookText::
	text "VIE DES ABYSSES@"
	text_end
_ErikSarasHouseCenterBookText2::
	text "<PARA>FUMEES"
	line "VOLCANIQUES"
	cont "SOUS-MARINES"
	para "Un habitat"
	line "miraculeux dans"
	cont "les profondeurs."
	para "Des colonies de"
	line "#MON s'y"
	cont "chauffent."
	done

_ErikSarasHouseRightBookText::
	text "OCEANS ANCIENS@"
	text_end
_ErikSarasHouseRightBookText2::
	text "<PARA>Il y a des"
	line "millions d'années,"
	para "les organismes"
	line "OMANYTE et KABUTO"
	cont "régnaient sur"
	cont "les mers"
	cont "primitives."
	para "Ils se"
	cont "nourrissaient"
	line "de"
	cont "micro-organismes"
	cont "et de végétation"
	cont "des fonds marins."
	done

_ErikSarasHouseNorthGarbageText::
	text "<PARA>INSTALLER VOTRE"
	line "SOL EN VERRE"
	cont "DE MER"
	para "Guide rapide!"
	done

_ErikSarasHouseSouthGarbageText::
	text "Un magazine"
	line "dans la poubelle."
	para "La une fait"
	line "scandale!"
	para "ERIKA A-T-ELLE"
	line "TROUVE L'AMOUR?!"
	cont "CHOQUANT!"
	para "..."
	para "TOP 5 TENUES"
	line "INSPIREES DES"
	cont "#MON D'EAU!"
	para "..."
	para "COIFFURE"
	cont "MAGNIFIQUE!"
	line "ON A DEMANDE"
	cont "A SABRINA!"
	para "..."
	para "MAJOR BOB EN"
	line "TRAINING SUR"
	cont "LA PLAGE!"
	para "CANICULAIRE!"
	done

_ErikSarasHouseBookText::
	text "MIGRATIONS DES"
	line "#MON MARINS"
	para "Ils lisent ça!"
	done

_ErikSarasHousePeriscopeExplanation::
	text "ERIK: Ce sont"
	line "des périscopes."
	para "Ils sont reliés"
	line "à de longues"
	cont "câbles vidéo"
	cont "sous l'eau."
	para "Je les ai"
	line "allumés!"
	para "Regarde!"
	para "Tu verras"
	line "peut-être un truc!"
	done

_PeriscopeLookedThroughThe::
	db "Regardé la"
	done

_ErikSarasHouseLeftPeriscopeIntro::
	text "@"
	text_call _PeriscopeLookedThroughThe
	line "CAMERA RECIF."
	para "..."
	prompt

_ErikSarasHouseRightPeriscopeIntro::
	text "@"
	text_call _PeriscopeLookedThroughThe
	line "CAMERA ABYSSES."
	para "..."
	prompt

_DeepSeaCameraMagikarp::
	text "Un MAGICARPE avec"
	line "un KOKIYAS"
	cont "accroché"
	cont "descend lentement."
	para "Ça ne semble"
	line "pas le gêner."
	done

_DeepSeaCameraTentacruel::
	text "Un TENTACRUEL"
	line "flotte devant"
	cont "l'objectif,"
	cont "menaçant."
	para "Il émet une"
	line "lueur rouge"
	cont "sinistre."
	done

_DeepSeaCameraGyarados::
	text "Un LEVIATOR"
	line "croque la carapace"
	cont "d'un CRUSTABRI!"
	para "Quelle férocité!"
	done

_DeepSeaCameraBubbles::
	text "Que des"
	line "grosses bulles!"
	done

_CoralReefCameraStaryu::
	text "Un STARI se cache"
	line "dans le sable"
	cont "près du corail"
	cont "en forme de"
	cont "cervelle."
	done

_CoralReefCameraHorsea::
	text "Des HYPNOMAD"
	line "slaloment dans"
	cont "une forêt"
	cont "de varech!"
	done

_CoralReefCameraKrabby::
	text "Un KRABBY gratte"
	line "des algues sur"
	cont "un rocher rond."
	para "Il broute"
	line "les algues."
	done

_CoralReefCameraGoldeen::
	text "Des POISSIRENE"
	line "tournent avec"
	cont "grâce."
	para "Ils se sont"
	line "dispersés!"
	para "Un AQUALI est"
	line "apparu!"
	done

_SaraHouseIntroText::
	text "SARA: Regarde qui"
	line "voilà! Entre!"
	para "C'est notre petit"
	line "coin de paradis!"
	done

_ErikHouseIntroText::
	text "ERIK: Bienvenue"
	line "chez nous!"
	para "Reste un peu"
	line "si tu veux!"
	done

_SaraInterestedQuestion::
	text "SARA: Tu"
	cont "t'intéresses"
	line "à nos recherches?"
	done

_ErikInterestedQuestion::
	text "ERIK: Tu veux"
	line "savoir ce qu'on"
	cont "fait?"
	done

_SaraHouseFirstStepText::
	text "SARA: On étudie"
	line "les observations"
	cont "de DRAGONAIR aux"
	cont "ILES ECUME"
	cont "pas loin."
	para "Tu y es déjà"
	line "allé?"
	done

_SaraSeafoamExplanationText::
	text "SARA: Les ILES"
	line "ECUME sont à"
	cont "l'ouest, sur la"
	cont "ROUTE 20."
	para "C'est un système"
	line "de grottes."
	para "Plus bas, la"
	line "marée entre"
	cont "dans les grottes."
	para "Un habitat"
	line "marin fascinant!"
	prompt

_ErikDragonairResearch::
	text "ERIK: Récemment"
	line "les niveaux bas"
	cont "des ILES ECUME"
	cont "se sont refroidis"
	cont "à cause d'un"
	cont "phénomène inconnu."
	para "Presque"
	line "glacial!"
	para "Mais le plus"
	line "intrigant qu'on"
	cont "vient de"
	cont "trouver..."
	para "Plein de"
	line "DRAGONAIR"
	cont "s'y rassemblent"
	cont "maintenant."
	para "SARA: Beaucoup"
	line "à des niveaux"
	cont "anormalement"
	cont "élevés!"
	para "Des niveaux où"
	line "ils auraient"
	cont "dû évoluer!"
	para "On cherche"
	line "pourquoi ils"
	cont "n'évoluent pas!"
	prompt

_ErikWantsDragonairText::
	text "ERIK: Si on avait"
	line "un DRAGONAIR"
	cont "haut niveau pour"
	cont "les ILES..."
	para "SARA: Parfois"
	line "je regrette notre"
	cont "serment de ne pas"
	cont "capturer de"
	cont "#MON..."
	prompt

_ShowedDragonairLowLevelText::
	text "ERIK: Un"
	cont "DRAGONAIR!"
	line "...Mais un peu"
	cont "trop bas niveau."
	para "Monte-le au"
	line "moins au niveau"
	cont "45."
	done

_ShowedDragonairText::
	text "SARA: Parfait!"
	para "On peut emmener"
	line "ton DRAGONAIR"
	cont "aux ILES ECUME!!"
	para "Mais attention..."
	para "Il pourrait ne"
	line "plus évoluer"
	cont "s'il y va."
	para "Tu es prêt à"
	line "venir avec nous?"
	done

_ShowedDragonairLetsDoThis::
	text "C'est parti!"
	para "RICKY!"
	para "Prends le matos"
	line "de plongée!"
	para "On y va!"
	done

_SeafoamIslandsB4FDragonairEventStartText::
	text "SARA: OK! Le plan!"
	para "On plonge avec"
	line "@"
	text_ram wNameBuffer
	text_start
	cont "dans l'eau"
	cont "et on voit!"
	para "Prêt RICKY?"
	para "Prêt <PLAYER>?"
	para "ERIK: Enfile ta"
	line "combinaison de"
	cont "plongée, <PLAYER>!"
	prompt

_SeafoamIslandsB4FDragonairEventStartText2::
	text "On plonge!"
	prompt

_DragonairEventDragonairText1::
	text "DRAGONAIR: Fwee?"
	done

_DragonairEventDragonairText2::
	text "DRAGONAIR: Draogh!"
	done

_DragonairEventErikText::
	text "ERIK: Ouah! Tous"
	line "ces DRAGONAIR!"
	para "Ils semblent"
	line "attirés par les"
	cont "gros cristaux"
	cont "de glace."
	done

_DragonairEventSaraText::
	text "SARA: Fascinant!"
	para "Les DRAGONAIR"
	line "essaient de"
	cont "résister au"
	cont "froid?"
	done

_DragonairEventCloysterText::
	text "Ce CRUSTABRI"
	line "est très"
	cont "territorial."
	done

_DragonairEventCloysterText2::
	text "Il ne te laissera"
	line "pas passer"
	cont "sans combat."
	para "Te battre avec"
	line "ton DRAGONAIR?"
	done

_DragonairEventLowLevelText::
	text "Niveau trop bas."
	done

_DragonairEventNoPartyMenuText::
	text "Non! C'est"
	line "le combat de"
	cont "@"
	text_ram wBattleMonNick
	text "!"
	prompt

_DragonairEventCloysterBeatenText::
	text "Le CRUSTABRI"
	line "reconnaît la"
	cont "puissance de ton"
	cont "DRAGONAIR."
	para "Il te laisse"
	line "passer."
	done

_DragonairEventTransformText::
	text "@"
	text_ram wNameBuffer
	text " s'approche"
	line "des cristaux"
	cont "de glace."
	prompt

_DragonairEventTransformText2::
	text "@"
	text_ram wNameBuffer
	text " s'est"
	line "imprégné du"
	cont "pouvoir glacé"
	cont "de l'hiver!@"
	sound_get_item_2
	text "<PARA>Il a gagné"
	line "le type GLACE!"
	para "Ses stats de"
	line "base ont monté!"
	prompt

_DragonairEventTransformText3::
	text "SARA: Ouah! Quelle"
	line "découverte!"
	para "ERIK: J'ai hâte"
	line "de noter toutes"
	cont "ces données!"
	para "SARA: Rentrons"
	line "manger!"
	done

_DragonairEventAlready::
	text "Il a déjà été"
	line "renforcé."
	done

_DragonairEventEnd::
	text "SARA: Les"
	cont "DRAGONAIR"
	line "semblent se"
	cont "rassembler"
	cont "aux ILES ECUME"
	cont "pour s'acclimater"
	cont "au froid."
	para "ERIK: Et ils ont"
	line "développé des"
	cont "pouvoirs glacés!"
	para "SARA: D'habitude"
	line "ils évoluent en"
	cont "DRACOLOSSE, qui"
	cont "déteste la glace!"
	para "ERIK: La splendeur"
	line "glacée de tous"
	cont "ces DRAGONAIR!"
	para "Hé, <PLAYER>!"
	para "Regarde mon"
	line "ordinateur pour"
	cont "voir les nouvelles"
	cont "capacités de ton"
	cont "DRAGONAIR!"
	done

_ErikSarasHouseComputerAfterText::
	text "ANALYSE"
	line "DRAGONAIR HIVER"
	para "Type DRAGON/GLACE."
	para "STATS DE BASE:"
	para "PV: 91 ATQ: 84"
	line "DEF: 75"
	para "VIT: 80"
	line "SPEC: 130"
	done

_ErikSarasHouseGoBackErikText::
	text "ERIK: Tu en penses"
	line "quoi de l'analyse"
	cont "DRAGONAIR sur mon"
	cont "ordinateur?"
	para "Ou on retourne"
	line "faire des"
	cont "recherches?"
	prompt

_ErikSarasHouseGoBackSaraText::
	text "SARA: RICKY et moi"
	line "on a envie de"
	cont "revoir les"
	cont "cristaux de glace!"
	prompt

_ErikSarasHouseGoBackQuestionText::
	text "Tu as un autre"
	line "DRAGONAIR à"
	cont "emmener aux"
	cont "ILES ECUME?"
	prompt

_DragonairEventLeaveText::
	text "ERIK: Ce CRUSTABRI"
	line "ne te laisse"
	cont "pas passer!"
	para "Tu veux rentrer"
	line "pour l'instant?"
	prompt

_DragonairEventHealText::
	text "SARA: Ce CRUSTABRI"
	para "ne veut pas"
	line "bouger?!"
	para "Laisse-moi"
	line "soigner tes #MON!"
	prompt

_DragonairEventSaraReturnText::
	text "SARA: Je ne me"
	line "lasse pas de"
	cont "voir ces #MON"
	cont "flotter avec"
	cont "grâce."
	done

_DragonairEventErikReturnText::
	text "ERIK: Quelle"
	line "sérénité en"
	cont "nageant avec"
	cont "ces beaux"
	cont "DRAGONAIR."
	done

_ErikSarasHouseSecondNoteText::
	text "RESULTATS:"
	line "DRAGONAIR a"
	cont "développé des"
	cont "capacités dans"
	cont "la glace."
	para "L'origine du"
	line "froid aux ILES"
	cont "ECUME reste"
	cont "inconnue."
	done
