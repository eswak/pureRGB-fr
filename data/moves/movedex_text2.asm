; PureRGBnote: ADDED: text pointers for the descriptions that show up in the movedex. 
; Separated into two files because it doesn't fit in a single bank.

_SharpenDexEntry::
	text "Le lanceur"
	next "aiguise ses"
	next "griffes ou lames."

	bage "Augmente ATTACK"
	next "et ACCURACY."
	next "(+1 chaque)"
	dex

_ConversionDexEntry::
	text "Le lanceur"
	next "analyse l'ennemi"
	next "et adapte son"

	bage "corps pour être"
	next "mieux adapté face"
	next "à l'ennemi."

	bage "Augmente beaucoup"
	next "le SPECIAL."
	next "(+2 SPECIAL)"
	dex

_TriAttackDexEntry::
	text "Tire des triangles"
	next "aux propriétés"
	next "de 3 éléments:"

	bage "Feu, glace et"
	next "électricité."

	bage "10% de chance"
	next "chacun: brûlure,"
	next "gel ou paralysie"
	dex

_SuperFangDexEntry::
	text "Le lanceur mord"
	next "fort l'ennemi"
	next "avec ses crocs"

	bage "de devant"
	next "très acérés."

	bage "Inflige toujours"
	next "2/3 des HP actuels"
	next "de l'ennemi."
	dex

_SlashDexEntry::
	text "Le lanceur"
	next "tranche l'ennemi"
	next "avec ses griffes"

	bage "ou objet coupant."
	next "Touche souvent en"
	next "coup critique."
	dex

_SubstituteDexEntry::
	text "Un clone remplace"
	next "le lanceur et"
	next "subit les dégâts"

	bage "à sa place."
	next "Sacrifie 1/4 des"
	next "HP du lanceur."
	dex

_StruggleDexEntry::
	text "Attaque de dernier"
	next "recours, utilisée"
	next "quand les attaques"

	bage "ont 0 PP restants."
	next "Cause un fort"
	next "recul au lanceur."
	dex

