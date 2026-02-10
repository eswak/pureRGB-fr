_PokemonTower2FRivalWhatBringsYouHereText::
	text "<RIVAL>: Hé,"
	line "<PLAYER>!"
	cont "Kesstu fais là?"
	cont "Tes #MON sont"
	cont "pas morts!"

	para "Je peux quand"
	line "même les mettre"
	cont "K.O.! Minable!"
	done

_PokemonTower2FRivalDefeatedText::
	text "Hein?"
	line "Petit fennec!"

	para "Je ne t'ai pas"
	line "pris au sérieux!"
	cont "M-I-N-A-B-L-E!"
	prompt

_PokemonTower2FRivalVictoryText::
	text "<RIVAL>: Haha,"
	line "Tes #MON sont"
	cont "minables..."
	cont "Comme toi!"

	para "Tu devrais les"
	line "entraîner un peu!"
	prompt

_PokemonTower2FRivalHowsYourDexText::
	text "Où en est ton"
	line "#DEX? Je"
	cont "viens de capturer"
	cont "un OSSELAIT!"

	para "Je n'ai pas"
	line "encore trouvé de"
	cont "OSSATUEUR!"

	para "Je crois qu'il"
	line "n'en existe plus!"
	cont "Je dois y aller,"
	cont "minable! J'ai du"
	cont "pain sur la"
	cont "planche, minable!"

	para "A bientôt..."
	line "Gros minable!"
	done

_PokemonTower2FChannelerText::
	text "Nous ne pouvons"
	line "identifier les"
	cont "SPECTRES!"

	para "Un @"
	text_ram wNameBuffer
	text_start
	line "pourrait les"
	cont "démasquer."
	done

_PokemonTower2FChannelerText2::
	text "Merci d'avoir"
	line "débarrassé notre"
	cont "tour de la"
	cont "TEAM ROCKET!"
	done

_PokemonTower2FChannelerText3::
	text "Merci pour toute"
	line "ton aide!"
	done

_PokemonTower2FChannelerTextBorrowSilphScope::
	text "Avant que tu"
	line "partes, tu"
	cont "pourrais me prêter"
	cont "ton @"
	text_ram wNameBuffer
	text "?"
	para "Ca nous aiderait"
	line "avec les esprits"
	cont "errants!"
	para "Je te le rendrai"
	line "quand tu"
	cont "reviendras"
	cont "ici!"
	para "Qu'est-ce que tu"
	line "en dis?"
	done

_PokemonTower2FChannelerTextBorrowSilphScopeYes::
	text "Parfait!"
	para "<PLAYER> a donné"
	line "à l'exorciste le"
	cont "@"
	text_ram wNameBuffer
	text "."
	done

_PokemonTower2FChannelerTextBack::
	text "Tu veux récupérer"
	line "ton @"
	text_ram wNameBuffer
	text "?"
	done

_PlayerGotBackItem::
	text "<PARA><PLAYER> a récupéré"
	line "le @"
	text_ram wNameBuffer
	text "!"
	done

_PokemonTower2FChannelerTextBorrowAgain::
	text "Au fait..."
	para "Je peux te"
	line "re-emprunter ton"
	cont "@"
	text_ram wNameBuffer
	text "?"
	done

_GenericWaitText::
	text "Attends!"
	done

_OhHelloAgainText::
	text "Oh, bonjour"
	cont "encore!"
	done
