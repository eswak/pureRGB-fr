; TODO: convert to all be in the dex_text.asm bank and just a single list of pointers?
; PureRGBnote: CHANGED: adusted to be indexed by pokedex_constants instead of pokemon_constants to take up less space
PokedexEntryPointers:
	table_width 2
	dw BulbasaurDexEntry
	dw IvysaurDexEntry
	dw VenusaurDexEntry
	dw CharmanderDexEntry
	dw CharmeleonDexEntry
	dw CharizardDexEntry
	dw SquirtleDexEntry
	dw WartortleDexEntry
	dw BlastoiseDexEntry
	dw CaterpieDexEntry
	dw MetapodDexEntry
	dw ButterfreeDexEntry
	dw WeedleDexEntry
	dw KakunaDexEntry
	dw BeedrillDexEntry
	dw PidgeyDexEntry
	dw PidgeottoDexEntry
	dw PidgeotDexEntry
	dw RattataDexEntry
	dw RaticateDexEntry
	dw SpearowDexEntry
	dw FearowDexEntry
	dw EkansDexEntry
	dw ArbokDexEntry
	dw PikachuDexEntry
	dw RaichuDexEntry
	dw SandshrewDexEntry
	dw SandslashDexEntry
	dw NidoranFDexEntry
	dw NidorinaDexEntry
	dw NidoqueenDexEntry
	dw NidoranMDexEntry
	dw NidorinoDexEntry
	dw NidokingDexEntry
	dw ClefairyDexEntry
	dw ClefableDexEntry
	dw VulpixDexEntry
	dw NinetalesDexEntry
	dw JigglypuffDexEntry
	dw WigglytuffDexEntry
	dw ZubatDexEntry
	dw GolbatDexEntry
	dw OddishDexEntry
	dw GloomDexEntry
	dw VileplumeDexEntry
	dw ParasDexEntry
	dw ParasectDexEntry
	dw VenonatDexEntry
	dw VenomothDexEntry
	dw DiglettDexEntry
	dw DugtrioDexEntry
	dw MeowthDexEntry
	dw PersianDexEntry
	dw PsyduckDexEntry
	dw GolduckDexEntry
	dw MankeyDexEntry
	dw PrimeapeDexEntry
	dw GrowlitheDexEntry
	dw ArcanineDexEntry
	dw PoliwagDexEntry
	dw PoliwhirlDexEntry
	dw PoliwrathDexEntry
	dw AbraDexEntry
	dw KadabraDexEntry
	dw AlakazamDexEntry
	dw MachopDexEntry
	dw MachokeDexEntry
	dw MachampDexEntry
	dw BellsproutDexEntry
	dw WeepinbellDexEntry
	dw VictreebelDexEntry
	dw TentacoolDexEntry
	dw TentacruelDexEntry
	dw GeodudeDexEntry
	dw GravelerDexEntry
	dw GolemDexEntry
	dw PonytaDexEntry
	dw RapidashDexEntry
	dw SlowpokeDexEntry
	dw SlowbroDexEntry
	dw MagnemiteDexEntry
	dw MagnetonDexEntry
	dw FarfetchdDexEntry
	dw DoduoDexEntry
	dw DodrioDexEntry
	dw SeelDexEntry
	dw DewgongDexEntry
	dw GrimerDexEntry
	dw MukDexEntry
	dw ShellderDexEntry
	dw CloysterDexEntry
	dw GastlyDexEntry
	dw HaunterDexEntry
	dw GengarDexEntry
	dw OnixDexEntry
	dw DrowzeeDexEntry
	dw HypnoDexEntry
	dw KrabbyDexEntry
	dw KinglerDexEntry
	dw VoltorbDexEntry
	dw ElectrodeDexEntry
	dw ExeggcuteDexEntry
	dw ExeggutorDexEntry
	dw CuboneDexEntry
	dw MarowakDexEntry
	dw HitmonleeDexEntry
	dw HitmonchanDexEntry
	dw LickitungDexEntry
	dw KoffingDexEntry
	dw WeezingDexEntry
	dw RhyhornDexEntry
	dw RhydonDexEntry
	dw ChanseyDexEntry
	dw TangelaDexEntry
	dw KangaskhanDexEntry
	dw HorseaDexEntry
	dw SeadraDexEntry
	dw GoldeenDexEntry
	dw SeakingDexEntry
	dw StaryuDexEntry
	dw StarmieDexEntry
	dw MrMimeDexEntry
	dw ScytherDexEntry
	dw JynxDexEntry
	dw ElectabuzzDexEntry
	dw MagmarDexEntry
	dw PinsirDexEntry
	dw TaurosDexEntry
	dw MagikarpDexEntry
	dw GyaradosDexEntry
	dw LaprasDexEntry
	dw DittoDexEntry
	dw EeveeDexEntry
	dw VaporeonDexEntry
	dw JolteonDexEntry
	dw FlareonDexEntry
	dw PorygonDexEntry
	dw OmanyteDexEntry
	dw OmastarDexEntry
	dw KabutoDexEntry
	dw KabutopsDexEntry
	dw AerodactylDexEntry
	dw SnorlaxDexEntry
	dw ArticunoDexEntry
	dw ZapdosDexEntry
	dw MoltresDexEntry
	dw DratiniDexEntry
	dw DragonairDexEntry
	dw DragoniteDexEntry
	dw MewtwoDexEntry
	dw MewDexEntry
	assert_table_length NUM_POKEMON - 1

; string: species name (category)
; height in feet, inches
; weight in tenths of a pound
; text entry

RhydonDexEntry:
	db "PERCEUR@"
	db 6,3
	dw 2650
	text_far _RhydonDexEntry
	text_end

KangaskhanDexEntry:
	db "MATERNEL@"
	db 7,3
	dw 1760
	text_far _KangaskhanDexEntry
	text_end

NidoranMDexEntry:
	db "VENEPIC@"
	db 1,8
	dw 200
	text_far _NidoranMDexEntry
	text_end

ClefairyDexEntry:
	db "FEE@"
	db 2,0
	dw 170
	text_far _ClefairyDexEntry
	text_end

SpearowDexEntry:
	db "MINOISEAU@"
	db 1,0
	dw 40
	text_far _SpearowDexEntry
	text_end

VoltorbDexEntry:
	db "BALLE@"
	db 1,8
	dw 230
	text_far _VoltorbDexEntry
	text_end

NidokingDexEntry:
	db "PERCEUR@"
	db 4,7
	dw 1370
	text_far _NidokingDexEntry
	text_end

SlowbroDexEntry:
	db "SYMBIOSE@"
	db 5,3
	dw 1730
	text_far _SlowbroDexEntry
	text_end

IvysaurDexEntry:
	db "GRAINE@"
	db 3,3
	dw 290
	text_far _IvysaurDexEntry
	text_end

ExeggutorDexEntry:
	db "FRUITPALME@"
	db 6,7
	dw 2650
	text_far _ExeggutorDexEntry
	text_end

LickitungDexEntry:
	db "LECHEUR@"
	db 3,11
	dw 1440
	text_far _LickitungDexEntry
	text_end

ExeggcuteDexEntry:
	db "OEUF@"
	db 1,4
	dw 60
	text_far _ExeggcuteDexEntry
	text_end

GrimerDexEntry:
	db "DEGUEU@"
	db 2,11
	dw 660
	text_far _GrimerDexEntry
	text_end

GengarDexEntry:
	db "OMBRE@"
	db 4,11
	dw 890
	text_far _GengarDexEntry
	text_end

NidoranFDexEntry:
	db "VENEPIC@"
	db 1,4
	dw 150
	text_far _NidoranFDexEntry
	text_end

NidoqueenDexEntry:
	db "PERCEUR@"
	db 4,3
	dw 1320
	text_far _NidoqueenDexEntry
	text_end

CuboneDexEntry:
	db "SOLITAIRE@"
	db 1,4
	dw 140
	text_far _CuboneDexEntry
	text_end

RhyhornDexEntry:
	db "PIQUANT@"
	db 3,3
	dw 2540
	text_far _RhyhornDexEntry
	text_end

LaprasDexEntry:
	db "TRANSPORT@"
	db 8,2
	dw 4850
	text_far _LaprasDexEntry
	text_end

ArcanineDexEntry:
	db "LEGENDAIRE@"
	db 6,3
	dw 3420
	text_far _ArcanineDexEntry
	text_end

MewDexEntry:
	db "NOUVEAU@"
	db 1,4
	dw 90
	text_far _MewDexEntry
	text_end

GyaradosDexEntry:
	db "TERRIFIANT@"
	db 21,4
	dw 5180
	text_far _GyaradosDexEntry
	text_end

ShellderDexEntry:
	db "BIVALVE@"
	db 1,0
	dw 90
	text_far _ShellderDexEntry
	text_end

TentacoolDexEntry:
	db "MOLLUSQUE@"
	db 2,11
	dw 1000
	text_far _TentacoolDexEntry
	text_end

GastlyDexEntry:
	db "GAZ@"
	db 4,3
	dw 2
	text_far _GastlyDexEntry
	text_end

ScytherDexEntry:
	db "MANTE@"
	db 4,11
	dw 1230
	text_far _ScytherDexEntry
	text_end

StaryuDexEntry:
	db "ETOILE@"
	db 2,7
	dw 760
	text_far _StaryuDexEntry
	text_end

BlastoiseDexEntry:
	db "CARAPACE@"
	db 5,3
	dw 1890
	text_far _BlastoiseDexEntry
	text_end

PinsirDexEntry:
	db "SCARABEE@"
	db 4,11
	dw 1210
	text_far _PinsirDexEntry
	text_end

TangelaDexEntry:
	db "VIGNE@"
	db 3,3
	dw 770
	text_far _TangelaDexEntry
	text_end

GrowlitheDexEntry:
	db "CHIOT@"
	db 2,4
	dw 420
	text_far _GrowlitheDexEntry
	text_end

OnixDexEntry:
	db "SERPENROC@"
	db 28,10
	dw 4630
	text_far _OnixDexEntry
	text_end

FearowDexEntry:
	db "BEC-OISEAU@"
	db 3,11
	dw 840
	text_far _FearowDexEntry
	text_end

PidgeyDexEntry:
	db "MINOISEAU@"
	db 1,0
	dw 40
	text_far _PidgeyDexEntry
	text_end

SlowpokeDexEntry:
	db "CRETIN@"
	db 3,11
	dw 790
	text_far _SlowpokeDexEntry
	text_end

KadabraDexEntry:
	db "PSY@"
	db 4,3
	dw 1250
	text_far _KadabraDexEntry
	text_end

GravelerDexEntry:
	db "ROCHE@"
	db 3,3
	dw 2320
	text_far _GravelerDexEntry
	text_end

ChanseyDexEntry:
	db "OEUF@"
	db 3,7
	dw 760
	text_far _ChanseyDexEntry
	text_end

MachokeDexEntry:
	db "COLOSSE@"
	db 4,11
	dw 1550
	text_far _MachokeDexEntry
	text_end

MrMimeDexEntry:
	db "BLOQUEUR@"
	db 4,3
	dw 1200
	text_far _MrMimeDexEntry
	text_end

HitmonleeDexEntry:
	db "LATTEUR@"
	db 4,11
	dw 1100
	text_far _HitmonleeDexEntry
	text_end

HitmonchanDexEntry:
	db "PUNCHEUR@"
	db 4,7
	dw 1110
	text_far _HitmonchanDexEntry
	text_end

ArbokDexEntry:
	db "COBRA@"
	db 11,6
	dw 1430
	text_far _ArbokDexEntry
	text_end

ParasectDexEntry:
	db "CHAMPIGNON@"
	db 3,3
	dw 650
	text_far _ParasectDexEntry
	text_end

PsyduckDexEntry:
	db "CANARD@"
	db 2,7
	dw 430
	text_far _PsyduckDexEntry
	text_end

DrowzeeDexEntry:
	db "HYPNOSE@"
	db 3,3
	dw 710
	text_far _DrowzeeDexEntry
	text_end

GolemDexEntry:
	db "TITANESQUE@"
	db 4,7
	dw 6620
	text_far _GolemDexEntry
	text_end

MagmarDexEntry:
	db "CRACHE-FEU@"
	db 4,3
	dw 980
	text_far _MagmarDexEntry
	text_end

ElectabuzzDexEntry:
	db "ELECTRIQUE@"
	db 3,7
	dw 660
	text_far _ElectabuzzDexEntry
	text_end

MagnetonDexEntry:
	db "MAGNETIQUE@"
	db 3,3
	dw 1320
	text_far _MagnetonDexEntry
	text_end

KoffingDexEntry:
	db "GAZ MORTEL@"
	db 2,0
	dw 20
	text_far _KoffingDexEntry
	text_end

MankeyDexEntry:
	db "PORSINGE@"
	db 1,8
	dw 620
	text_far _MankeyDexEntry
	text_end

SeelDexEntry:
	db "OTARIE@"
	db 3,7
	dw 1980
	text_far _SeelDexEntry
	text_end

DiglettDexEntry:
	db "TAUPE@"
	db 0,8
	dw 20
	text_far _DiglettDexEntry
	text_end

TaurosDexEntry:
	db "BUFFLE@"
	db 4,7
	dw 1950
	text_far _TaurosDexEntry
	text_end

FarfetchdDexEntry:
	db "CANARD FOU@"
	db 2,7
	dw 330
	text_far _FarfetchdDexEntry
	text_end

VenonatDexEntry:
	db "VERMINE@"
	db 3,3
	dw 660
	text_far _VenonatDexEntry
	text_end

DragoniteDexEntry:
	db "DRAGON@"
	db 7,3
	dw 4630
	text_far _DragoniteDexEntry
	text_end

DoduoDexEntry:
	db "DUOISEAU@"
	db 4,7
	dw 860
	text_far _DoduoDexEntry
	text_end

PoliwagDexEntry:
	db "TETARD@"
	db 2,0
	dw 270
	text_far _PoliwagDexEntry
	text_end

JynxDexEntry:
	db "HUMANOIDE@"
	db 4,7
	dw 900
	text_far _JynxDexEntry
	text_end

MoltresDexEntry:
	db "FLAMME@"
	db 6,7
	dw 1320
	text_far _MoltresDexEntry
	text_end

ArticunoDexEntry:
	db "GLACIAIRE@"
	db 5,7
	dw 1220
	text_far _ArticunoDexEntry
	text_end

ZapdosDexEntry:
	db "ELECTRIQUE@"
	db 5,3
	dw 1160
	text_far _ZapdosDexEntry
	text_end

DittoDexEntry:
	db "MORPHING@"
	db 1,0
	dw 90
	text_far _DittoDexEntry
	text_end

MeowthDexEntry:
	db "CHADEGOUT@"
	db 1,4
	dw 90
	text_far _MeowthDexEntry
	text_end

KrabbyDexEntry:
	db "DOUX CRABE@"
	db 1,4
	dw 140
	text_far _KrabbyDexEntry
	text_end

VulpixDexEntry:
	db "RENARD@"
	db 2,0
	dw 220
	text_far _VulpixDexEntry
	text_end

NinetalesDexEntry:
	db "RENARD@"
	db 3,7
	dw 440
	text_far _NinetalesDexEntry
	text_end

PikachuDexEntry:
	db "SOURIS@"
	db 1,4
	dw 130
	text_far _PikachuDexEntry
	text_end

RaichuDexEntry:
	db "SOURIS@"
	db 2,7
	dw 660
	text_far _RaichuDexEntry
	text_end

DratiniDexEntry:
	db "DRAGON@"
	db 5,11
	dw 70
	text_far _DratiniDexEntry
	text_end

DragonairDexEntry:
	db "DRAGON@"
	db 13,1
	dw 360
	text_far _DragonairDexEntry
	text_end

KabutoDexEntry:
	db "CARAPACE@"
	db 1,8
	dw 250
	text_far _KabutoDexEntry
	text_end

KabutopsDexEntry:
	db "CARAPACE@"
	db 4,3
	dw 890
	text_far _KabutopsDexEntry
	text_end

HorseaDexEntry:
	db "DRAGON@"
	db 1,4
	dw 180
	text_far _HorseaDexEntry
	text_end

SeadraDexEntry:
	db "DRAGON@"
	db 3,11
	dw 550
	text_far _SeadraDexEntry
	text_end

SandshrewDexEntry:
	db "SOURIS@"
	db 2,0
	dw 260
	text_far _SandshrewDexEntry
	text_end

SandslashDexEntry:
	db "SOURIS@"
	db 3,3
	dw 650
	text_far _SandslashDexEntry
	text_end

OmanyteDexEntry:
	db "SPIRALE@"
	db 1,4
	dw 170
	text_far _OmanyteDexEntry
	text_end

OmastarDexEntry:
	db "SPIRALE@"
	db 3,3
	dw 770
	text_far _OmastarDexEntry
	text_end

JigglypuffDexEntry:
	db "BOUBOULE@"
	db 1,8
	dw 120
	text_far _JigglypuffDexEntry
	text_end

WigglytuffDexEntry:
	db "BOUBOULE@"
	db 3,3
	dw 260
	text_far _WigglytuffDexEntry
	text_end

EeveeDexEntry:
	db "EVOLUTIF@"
	db 1,0
	dw 140
	text_far _EeveeDexEntry
	text_end

FlareonDexEntry:
	db "FLAMME@"
	db 2,11
	dw 550
	text_far _FlareonDexEntry
	text_end

JolteonDexEntry:
	db "FOUDRE@"
	db 2,7
	dw 540
	text_far _JolteonDexEntry
	text_end

VaporeonDexEntry:
	db "BULLEUR@"
	db 3,3
	dw 640
	text_far _VaporeonDexEntry
	text_end

MachopDexEntry:
	db "COLOSSE@"
	db 2,7
	dw 430
	text_far _MachopDexEntry
	text_end

ZubatDexEntry:
	db "CHOVSOURIS@"
	db 2,7
	dw 170
	text_far _ZubatDexEntry
	text_end

EkansDexEntry:
	db "SERPENT@"
	db 6,7
	dw 150
	text_far _EkansDexEntry
	text_end

ParasDexEntry:
	db "CHAMPIGNON@"
	db 1,0
	dw 120
	text_far _ParasDexEntry
	text_end

PoliwhirlDexEntry:
	db "TETARD@"
	db 3,3
	dw 440
	text_far _PoliwhirlDexEntry
	text_end

PoliwrathDexEntry:
	db "TETARD@"
	db 4,3
	dw 1190
	text_far _PoliwrathDexEntry
	text_end

WeedleDexEntry:
	db "INSECTOPIC@"
	db 1,0
	dw 70
	text_far _WeedleDexEntry
	text_end

KakunaDexEntry:
	db "COCON@"
	db 2,0
	dw 220
	text_far _KakunaDexEntry
	text_end

BeedrillDexEntry:
	db "GUEPOISON@"
	db 3,3
	dw 650
	text_far _BeedrillDexEntry
	text_end

DodrioDexEntry:
	db "TROISEAU@"
	db 5,11
	dw 1880
	text_far _DodrioDexEntry
	text_end

PrimeapeDexEntry:
	db "PORSINGE@"
	db 3,3
	dw 710
	text_far _PrimeapeDexEntry
	text_end

DugtrioDexEntry:
	db "TAUPE@"
	db 2,4
	dw 730
	text_far _DugtrioDexEntry
	text_end

VenomothDexEntry:
	db "MITE@"
	db 4,11
	dw 280
	text_far _VenomothDexEntry
	text_end

DewgongDexEntry:
	db "OTARIE@"
	db 5,7
	dw 2650
	text_far _DewgongDexEntry
	text_end

CaterpieDexEntry:
	db "VER@"
	db 1,0
	dw 60
	text_far _CaterpieDexEntry
	text_end

MetapodDexEntry:
	db "COCON@"
	db 2,4
	dw 220
	text_far _MetapodDexEntry
	text_end

ButterfreeDexEntry:
	db "PAPILLON@"
	db 3,7
	dw 710
	text_far _ButterfreeDexEntry
	text_end

MachampDexEntry:
	db "COLOSSE@"
	db 5,3
	dw 2870
	text_far _MachampDexEntry
	text_end

GolduckDexEntry:
	db "CANARD@"
	db 5,7
	dw 1690
	text_far _GolduckDexEntry
	text_end

HypnoDexEntry:
	db "HYPNOSE@"
	db 5,3
	dw 1670
	text_far _HypnoDexEntry
	text_end

GolbatDexEntry:
	db "CHOVSOURIS@"
	db 5,3
	dw 1210
	text_far _GolbatDexEntry
	text_end

MewtwoDexEntry:
	db "GENETIQUE@"
	db 6,7
	dw 2690
	text_far _MewtwoDexEntry
	text_end

SnorlaxDexEntry:
	db "PIONCEUR@"
	db 6,11
	dw 10140
	text_far _SnorlaxDexEntry
	text_end

MagikarpDexEntry:
	db "POISSON@"
	db 2,11
	dw 220
	text_far _MagikarpDexEntry
	text_end

MukDexEntry:
	db "DEGUEU@"
	db 3,11
	dw 660
	text_far _MukDexEntry
	text_end

KinglerDexEntry:
	db "POIGNEUR@"
	db 4,3
	dw 1320
	text_far _KinglerDexEntry
	text_end

CloysterDexEntry:
	db "BIVALVE@"
	db 4,11
	dw 2920
	text_far _CloysterDexEntry
	text_end

ElectrodeDexEntry:
	db "BALLE@"
	db 3,11
	dw 1470
	text_far _ElectrodeDexEntry
	text_end

ClefableDexEntry:
	db "FEE@"
	db 4,3
	dw 880
	text_far _ClefableDexEntry
	text_end

WeezingDexEntry:
	db "GAZ MORTEL@"
	db 3,11
	dw 210
	text_far _WeezingDexEntry
	text_end

PersianDexEntry:
	db "CHADEVILLE@"
	db 3,3
	dw 710
	text_far _PersianDexEntry
	text_end

MarowakDexEntry:
	db "GARD'OS@"
	db 3,3
	dw 990
	text_far _MarowakDexEntry
	text_end

HaunterDexEntry:
	db "GAZ@"
	db 5,3
	dw 2
	text_far _HaunterDexEntry
	text_end

AbraDexEntry:
	db "PSY@"
	db 2,11
	dw 430
	text_far _AbraDexEntry
	text_end

AlakazamDexEntry:
	db "PSY@"
	db 4,11
	dw 1060
	text_far _AlakazamDexEntry
	text_end

PidgeottoDexEntry:
	db "OISEAU@"
	db 3,7
	dw 660
	text_far _PidgeottoDexEntry
	text_end

PidgeotDexEntry:
	db "OISEAU@"
	db 4,11
	dw 870
	text_far _PidgeotDexEntry
	text_end

StarmieDexEntry:
	db "MYSTERIEUX@"
	db 3,7
	dw 1760
	text_far _StarmieDexEntry
	text_end

BulbasaurDexEntry:
	db "GRAINE@"
	db 2,4
	dw 150
	text_far _BulbasaurDexEntry
	text_end

VenusaurDexEntry:
	db "GRAINE@"
	db 6,7
	dw 2210
	text_far _VenusaurDexEntry
	text_end

TentacruelDexEntry:
	db "MOLLUSQUE@"
	db 5,3
	dw 1210
	text_far _TentacruelDexEntry
	text_end

GoldeenDexEntry:
	db "POISSON@"
	db 2,0
	dw 330
	text_far _GoldeenDexEntry
	text_end

SeakingDexEntry:
	db "POISSON@"
	db 4,3
	dw 860
	text_far _SeakingDexEntry
	text_end

PonytaDexEntry:
	db "CHEVAL FEU@"
	db 3,3
	dw 660
	text_far _PonytaDexEntry
	text_end

RapidashDexEntry:
	db "CHEVAL FEU@"
	db 5,7
	dw 2090
	text_far _RapidashDexEntry
	text_end

RattataDexEntry:
	db "RAT@"
	db 1,0
	dw 80
	text_far _RattataDexEntry
	text_end

RaticateDexEntry:
	db "RAT@"
	db 2,4
	dw 410
	text_far _RaticateDexEntry
	text_end

NidorinoDexEntry:
	db "VENEPIC@"
	db 2,11
	dw 430
	text_far _NidorinoDexEntry
	text_end

NidorinaDexEntry:
	db "VENEPIC@"
	db 2,7
	dw 440
	text_far _NidorinaDexEntry
	text_end

GeodudeDexEntry:
	db "ROCHE@"
	db 1,4
	dw 440
	text_far _GeodudeDexEntry
	text_end

PorygonDexEntry:
	db "VIRTUEL@"
	db 2,7
	dw 800
	text_far _PorygonDexEntry
	text_end

AerodactylDexEntry:
	db "FOSSILE@"
	db 5,11
	dw 1300
	text_far _AerodactylDexEntry
	text_end

MagnemiteDexEntry:
	db "MAGNETIQUE@"
	db 1,0
	dw 130
	text_far _MagnemiteDexEntry
	text_end

CharmanderDexEntry:
	db "LEZARD@"
	db 2,0
	dw 190
	text_far _CharmanderDexEntry
	text_end

SquirtleDexEntry:
	db "MINITORTUE@"
	db 1,8
	dw 200
	text_far _SquirtleDexEntry
	text_end

CharmeleonDexEntry:
	db "FLAMME@"
	db 3,7
	dw 420
	text_far _CharmeleonDexEntry
	text_end

WartortleDexEntry:
	db "TORTUE@"
	db 3,3
	dw 500
	text_far _WartortleDexEntry
	text_end

CharizardDexEntry:
	db "FLAMME@"
	db 5,7
	dw 2000
	text_far _CharizardDexEntry
	text_end

OddishDexEntry:
	db "RACINE@"
	db 1,8
	dw 120
	text_far _OddishDexEntry
	text_end

GloomDexEntry:
	db "RACINE@"
	db 2,7
	dw 190
	text_far _GloomDexEntry
	text_end

VileplumeDexEntry:
	db "FLEUR@"
	db 3,11
	dw 410
	text_far _VileplumeDexEntry
	text_end

BellsproutDexEntry:
	db "FLEUR@"
	db 2,4
	dw 90
	text_far _BellsproutDexEntry
	text_end

WeepinbellDexEntry:
	db "CARNIVORE@"
	db 3,3
	dw 140
	text_far _WeepinbellDexEntry
	text_end

VictreebelDexEntry:
	db "CARNIVORE@"
	db 5,7
	dw 340
	text_far _VictreebelDexEntry
	text_end

;MissingNoDexEntry:
;	db "???@"
;	db 10 ; 1.0 m
;	dw 100 ; 10.0 kg
;	db "コメント　さくせいちゅう@" ; コメント作成中 (Comment to be written)
