_DiamondMineProspectorText::
	text "Hé gamin!"
	para "Y a de l'or"
	line "dans ces collines!"
	para "Ou mieux,"
	line "des diamants!"
	para "Tu veux m'aider"
	line "a en trouver?"
	done

_DiamondMineProspectorHelp::
	text "Tu me revois!"
	para "Les NOSFERALTI"
	line "par ici deviennent"
	cont "ridicules!"
	para "Je dois mettre"
	line "des bouchons"
	cont "d'oreilles!"
	para "Je veux passer"
	line "mon temps a"
	para "creuser, pas"
	line "a taper des"
	cont "NOSFERALTI!"
	para "Il me faut"
	line "exactement"
	cont "10 REPOUSSE!"
	done

_DiamondProspectorRepels::
	text "T'as trouve"
	line "10 REPOUSSE?"
	done

_DiamondProspectorGiveRepels::
	text "Donner 10"
	cont "REPOUSSE?"
	done

_DiamondProspectorUseRepels::
	text "Parfait, on"
	line "vaporise partout!"
	prompt

_DiamondMineProspectorHelp2::
	text "Les NOSFERALTI"
	line "sont partis!"
	para "Parfait!"
	para "Passons a"
	line "la suite."
	para "Mon radio-cassette"
	line "n'a plus de"
	cont "piles!"
	para "Tu pourrais"
	line "l'electrocuter"
	cont "avec un #MON"
	cont "ELECTRIQUE?"
	para "Ou un #MON"
	line "avec CAGE-ECLAIR."
	para "Il me faut ma"
	line "musique pour"
	cont "creuser!"
	done

_DiamondMineProspectorHelp3::
	text "C'est ma tune!"
	line "Oh ouais!"
	para "C'est parti!"
	para "On s'y met!"
	prompt

_DiamondMineProspectorRagh::
	text "RAAAAAAAGH!!!"
	done

_DiamondMineProspectorHelp4::
	text "On touche"
	line "le bedrock!"
	para "Il me faut un"
	line "#MON qui peut"
	cont "casser la pierre!"
	para "T'as un ONIX?"
	done

_DiamondMineBoomboxInitial::
	text "Un radio-cassette"
	line "portable!"
	para "Il ne semble"
	line "pas s'allumer."
	done

_DiamondMineBoomboxZap::
	text "L'electrocuter?"
	done

_DiamondMineBoomboxZapProc::
	text_ram wNameBuffer
	text " a envoye"
	line "du jus au boombox!"
	done

_DiamondMineBoomboxZapProc2::
	text_ram wNameBuffer
	text " a utilise"
	line "CAGE-ECLAIR"
	cont "sur le boombox!"
	done

_DiamondMineBoomboxFunctional::
	text "Le boombox joue"
	line "un morceau"
	cont "bombastique."
	done

_DiamondMinePickedOnix::
	text "OK @"
	text_ram wNameBuffer
	text ","
	line "le vrai boulot"
	cont "commence!"
	prompt

_DiamondMineDownHere::
	text "Hé gamin!"
	line "Descends!"
	para "Tu vas pas"
	line "le croire!"
	done

_DiamondMineWeeksOfWork::
	text "<PLAYER>, le"
	line "prospecteur et"
	cont "@"
	text_ram wNameBuffer
	text " ont"
	cont "creuse des"
	cont "semaines"
	cont "dans le bedrock."
	para "Bientot seul"
	line "@"
	text_ram wNameBuffer
	text " pouvait"
	cont "avancer."
	para "Jusqu'a..."
	prompt

_DiamondMineFinished::
	text "Des diamants!!"
	line "Partout!!"
	para "Tout ça grace"
	line "a @"
	text_ram wNameBuffer
	text "!"
	para "Son corps de"
	line "pierre a durci"
	cont "a force de"
	cont "creuser!"
	para "Dur comme"
	line "le diamant!"
	done

_DiamondMineFinished2::
	text_start
	para "@"
	text_ram wNameBuffer
	text " a"
	line "été renforcé!"
	done

_DiamondMineFinished3::
	text_start
	para "Ses PV de base"
	line "ont monte! 55→80"
	para "Son ATTAQUE"
	line "de base! 25→85"
	para "Il prendra moins"
	line "de dégâts EAU,"
	cont "GLACE et PLANTE!"
	done

_DiamondMineEndText::
	text "Waouh gamin!"
	para "Ces diamants"
	line "vont prendre du"
	cont "temps a sortir!"
	para "J'avais pas de"
	line "bol, tu m'as"
	cont "aide!"
	para "Viens me voir"
	line "chez moi a"
	cont "CELADOPOLE"
	cont "un jour!"
	done

_DiamondMineMoreOnix::
	text "Ou tu voulais"
	line "que je m'entraine"
	cont "avec un autre"
	cont "ONIX?"
	done

_DiamondMineMoreOnix2::
	text "Avec plaisir!"
	line "C'est parti!"
	prompt

_DiamondMineOnixTrainDone::
	text "Sacree session"
	line "de creusement!"
	done