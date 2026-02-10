_ChampionsRoomRivalIntroText::
	text "<RIVAL>: Salut!"

	para "J'avais hate"
	line "de te voir,"
	cont "<PLAYER>!"

	para "Mon rival doit"
	line "etre fort pour"
	cont "me garder au"
	cont "top!"

	para "En travaillant"
	line "sur le #DEX,"
	cont "j'ai cherche"
	cont "partout des"
	cont "#MON puissants!"

	para "Et en plus, j'ai"
	line "monte des equipes"
	cont "pour battre"
	cont "tous les types!"

	para "Et maintenant!"

	para "Je suis le"

	cont "champion"
	line "de la LIGUE"
	cont "#MON!"

	para "<PLAYER>! Tu sais"
	line "ce que ca veut"
	cont "dire?"

	para "Je te le dis!"

	para "Je suis le"
	line "dresseur le plus"
	cont "puissant du monde!"
	done

_RivalDefeatedText::
	text "NON!"
	line "C'est pas"
	cont "possible!"
	cont "Tu as battu mon"
	cont "meilleur!"

	para "Apres tout ce"
	line "travail pour"
	cont "devenir champion?"

	para "Mon regne est"
	line "deja fini?"
	cont "C'est pas juste!"
	prompt

_RivalVictoryText::
	text "Hahaha!"
	line "J'ai gagne!"

	para "Tu ne fais pas"
	line "le poids,"
	cont "<PLAYER>!"

	para "C'est deja bien"
	line "d'etre arrive"
	cont "jusqu'a moi,"
	cont "<RIVAL>, le genie"
	cont "#MON!"

	para "Bien essaye!"
	line "Hahaha!"
	prompt

_ChampionsRoomRivalAfterBattleText::
	text "Pourquoi?"
	line "Pourquoi j'ai"
	cont "perdu?"

	para "J'ai jamais fait"
	line "d'erreur en"
	cont "elevent mes"
	cont "#MON..."

	para "Zut! Tu es le"
	line "nouveau champion"
	cont "de la LIGUE #MON!"

	para "Meme si j'aime"
	line "pas l'admettre."
	done

_ChampionsRoomOakText::
	text "CHEN: <PLAYER>!"
	done

_ChampionsRoomOakCongratulatesPlayerText::
	text "CHEN: Tu as gagne!"
	line "Felicitations!"
	cont "Tu es le nouveau"
	cont "champion de la"
	cont "LIGUE #MON!"

	para "Tu as bien grandi"
	line "depuis ton depart"
	cont "avec @"
	text_ram wNameBuffer
	text "!"

	para "<PLAYER>, te voila"
	line "devenu grand!"
	done

_ChampionsRoomOakDisappointedWithRivalText::
	text "CHEN: <RIVAL>!"
	line "Je suis decu!"

	para "Je suis venu"
	line "en apprenant"
	cont "que tu avais battu"
	cont "le CONSEIL 4!"

	para "Mais en arrivant,"
	line "tu avais deja"
	cont "perdu!"

	para "<RIVAL>! Tu"
	line "comprends pourquoi"
	cont "tu as perdu?"

	para "Tu as oublie"
	line "de traiter tes"
	cont "#MON avec"
	cont "confiance et"
	cont "amour!"

	para "Sans ca, tu ne"
	line "redeviendras"
	cont "jamais champion!"
	done

_ChampionsRoomOakComeWithMeText::
	text "CHEN: <PLAYER>!"

	para "Tu comprends"
	line "que ta victoire"
	cont "n'etait pas"
	cont "que ton fait!"

	para "Le lien avec tes"
	line "#MON est"
	cont "merveilleux!"

	para "<PLAYER>!"
	line "Viens avec moi!"
	done
