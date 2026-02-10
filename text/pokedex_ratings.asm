_DexCompletionText::
	text "Niveau #DEX:"

	para "@"
	text_decimal hDexRatingNumMonsSeen, 1, 3
	text " #MON vus"
	line "@"
	text_decimal hDexRatingNumMonsOwned, 1, 3
	text " #MON pris"

	para "Observation du"
	line "PROF.CHEN:"
	prompt

_DexRatingText_Own0To9::
	text "Tu as encore"
	line "beaucoup à faire."
	cont "Cherche des"
	cont "#MON dans les"
	cont "hautes herbes!"
	done

_DexRatingText_Own10To19::
	text "Tu es sur la"
	line "bonne voie!"
	cont "Demande la CS"
	cont "FLASH à mon"
	cont "ASSISTANT!"
	done

_DexRatingText_Own20To29::
	text "Il te faut encore"
	line "plus de #MON!"
	cont "Attrape d'autres"
	cont "espèces!"
	done

_DexRatingText_Own30To39::
	text "Bien, tu t'y"
	line "mets sérieux!"
	cont "Demande un"
	cont "CHERCH'OBJET à"
	cont "mon ASSISTANT!"
	done

_DexRatingText_Own40To49::
	text "Très bien!"
	line "Va pêcher des"
	cont "#MON marins!"
	done

_DexRatingText_Own50To59::
	text "Ho! Ça s'améliore"
	line "de plus en plus!"
	done

_DexRatingText_Own60To69::
	text "Merveilleux!"
	line "Tu aimes"
	cont "collectionner?"
	done

_DexRatingText_Own70To79::
	text "Pas mal!"
	line "Va voir mon"
	cont "ASSISTANT quand"
	cont "tu en auras 80!"
	done

_DexRatingText_Own80To89::
	text "Tu as enfin au"
	line "moins 80 espèces!"
	cont "Pense à prendre"
	cont "une PUCE BOOST"
	cont "chez mon"
	cont "ASSISTANT!"
	done

_DexRatingText_Own90To99::
	text "Impressionnant!"
	line "Ca a dû être"
	cont "difficile!"
	done

_DexRatingText_Own100To109::
	text "J'y crois pas"
	line "comme t'es doué!"
	para "Tu as enfin au"
	line "moins 100"
	cont "espèces!"
	done

_DexRatingText_Own110To119::
	text "Tu as même les"
	line "formes évoluées!"
	cont "Super!"
	done

_DexRatingText_Own120To129::
	text "Excellent!"
	line "Echange avec des"
	cont "amis pour en"
	cont "avoir plus!"
	done

_DexRatingText_Own130To139::
	text "Exceptionnel!"
	line "T'es devenu un"
	cont "vrai pro!"
	done

_DexRatingText_Own140To149::
	text "J'ai plus rien"
	line "à dire!"
	cont "C'est toi"
	cont "l'expert"
	cont "maintenant!"
	done

_DexRatingText_Own150To151::
	text "Félicitations!"
	para "Ton #DEX est"
	line "totalement"
	cont "complet!"
	done
