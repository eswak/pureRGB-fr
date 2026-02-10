IF DEF(_RED)
DefaultNamesPlayer:
	db   "NEW NAME"
	next "RED"
	next "ASH"
	next "JACK"
	db   "@"

DefaultNamesRival:
	db   "NEW NAME"
	next "BLUE"
	next "GARY"
	next "JOHN"
	db   "@"
ENDC

IF DEF(_BLUE)
DefaultNamesPlayer:
	db   "NEW NAME"
	next "BLUE"
	next "GARY"
	next "JOHN"
	db   "@"

DefaultNamesRival:
	db   "NEW NAME"
	next "RED"
	next "ASH"
	next "JACK"
	db   "@"
ENDC

IF DEF(_GREEN) ; PureRGBnote: GREENBUILD: default names specific to pokemon green
DefaultNamesPlayer:
	db   "NOUV NOM"
	next "GREEN"
	next "KIM"
	next "MIRA"
	db   "@"

DefaultNamesRival:
	db   "NOUV NOM"
	next "BLUE"
	next "REGIS"
	next "OSCAR"
	db   "@"
ENDC