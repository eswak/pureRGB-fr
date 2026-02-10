_MomDadNotHereText::
	text "Te voila,"
	line "<PLAYER>!"
	para "Ou est PAPA?"
	para "Tu l'as manque"
	line "de peu!"
	para "Il avait un truc"
	line "urgent au travail."
	para "Ne t'en fais pas,"
	line "tu le verras"
	cont "bientot."
	done

_MomFoodReadyText::
	text "Te voila!"
	para "Ton repas est"
	line "pret!"
	prompt

_MomFoodBonAppetit::
	text "Bon appetit!"
	prompt

_MomFoodRiceBallsText::
	text "Chaque boulette"
	line "de MAMAN etait"
	cont "une surprise."
	para "Chacune avait"
	line "quelque chose"
	cont "de different"
	cont "et bon dedans."
	prompt

_MomFoodJellyDonutsText::
	text "Rien ne vaut"
	line "les beignets"
	cont "a la confiture"
	cont "de MAMAN."
	prompt

_MomFoodBrisketText::
	text "Le boeuf prepare"
	line "avec la recette"
	cont "de PAPA etait"
	cont "delicieux!"
	prompt

_DadFoodBrisketText::
	text "PAPA a sorti"
	line "son boeuf BBQ"
	cont "cuisson lente."
	para "C'etait"
	line "delicieux!"
	prompt

_MomFoodBrisketText2::
	text "La sauce"
	line "etait parfaite."
	prompt

_MomFoodLasagnaText::
	text "Les lasagnes"
	line "de Maman"
	cont "imparables."
	para "<PLAYER> a tout"
	line "mange jusqu'au"
	cont "dernier morceau."
	prompt

_DadChowedDownText::
	text "PAPA s'est"
	line "regale."
	prompt

_MomFoodPokemonJoinsText::
	text "@"
	text_ram wNameBuffer
	text " en"
	line "a eu aussi!"
	prompt

_MomFoodPokemonChowedDownText::
	text "Il s'est"
	line "regale."
	prompt

_MomFoodPokemonShowText::
	text "MAMAN avait"
	line "l'air contente!"
	done

_MomFoodDone::
	text "Tu devrais"
	line "y aller!"
	para "Amuse-toi bien!"
	done

_DaisyTeaEvent::
	text "Oh, salut"
	line "<PLAYER>!"
	para "Tu viens"
	line "pour le the?"
	prompt

_DaisyTeaEventNo::
	text "OK, a plus tard!"
	done

_DaisyTeaPeppermint::
	text "Aujourd'hui"
	line "the a la menthe."
	para "Son aroma t'aide"
	line "a te reveiller"
	cont "le matin."
	para "Et a digerer"
	line "apres le repas."
	prompt

_DaisyTeaBarley::
	text "Aujourd'hui"
	line "the d'orge."
	para "Servi froid,"
	line "parfait par"
	cont "grande chaleur."
	prompt

_DaisyTeaChai::
	text "Aujourd'hui"
	line "the chai epice."
	para "The noir infuse"
	line "avec du lait."
	para "Avec gingembre,"
	line "cardamome,"
	cont "muscade,"
	cont "cannelle et"
	cont "sucre roux."
	para "Un gout"
	line "puissant et"
	cont "varie."
	para "Souvent en"
	line "alternative au"
	cont "cafe."
	prompt

_DaisyTeaSitDown::
	text "OK! Mais d'abord,"
	line "assieds-toi!"
	done

_TeaDrink::
	text "<PLAYER> a goute"
	line "au the de MARIE."
	done

_TeaReaction::
	text "Effet calmant"
	line "agreable."
	para "C'est tres"
	line "revitalisant!"
	para "@"
	text_ram wNameBuffer
	text " "
	line "regarde MARIE."
	para "Il a l'air"
	line "de l'aimer."
	para "Il est tout"
	line "detendu!"
	done

_DaisyTeaEnd::
	text "Je suis la"
	line "quand tu veux"
	cont "du the."
	para "Merci d'etre"
	line "venu, bye!"
	done