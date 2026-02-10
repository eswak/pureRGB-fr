_CopycatsHouse2FCopycatDoYouLikePokemonText::
	text "<PLAYER>: Salut!"
	line "tu aimes les"
	cont "#MON?"

	para "<PLAYER>: Bwoarf!"
	line "J'disais ça comme"
	cont "ça!"

	para "<PLAYER>: Hein?"
	line "T'es bizarre toi!"

	para "COPIEUSE: Hmm?"
	line "Arrêter de mimer?"

	para "Mais je ne sais"
	line "faire que ça!"
	prompt

_CopycatsHouse2FCopycatTM31PreReceiveText::
	text "Whaaaaaa!"
	line "Une #POUPEE!"

	para "C'est pour moi?"
	line "Merci!"

	para "Tiens, prends ça"
	line "en échange!"
	prompt

_CopycatsHouse2FCopycatTM31Explanation1Text::
	text_start
	para "@"
	text_ram wStringBuffer
	text " contient ma"
	line "capacité préférée,"
	cont "CLONAGE!"

	para "Ton #MON leurre"
	line "l'ennemi avec"
	cont "un leurre!"

	para "Utilise-la sur un"
	line "bon #MON!@"
	text_end

_CopycatsHouse2FCopycatTM31Explanation2Text::
	text "<PLAYER>: Salut!"
	line "Merci pour la"
	cont "CT31!"

	para "<PLAYER>: Pardon?"

	para "<PLAYER>: Heu..."
	line "C'est aussi cool"
	cont "que ça de"
	cont "m'imiter?"

	para "COPIEUSE: Ah non!"
	line "C'est vraiment la"
	cont "galère, t'arrêtes"
	cont "pas d'bouger!"
	done

_CopycatsHouse2FCopycatTM31NoRoomText::
	text "T'en veux pas?@"
	text_end

_CopycatsHouse2FDoduoText::
	text "DODUO: Doduuu!"

	para "AH, JE RIS DE"
	line "ME VOIR SI BELLE"
	cont "EN CE MIROIR!"
	done

_CopycatsHouse2FRareDollText::
	text "Ca, un #MON"
	line "rare? Tu t'moques"
	cont "de moi!"
	cont "C'est rien qu'une"
	cont "poupée! Pas belle"
	cont "en plus!"
	done

_CopycatsHouse2FSNESText::
	text "Un plombier?"
	line "Mais..."
	cont "Kesski fait?"
	cont "Y saute? Cool."
	done

_CopycatsHouse2FPCMySecretsText::
	text "..."

	para "Mes secrets!"

	para "Mon boulot:"
	line "je mime!"
	cont "Ma passion:"
	cont "les poupées!"
	cont "Mon #MON"
	cont "préféré: MELOFEE!"
	done

_CopycatsHouse2FPCCantSeeText::
	text "J'vois rien!"
	done
