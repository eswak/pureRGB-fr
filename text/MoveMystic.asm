_MoveMysticIntro::
	text "Je suis le"
	line "MYSTIQUE DES CAPS!"
	para "Certains #MON"
	line "ont des talents"
	cont "cachés!"
	para "Je peux lire leurs"
	line "secrets dans ma"
	cont "boule de cristal!"
	para "Mais seulement si"
	line "tu as déjà vu le"
	cont "#MON!"
	prompt

_MoveMysticAgain::
	text "Tu reviens voir"
	line "le MYSTIQUE DES"
	cont "CAPS!"
	prompt

_MoveMysticQuestion::
	text "De quel #MON"
	line "veux-tu que je"
	cont "révèle les"
	cont "secrets?"
	prompt

_MoveMysticLookDeep::
	text "Regarde au fond"
	line "de ma boule de"
	cont "cristal!"
	prompt

_MoveMysticAhYes::
	text "Ah oui..."
	line "Je le vois."
	para "@"
	text_ram_stringbuffer
	text ", the@"
	text_end

_BeedrillMoveMysticText::
	text_start
	line "frelon"
	cont "hypodermique."
	prompt

_ArbokMoveMysticText::
	text_start
	line "vipère venimeuse."
	prompt

_FearowMoveMysticText::
	text_start
	line "bec assoiffé"
	cont "de sang."
	prompt

_GolemMoveMysticText::
	text_start
	line "rocher roulant."
	prompt

_HitmonleeMoveMysticText::
	text_start
	line "roi des coups"
	cont "de pied."
	prompt

_HitmonchanMoveMysticText::
	text_start
	line "poing furieux."
	prompt

_ElectabuzzMoveMysticText::
	text_start
	line "avant-garde"
	cont "voltaïque."
	prompt

_MagmarMoveMysticText::
	text_start
	line "punisseur"
	cont "pyroclastique."
	prompt

_JynxMoveMysticText::
	text_start
	line "déesse glaciale."
	prompt

_HypnoMoveMysticText::
	text_start
	line "horreur"
	cont "hypnotique."
	prompt

_DragoniteMoveMysticText::
	text_start
	line "monarque"
	cont "mystique."
	prompt

_SeakingMoveMysticText::
	text_start
	line "poisson fabuleux."
	prompt
	
_KangaskhanMoveMysticText::
	text_start
	line "puissance"
	cont "parentale."
	prompt
	
_LickitungMoveMysticText::
	text_start
	line "lécheur"
	cont "baveux."
	prompt

_OmastarMoveMysticText::
	text_start
	line "ammonite"
	cont "antique."
	prompt

_JigglypuffMoveMysticText::
	text_start
	line "cantatrice"
	cont "sphérique."
	prompt

_WigglytuffMoveMysticText::
	text_start
	line "gloire globulaire."
	prompt

_GolduckMoveMysticText::
	text_start
	line "dangerous duck."
	prompt

_DewgongMoveMysticText::
	text_start
	line "splendid seal."
	prompt

_ArcanineMoveMysticText::
	text_start
	line "heroic hound."
	prompt

_MoveMysticMasterOfMoveText::
	text "C'est un maître"
	line "de @"
	text_ram wNameBuffer
	text "!"
	prompt

_MoveMysticTalentOfMoveText::
	text "@"
	text_ram_namebuffer
	text ""
	line "est son talent!"
	prompt

_MoveMysticSoulCallsForMoveText::
	text "Son âme appelle"
	line "@"
	text_ram wNameBuffer
	text "!"
	prompt

_MoveMysticLovesMoveText::
	text "Il adore utiliser"
	line "@"
	text_ram_namebuffer
	text "!"
	prompt

_MoveMysticBeedrillText::
	text "Ses dards"
	line "mortels aident"
	cont "à plusieurs"
	cont "niveaux!"
	para "DARD-VENIN:"
	line "PUISSANCE x3 = 45!"
	para "Et DOUBLE-DARD:"
	line "PUISSANCE = 65!"
	done

_MoveMysticAccuracy85::
	text "Sa PRECISION"
	line "monte à 85%!"
	done

_MoveMysticAccuracy100::
	text "Its ACCURACY"
	line "increases to 100%!"
	done

_MoveMysticJigglyWigglyOnlyLevel20Text::
	text_start
	para "Mais seulement"
	line "au-dessus du"
	cont "niveau 20!"
	done

_GenericMovePowerIncreasesText::
	text "Sa PUISSANCE"
	line "monte à @"
	text_decimal w2CharStringBuffer, 1, 3
	text "!"
	done

_MoveMysticInfoText::
	text "If ON, a new house"
	line "will be available"
	cont "in SAFFRON CITY."
	para "The MOVE MYSTIC"
	line "here will tell"
	cont "you about #MON"
	cont "SIGNATURE MOVEs."
	para "Some #MON will"
	line "have bonus power"
	cont "or accuracy when"
	cont "using some moves."
	para "If turned OFF,"
	line "these bonuses are"
	cont "turned off too."
	prompt
