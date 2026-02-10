TypeNames:
	table_width 2

	dw .Normal
	dw .Fighting
	dw .Flying
	dw .Poison
	dw .Ground
	dw .Rock
	dw .Typeless
	dw .Bug
	dw .Ghost
	dw .Crystal
	dw .Ground ; bonemerang type

REPT UNUSED_TYPES_END - UNUSED_TYPES
	dw .Normal
ENDR
	dw .Tri
	dw .Floating
	dw .Magma
	dw .Fire
	dw .Water
	dw .Grass
	dw .Electric
	dw .Psychic
	dw .Ice
	dw .Dragon

	assert_table_length NUM_TYPES

.Normal:   db "NORMAL@"
.Fighting: db "COMBAT@@"
.Flying:   db "VOL@@@@@"
.Poison:   db "POISON@@"
.Fire:     db "FEU@@@@@"
.Water:    db "EAU@@@@@"
.Grass:    db "PLANTE@@"
.Electric: db "ELECTRIK@"
.Psychic:  db "PSY@@@@@"
.Ice:      db "GLACE@@@"
.Ground:   db "SOL@@@@@"
.Rock:     db "ROCHE@@@"
.Typeless: db "AUCUN@@@"
.Bug:      db "INSECTE@@"
.Ghost:    db "SPECTRE@@"
.Dragon:   db "DRAGON@@@"
.Tri:      db "TRI@@@@@"
.Crystal:  db "CRISTAL@@"
.Floating: db "FLOTTANT@"
.Magma:    db "MAGMA@@@@"
