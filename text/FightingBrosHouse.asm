_FightingBrosRocketText::
	text "Aïe<...>"
	para "Ils m'ont tabassé"
	line "parce que j'ai"
	cont "bloqué leur porte."
	para "Maintenant je"
	line "nettoie<...>"
	prompt

_FightingBrosRocketText2::
	text "BRO: On va"
	line "régler ça avec"
	cont "ce <ROCKET>!"
	para "Il lui faut:"
	line "courtoisie,"
	cont "intégrité,"
	cont "persévérance,"
	para "maîtrise de soi,"
	line "et un esprit"
	cont "indomptable!"
	para "Les cinq préceptes"
	line "du FIGHTING DOJO!"
	para "Tu iras là-bas"
	line "demain pour une"
	cont "bonne leçon!"
	para "Compris,"
	line "apprenti?"
	prompt

_FightingBrosRocketText3::
	text "<ROCKET>: Aïe!"
	line "O-oui monsieur!"
	done

_FightingBrosWelcomeText::
	text "Nous sommes les"
	line "FIGHTING BROS.!"
	para "Membres du"
	line "FIGHTING DOJO."
	prompt

_FightingBrosSabrinaText::
	text "SABRINA a battu"
	line "le DOJO<...>"
	para "elle nous a fait"
	line "perdre le statut"
	cont "de <PK><MN> GYM!"
	para "On cherche"
	line "quelqu'un pour la"
	cont "battre!"
	para "Va à la SAFFRON"
	line "GYM et montre-lui"
	cont "qui commande!"
	para "Si tu le fais, on"
	line "te traitera comme"
	cont "un frère!"
	done

_FightingBrosGotMarshBadge::
	text "L'éclat doré du"
	line "MARSHBADGE est"
	cont "reconnaissable!"
	para "Tu as battu"
	line "SABRINA, frère!"
	para "Les FIGHTING BROS."
	line "te récompenseront"
	cont "comme on peut!"
	prompt

_FightingBrosRightBro::
	text "En tant qu'aîné"
	line "des FIGHTING BRO,"
	para "je suis le calme,"
	line "le posé."
	para "La raison avant"
	line "la violence,"
	cont "méditer chaque"
	cont "jour."
	para "Tu connais les"
	line "coups FIRE PUNCH,"
	cont "ICE PUNCH et"
	cont "THUNDERPUNCH?"
	para "ALAKAZAM ne peut"
	line "pas les apprendre."
	para "En fait<...>"
	line "il peut!"
	para "C'est un génie,"
	line "tu sais!"
	para "Mais il refuse!"
	para "Il voit ces coups"
	line "comme barbares."
	para "Je peux convaincre"
	line "ton ALAKAZAM de"
	cont "les apprendre-"
	para "par la pure"
	line "logique!"
	para "Mais c'est dur."
	para "Je ne le ferai"
	line "qu'une seule fois!"
	para "Qu'en dis-tu?"
	done

_FightingBrosRightBroShort::
	text "Alors, qu'en"
	line "dis-tu?"
	para "J'enseigne un"
	line "coup élémentaire"
	cont "à ton ALAKAZAM?"
	para "Rappelle-toi, une"
	line "seule fois!"
	done

_FightingBrosRightBroWhich::
	text "Quel coup de poing"
	line "enseigner?"
	done

_FightingBrosRightBroConvene::
	text "Parfait."
	line "@"
	text_ram_namebuffer
	text "!"
	para "Laisse-moi le"
	line "temps de parler"
	cont "avec @"
	text_ram_stringbuffer
	text "<CONT>pour convaincre!"
	prompt

_FightingBrosRightBroConvene2::
	text "Ça a pris du"
	line "temps,"
	para "mais @"
	text_ram_stringbuffer
	text "<LINE>te fait"
	cont "confiance!"
	para "Il accepte."
	line "C'est parti!"
	prompt

_FightingBrosRightBroEnd::
	text "Tu as peut-être"
	line "le seul ALAKAZAM"
	cont "au monde avec"
	cont "ce coup!"
	para "C'est pas génial"
	line "ça?"
	done

_FightingBrosRightBroAfter::
	text "ALAKAZAM!"
	para "Va de l'avant et"
	line "frappe les cieux!"
	done

_FightingBrosLeftBro::
	text "En tant que cadet"
	line "des FIGHTING BRO,"
	para "je suis le fonceur"
	line "et le boute-en-"
	cont "train!"
	para "J'adore apprendre"
	line "et enseigner"
	cont "des techniques!"
.showMe
	para "Montre-moi un"
	line "#MON et je te"
	cont "dirai les coups"
	cont "que je connais!"
	prompt

_FightingBrosLeftBroShort::
	text "Salut, frère!@"
	text_jump _FightingBrosLeftBro.showMe

_FightingBrosLeftBroAfterTeachText::
	text "Bon choix!"
	line "Ce coup déchire!"
	done

_MoveTutorChooseMoveToLearnText::
	text "@"
	text_ram_namebuffer
	text "?"
	para "Je peux lui"
	line "apprendre ceci."
	prompt

_MoveTutorCantTeach::
	text "@"
	text_ram_namebuffer
	text "?"
	line "Ah, désolé!"
	para "Il ne peut rien"
	line "apprendre de moi!"
	prompt

_MoveTutorLearnMoveCost::
	text "Apprendre un coup"
	line "coûte ¥@"
	text_bcd hMoney, 3 | LEADING_ZEROES | LEFT_ALIGN
	text "."
	prompt

_MoveTutorFreebie::
	text "Cette fois c'est"
	line "gratuit!"
	prompt

_MoveTutorNotEnoughCash::
	text "Oups! Tu n'as pas"
	line "assez d'argent!"
	done

_FightingBrosHouseCatalogueText::
	text "Services sensei"
	line "des FIGHTING BROS."
	para "Choisis un coup"
	line "dans le catalogue!"
	prompt

_FightingBrosHouseCatalogue2Text::
	text "Rejoins la famille"
	line "FIGHTING BROS.!"
	para "ON LÂCHE RIEN!"
	done

_FightingBrosRocketText4::
	text "Je suis un humble"
	line "WHITEBELT au"
	cont "FIGHTING DOJO!"
	para "Je débute"
	line "maintenant,"
	para "mais c'est mieux"
	line "qu'une vie de"
	cont "crime en ROCKET!"
	para "FIGHTING BROS."
	line "ON LÂCHE RIEN!"
	done
