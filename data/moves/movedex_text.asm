; PureRGBnote: ADDED: text pointers for the descriptions that show up in the movedex.

_PoundDexEntry::
	text "Frappe l'ennemi"
	next "avec patte, queue"
	next "ou main."
	; fall through
_GenericNoAdditionalEffectText::
	bage "Aucun effet"
	next "additionnel"
	dex

_KarateChopDexEntry::
	text "Coup d'art martial"
	next "vertical avec la"
	next "main ou la patte."
	; fall through
_GenericOftenLandsCriticalHitsText::
	bage "Donne souvent des"
	next "coups critiques"
	dex

_DoubleslapDexEntry::
	text "Gifle <opponent>"
	next "à répétition avec"
	next "les deux mains."

	bage "Puissance double"
	next "si ennemi endormi"
	next "mais le réveille."
	; fall through
_Generic2To5HitsText::
	bage "Frappe 2-5 fois"
	next "de suite."
	next "2 coups → 37.5%"

	bage "3 coups → 37.5%"
	next "4 coups → 12.5%"
	next "5 coups → 12.5%@"
	text_end

_CometPunchDexEntry::
	text "Un coup de poing"
	next "à la vitesse de"
	next "l'éclair."
	; fall through
_GenericAlwaysGoesFirstText::
	bage "Agit toujours"
	next "en premier"
	dex

_MegaPunchDexEntry::
	text "Coup de poing"
	next "titanesque pouvant"
	next "apeurer <opponent>.@"
	text_call _Generic10PercentFlinchText
	bage "Chance d'apeurer"
	next "à 30% si lancé par"
	next "un type FIGHTING"
	dex

_PayDayDexEntry::
	text "Lance des pièces"
	next "sur l'ennemi."
	next "Ramasser les"

	bage "pièces après le"
	next "combat rapporte"
	next "un peu d'argent"
	dex

_FirePunchDexEntry::
	text "Frappe l'ennemi"
	next "avec un poing"
	next "enflammé."
	; fall through
_Generic10PercentBurnText::
	bage "10% de chances de"
	next "brûler l'ennemi"
	dex

_IcePunchDexEntry::
	text "Frappe l'ennemi"
	next "avec un poing"
	next "givré."

	bage "10% de chances de"
	next "geler l'ennemi"
	next "complètement"
	dex

_ThunderPunchDexEntry::
	text "Frappe l'ennemi"
	next "avec un poing"
	next "électrique."
	; fall through
_Generic10PercentParalysisText::
	bage "10% de chances de"
	next "paralyser"
	next "<opponent>"
	dex

_ScratchDexEntry::
	text "Griffe l'ennemi"
	next "avec des griffes"
	next "ou piquants.@"

	text_jump _GenericNoAdditionalEffectText

_VicegripDexEntry::
	text "Ecrase l'ennemi"
	next "entre griffes,"
	next "mains ou crocs."
	; fall through
_Generic30PercentParalysisText::
	bage "30% de chances de"
	next "paralyser"
	next "<opponent>"
	dex

_GuillotineDexEntry::
	text "Des pinces géantes"
	next "écrasent <opponent>"
	next "avec violence."
	; fall through
_GenericOHKOText::
	bage "Met toujours KO"
	next "<opponent>, mais"
	next "rate souvent."

	bage "Echoue si"
	next "<opponent> a un"
	next "SPEED plus élevé"
	dex

_RazorWindDexEntry::
	text "<user> atterrit"
	next "du vol et se"
	next "repose."
	; fall through
_GenericHealsHalfText::
	bage "Soigne 50% des HP"
	next "max de <user>"
	dex

_SwordsDanceDexEntry::
	text "Une danse effrénée"
	next "pour augmenter la"
	next "combativité."

	bage "Augmente beaucoup"
	next "l'ATTACK de <user>."
	next "(+2 ATTACK)"
	dex

_CutDexEntry::
	text "Tranche l'ennemi"
	next "avec griffe, dent"
	next "aile, etc.@"

	text_call _GenericNoAdditionalEffectText

	bage "Utilisable hors"
	next "combat pour couper"
	next "les arbustes et"
	
	bage "les zones de"
	next "hautes herbes"
	dex

_GustDexEntry::
	text "Soulève un vent"
	next "violent vers"
	next "<opponent>.@"

	text_jump _GenericNoAdditionalEffectText

_WingAttackDexEntry::
	text "Frappe et gifle"
	next "l'ennemi avec les"
	next "ailes.@"

	text_jump _GenericAlwaysGoesFirstText

_WhirlwindDexEntry::
	text "Une tornade"
	next "massive est lancée"
	next "sur l'ennemi."
	; fall through
_Generic30PercentConfusionText::
	bage "Cause la confusion"
	next "30% du temps"
	dex

_FlyDexEntry::
	text "Le #MON s'envole"
	next "haut et pique sur"
	next "l'ennemi."

	bage "Evite la plupart"
	next "des attaques en"
	next "plein vol."

	bage "Utilisable hors"
	next "combat pour voler"
	next "ailleurs"
	dex

_BindDexEntry::
	text "Piège l'ennemi"
	next "dans une prise"
	next "de fer.@"

	text_jump _GenericTrappingMoveText

_SlamDexEntry::
	text "Frappe l'ennemi"
	next "avec queue, patte"
	next "bras, etc."

	bage "Puissance monte à"
	next "130 si l'ennemi"
	next "est empoisonné"
	dex


_VineWhipDexEntry::
	text "Fouette l'ennemi"
	next "avec une liane"
	next "végétale.@"

	text_jump _GenericNoAdditionalEffectText

_StompDexEntry::
	text "Piétine l'ennemi"
	next "avec pieds/sabots."
	; fall through
_Generic30PercentFlinchText::
	bage "Apeure <opponent>"
	next "30% du temps"
	dex

_DoubleKickDexEntry::
	text "Donne deux coups"
	next "de pied en rapide"
	next "succession."
	; fall through
_GenericHitsTwiceText::
	bage "Frappe deux fois"
	dex

_MegaKickDexEntry::
	text "Coup de pied géant"
	next "avec les deux"
	next "jambes et un gros"

	bage "poids derrière.@"

	text_jump _GenericNoAdditionalEffectText

_JumpKickDexEntry::
	text "Saute en l'air"
	next "pour donner un"
	next "gros coup de pied."
	; fall through
_GenericKeptGoingCrashedText::
	bage "Blesse <user>"
	next "si raté."

	bage "25% des dégâts"
	next "qu'il aurait fait"
	next "à l'ennemi"
	dex

_RollingKickDexEntry::
	text "Roule comme une"
	next "pierre pour un"
	next "coup de pied dur.@"

	text_jump _Generic30PercentFlinchText

_SandAttackDexEntry::
	text "Aveugle l'ennemi"
	next "avec une giclée"
	next "de sable.@"

	text_call _GenericLowerAccuracyText

	bage "Les GROUND vivent"
	next "dans la terre, non"
	next "affectés."

	bage "Les #MON FLYING"
	next "ont les yeux vifs"
	next "non affectés aussi"
	dex
	; fall through
_GenericLowerAccuracyText::
	bage "Baisse la ACCURACY"
	next "de l'ennemi."
	next "(-1 ACCURACY)"
	dex

_HeadbuttDexEntry::
	text "Fonce sur l'ennemi"
	next "avec la grosse"
	next "tête de <user>.@"

	text_jump _Generic30PercentFlinchText

_HornAttackDexEntry::
	text "Pique l'ennemi"
	next "d'une corne dure.@"

	text_jump _GenericNoAdditionalEffectText

_FuryAttackDexEntry::
	text "Pique l'ennemi"
	next "avec bec ou corne"
	next "avec fureur.@"

	text_jump _GenericHitsTwiceText

_HornDrillDexEntry::
	text "Perce l'ennemi"
	next "avec une corne"
	next "très tranchante.@"

	text_jump _GenericOHKOText

_TackleDexEntry::
	text "Charge l'ennemi"
	next "avec un placage"
	next "de tout le corps.@"

	text_jump _GenericNoAdditionalEffectText

_BodySlamDexEntry::
	text "Tout le poids de"
	next "<user> est jeté"
	next "sur l'ennemi.@"

	text_jump _Generic30PercentParalysisText

_WrapDexEntry::
	text "Enroule l'ennemi"
	next "avec un long"
	next "appendice/corps."
	; fall through
_GenericTrappingMoveText::
	bage "L'ennemi ne peut"
	next "plus bouger pour"
	next "2-3 tours"
	dex

_TakeDownDexEntry::
	text "Charge l'ennemi"
	next "tout en étant en"
	next "flammes."

	bage "30% de chances de"
	next "brûler l'ennemi."

	bage "Si lancé par un"
	next "type FIRE #MON,"

	bage "aussi 40% de"
	next "chances de monter"
	next "SPECIAL de 1"
	dex

_ThrashDexEntry::
	text "Se déchaîne en"
	next "frappant tout ce"
	next "qui est proche."
	; fall through
_GenericThrashEffectText::
	bage "Dure 2-3 tours."
	next "Cause la confusion"
	next "à <user> après"
	dex

_DoubleEdgeDexEntry::
	text "Un placage risqué"
	next "qui blesse aussi"
	next "<user>."
	; fall through
_Generic25PercentRecoilText::
	bage "Le lanceur prend"
	next "25% des dégâts en"
	next "recul"
	dex

_TailWhipDexEntry::
	text "<user> agite sa"
	next "queue mignonnement"
	next "pour tromper"

	bage "l'ennemi et lui"
	next "baisser sa garde."
	; fall through
_GenericLowersDefense1StageText::
	bage "Baisse la DEFENSE"
	next "de l'ennemi."
	next "(-1 DEFENSE)"
	dex

_PoisonStingDexEntry::
	text "Pique l'ennemi"
	next "avec un petit dard"
	next "empoisonné."
	; fall through
_Generic40PercentPoisonText::
	bage "40% de chances"
	next "d'empoisonner"
	next "l'ennemi"
	dex

_TwineedleDexEntry::
	text "Pique l'ennemi"
	next "avec deux dards,"
	next "becs ou griffes.@"

	text_call _GenericHitsTwiceText
	; fall through
_Generic20PercentPoisonText::
	bage "20% de chances"
	next "d'empoisonner"
	next "l'ennemi"
	dex

_PinMissileDexEntry::
	text "Un barrage rapide"
	next "d'épines pilonne"
	next "l'ennemi.@"
	
	text_jump _Generic2To5HitsText

_LeerDexEntry::
	text "<user> fixe"
	next "l'ennemi d'un air"
	next "menaçant.@"

	text_jump _GenericLowersDefense1StageText

_BiteDexEntry::
	text "Mord l'ennemi"
	next "avec des crocs"
	next "acérés."
	; fall through
_Generic10PercentFlinchText::
	bage "Apeure <opponent>"
	next "10% du temps"
	dex

_GrowlDexEntry::
	text "Grogne gentiment,"
	next "rendant l'ennemi"
	next "moins vigilant."

	bage "Baisse l'ATTACK de"
	next "<opponent>."
	next "(-1 ATTACK)"
	dex

_RoarDexEntry::
	text "Un rugissement"
	next "effrayant qui fait"
	next "mal aux oreilles."
	; fall through
_Generic33PercentLowerAttackText::
	bage "33% de chances de"
	next "baisser l'ATTACK."
	next "(-1 ATTACK)"
	dex

_SingDexEntry::
	text "Un chant apaisant"
	next "plonge l'ennemi"
	next "dans un sommeil."
	; fall through
_GenericPutsFoeAsleepText::
	bage "Endort l'ennemi"
	next "si ça fonctionne"
	dex

_SupersonicDexEntry::
	text "Des ondes à haute"
	next "fréquence peuvent"
	next "rendre confus."

	bage "Cause la confusion"
	next "si ça fonctionne"
	dex

_SonicboomDexEntry::
	text "Un puissant bang"
	next "sonique crée une"
	next "onde de choc."

	bage "Agit en premier."
	next "Si c'est le 1er"
	next "tour de <user>"

	bage "en combat, cette"
	next "attaque fait"
	next "apeurer l'ennemi"
	dex

_DisableDexEntry::
	text "<user> désactive"
	next "mentalement une"
	next "attaque ennemie."

	bage "Désactive la"
	next "dernière attaque"
	next "pour 2-8 tours,"

	bage "ou une attaque au"
	next "hasard si l'ennemi"
	next "n'a rien utilisé"
	dex

_AcidDexEntry::
	text "Un jet d'acide"
	next "est lancé sur"
	next "<opponent>."

	bage "Baisse toujours"
	next "l'ATTACK ou la"
	next "DEFENSE ennemie"
	dex

_EmberDexEntry::
	text "Des étincelles"
	next "enflamment et"
	next "brûlent l'ennemi.@"

	text_jump _Generic10PercentBurnText

_FlamethrowerDexEntry::
	text "Un jet de flammes"
	next "brûlantes est tiré"
	next "sur <opponent>."

	bage "Une attaque FIRE"
	next "célèbre et aimée"
	next "pour sa force.@"

	text_jump _Generic10PercentBurnText

_MistDexEntry::
	text "<user> libère une"
	next "brume blanche et"
	next "scintillante de"

	bage "cristaux de glace,"
	next "l'enveloppant de"
	next "vapeur éthérée."

	bage "<user> devient"
	next "éthéré; immunisé"
	next "contre NORMAL et"

	bage "les attaques"
	next "FIGHTING jusqu'au"
	next "remplacement."

	bage "Empêche les STAT"
	next "de baisser par"
	next "des attaques comme"

	bage "GROWL, SCREECH"
	next "SMOKESCREEN, etc."
	next "également"
	dex

_WaterGunDexEntry::
	text "Tire un petit jet"
	next "d'eau pressurisé"
	next "sur l'ennemi.@"

	text_jump _GenericNoAdditionalEffectText

_HydroPumpDexEntry::
	text "Une énorme colonne"
	next "d'eau pressurisée"
	next "est projetée sur"

	bage "<opponent>.@"

	text_jump _GenericNoAdditionalEffectText


_SurfDexEntry::
	text "Toute la zone est"
	next "inondée d'eau"
	next "profonde.@"

	text_call _GenericNoAdditionalEffectText

	bage "Utilisable hors"
	next "combat pour nager"
	next "sur l'eau"
	dex

_IceBeamDexEntry::
	text "Un rayon glacial"
	next "de glace est tiré"
	next "sur"

	bage "<opponent>."
	next "10% de chances de"
	next "geler l'ennemi"
	dex

_BlizzardDexEntry::
	text "<user> déchaîne"
	next "une tempête"
	next "hivernale qui"

	bage "frappe l'ennemi."
	next "10% de chances de"
	next "geler l'ennemi"
	dex

_PsybeamDexEntry::
	text "Le pouvoir PSYCHIC"
	next "de <user> est"
	next "focalisé en un"

	bage "rayon étrange."
	; fall through
_Generic10PercentConfusionText::
	bage "Cause la confusion"
	next "10% du temps"
	dex

_BubblebeamDexEntry::
	text "Un jet de bulles"
	next "est tiré sur"
	next "l'ennemi."
	; fall through
_Generic33PercentLowerSpeedText::
	bage "33% de chances de"
	next "baisser le SPEED."
	next "(-1 SPEED)"
	dex

_AuroraBeamDexEntry::
	text "Un beau rayon"
	next "multicolore est"
	next "tiré sur"

	bage "<opponent>.@"

	text_jump _Generic33PercentLowerAttackText

_HyperBeamDexEntry::
	text "Un rayon puissant;"
	next "l'essence pure de"
	next "la destruction"

	bage "est tirée avec"
	next "puissance sur"
	next "l'ennemi."

	bage "Après usage,"
	next "<user> se repose"
	next "le tour suivant."

	bage "Si <opponent>"
	next "tombe KO, pas"
	next "besoin de repos"
	dex

_PeckDexEntry::
	text "<user> picore"
	next "l'ennemi avec un"
	next "bec ou une corne.@"

	text_jump _GenericNoAdditionalEffectText

_DrillPeckDexEntry::
	text "Attaque rotative"
	next "de pic perçant"
	next "avec bec/corne.@"

	text_jump _Generic30PercentFlinchText

_SubmissionDexEntry::
	text "<user> met"
	next "l'ennemi dans une"
	next "prise de lutte"

	bage "donnant un gros"
	next "avantage à"
	next "<user>."
	; fall through
_GenericRaisesAttack1StageText::
	bage "Augmente l'ATTACK"
	next "de <user>."
	next "(+1 ATTACK)"
	dex

_LowKickDexEntry::
	text "Un coup de pied"
	next "balayant pouvant"
	next "faire trébucher.@"

	text_jump _Generic30PercentFlinchText

_CounterDexEntry::
	text "Une technique de"
	next "combat secrète qui"
	next "draine l'énergie"

	bage "de l'esprit de"
	next "combat ennemi."
	; fall through
_GenericAbsorbMoveText::
	bage "Restaure 50% des"
	next "dégâts infligés"
	next "en HP à <user>"
	dex

_SeismicTossDexEntry::
	text "<user> suplexe"
	next "l'ennemi dans un"
	next "spectaculaire"

	bage "lancer aérien aidé"
	next "par la gravité."

	bage "Inflige des dégâts"
	next "égaux au niveau"
	next "de <user>"
	dex

_StrengthDexEntry::
	text "Frappe l'ennemi"
	next "avec une puissance"
	next "accumulée.@"

	text_call _GenericNoAdditionalEffectText

	bage "Utilisable hors"
	next "combat: pousse les"
	next "objets lourds"
	dex

_AbsorbDexEntry::
	text "Draine l'énergie"
	next "de l'ennemi.@"

	text_jump _GenericAbsorbMoveText

_MegaDrainDexEntry::
	text "Draine rapidement"
	next "beaucoup d'énergie"
	next "de l'ennemi.@"

	text_jump _GenericAbsorbMoveText

_LeechSeedDexEntry::
	text "Lance des graines"
	next "qui germent et"
	next "drainent énergie."

	bage "Vole des HP à"
	next "<opponent> chaque"
	next "tour."

	bage "Restaure 50% des"
	next "dégâts infligés"
	next "en HP à <user>."

	bage "Graines restent"
	next "jusqu'au KO ou"
	next "changement."

	bage "Dégâts augmentent"
	next "si l'ennemi est"
	next "faible au GRASS."

	bage "RESIST: 1/16 HP"
	next "NORMAL:  1/8 HP"
	next "WEAK:   3/16 HP"

	bage "Ne marche pas sur"
	next "les #MON de type"
	next "GRASS"
	dex

_GrowthDexEntry::
	text "<user> grandit"
	next "ou soigne son"
	next "corps,"

	bage "souvent par"
	next "photosynthèse."

	bage "Soigne 33% des HP"
	next "max et augmente"
	next "SPECIAL. (+1)"

	bage "Ne fait rien si"
	next "HP sont au max"
	dex

_RazorLeafDexEntry::
	text "Une pluie de"
	next "feuilles acérées"
	next "sur l'ennemi.@"

	text_jump _GenericOftenLandsCriticalHitsText

_SolarbeamDexEntry::
	text "Concentre le"
	next "soleil en un rayon"
	next "brûlant puissant.@"

	text_jump _Generic10PercentBurnText

_PoisonPowderDexEntry::
	text "Un nuage de poudre"
	next "toxique se répand"
	next "sur l'ennemi."

	bage "Empoisonne si"
	next "ça fonctionne."

	bage "Ne marche pas sur"
	next "les #MON de type"
	next "POISON"
	dex

_StunSporeDexEntry::
	text "Un nuage de spores"
	next "engourdissantes"
	next "sur l'ennemi."

	bage "Paralyse l'ennemi"
	next "si ça fonctionne"
	dex

_SleepPowderDexEntry::
	text "Un gros nuage de"
	next "poudre soporifique"
	next "se répand.@"

	text_jump _GenericPutsFoeAsleepText


_PetalDanceDexEntry::
	text "Le <user> attaque"
	next "en dispersant des"
	next "pétales partout."

	bage "Il reste alors"
	next "obsédé par cette"
	next "danse fleurie.@"

	text_jump _GenericThrashEffectText

_StringShotDexEntry::
	text "Tire des cordes"
	next "de soie épaisse"
	next "sur l'ennemi."

	bage "Baisse le SPEED"
	next "de l'ennemi."
	next "(-1 SPEED)"
	dex

_DragonRageDexEntry::
	text "L'ennemi est"
	next "frappé par une"
	next "rage draconique.@"

	text_jump _GenericNoAdditionalEffectText

_FireSpinDexEntry::
	text "Un tourbillon de"
	next "feu entoure"
	next "l'<opponent>.@"

	text_jump _GenericTrappingMoveText

_ThundershockDexEntry::
	text "Une attaque"
	next "électrique de"
	next "base.@"

	text_jump _Generic10PercentParalysisText

_ThunderboltDexEntry::
	text "Libère plus de"
	next "100 000 volts"
	next "d'électricité."

	bage "Très populaire"
	next "grâce à sa puis-"
	next "sance et éclat.@"

	text_jump _Generic10PercentParalysisText

_ThunderWaveDexEntry::
	text "Emet une onde"
	next "électromagnétique"
	next "qui paralyse"

	bage "rapidement"
	next "l'<opponent>."

	bage "Utile grâce à sa"
	next "grande précision"
	dex

_ThunderDexEntry::
	text "Un orage se forme"
	next "et un éclair"
	next "titanesque"

	bage "s'abat sur"
	next "l'ennemi.@"

	text_jump _Generic10PercentParalysisText

_RockThrowDexEntry::
	text "Des rochers sont"
	next "lancés sur"
	next "l'ennemi.@"

	text_jump _GenericNoAdditionalEffectText

_EarthquakeDexEntry::
	text "Le <user> déclenche"
	next "un puissant"
	next "séisme."

	bage "Les dresseurs le"
	next "surnomment le"
	next "“Vieux Fidèle”@"

	text_jump _GenericNoAdditionalEffectText

_FissureDexEntry::
	text "Le <user> crée une"
	next "large fissure"
	next "dans la terre"

	bage "qui engloutit"
	next "l'ennemi.@"

	text_jump _GenericOHKOText

_DigDexEntry::
	text "Creuse sous terre"
	next "pendant 1 tour,"
	next "puis émerge"

	bage "pour frapper"
	next "l'ennemi."

	bage "Sous terre, le"
	next "<user> ne peut pas"
	next "être touché."

	bage "Utilisable hors"
	next "combat pour"
	next "sortir des caves"
	dex

_ToxicDexEntry::
	text "Du poison est"
	next "vaporisé en"
	next "grande quantité."

	bage "Empoisonne grave-"
	next "ment l'ennemi."

	bage "Les dégâts du"
	next "poison augmentent"
	next "à chaque tour."

	bage "Précision de 100%"
	next "si utilisé par un"
	next "#MON POISON"
	dex

_ConfusionDexEntry::
	text "Utilise le pouvoir"
	next "psychique pour"
	next "troubler l'esprit@"

	text_jump _Generic10PercentConfusionText

_PsychicDexEntry::
	text "Un pouvoir de"
	next "télékinésie est"
	next "lâché sur l'ennemi"

	bage "Peu d'ennemis"
	next "résistent à ce"
	next "coup PSYCHIC.@"

	text_jump _Generic33PercentLowerSpecialText

_HypnosisDexEntry::
	text "L'ennemi est"
	next "hypnotisé dans un"
	next "profond sommeil.@"

	text_jump _GenericPutsFoeAsleepText

_MeditateDexEntry::
	text "Prenant une pose"
	next "de méditation"
	next "profonde,"

	bage "le <user> se"
	next "détend, augmentant"
	next "ses capacités."

	bage "Augmente ATTACK,"
	next "SPECIAL et"
	next "SPEED. (+1 chaque)"
	dex

_AgilityDexEntry::
	text "Un afflux"
	next "d'adrénaline"
	next "entre dans le <user>"

	bage "lui permettant de"
	next "se déplacer à une"
	next "vitesse extrême."

	bage "Augmente beaucoup"
	next "le SPEED du <user>."
	next "(+2 SPEED)"
	dex

_QuickAttackDexEntry::
	text "Une attaque"
	next "fulgurante.@"

	text_jump _GenericAlwaysGoesFirstText

_RageDexEntry::
	text "Le <user> libère sa"
	next "colère refoulée"
	next "sur l'ennemi.@"

	text_jump _GenericRaisesAttack1StageText

_TeleportDexEntry::
	text "Le <user> se"
	next "téléporte hors"
	next "du combat."

	bage "Les #MON sauvages"
	next "peuvent fuir le"
	next "combat avec."

	bage "En combat dresseur"
	next "le <user> échange"
	next "et soigne 25% HP."

	bage "Echoue s'il n'y a"
	next "plus de #MON pour"
	next "l'échange."

	bage "Utilisable hors"
	next "combat pour aller"
	next "au dernier"

	bage "#MON CENTER"
	dex

_NightShadeDexEntry::
	text "Une obscurité"
	next "envahit l'ennemi,"
	next "l'effrayant.@"

	text_jump _GenericNoAdditionalEffectText

_MimicDexEntry::
	text "Le <user> imite un"
	next "des coups de"
	next "l'ennemi."

	bage "Le coup peut être"
	next "choisi et est"
	next "appris pour le"

	bage "reste du"
	next "combat."

	bage "Il est utilisé"
	next "juste après être"
	next "imité"
	dex

_ScreechDexEntry::
	text "Un cri strident"
	next "est émis par"
	next "le <user>."

	bage "Baisse beaucoup"
	next "la DEFENSE."
	next "(-2 DEFENSE)"

	bage "Ce cri étrange"
	next "résonne pour le"
	next "reste du combat."

	bage "Ces échos"
	next "réveillent tous"
	next "les #MON endormis"

	bage "Ce coup est auto-"
	next "utilisé si le"
	next "<user> s'endort."

	bage "Ne rate jamais"
	dex

_DoubleTeamDexEntry::
	text "Le <user> crée des"
	next "clones de lui"
	next "pour réduire les"

	bage "chances d'être"
	next "touché et tromper"
	next "l'ennemi."
	; fall through
_GenericRaisesEvasion1StageText::	
	bage "Augmente EVASION"
	next "du <user>."
	next "(+1 EVASION)"
	dex

_RecoverDexEntry::
	text "Régénère les"
	next "cellules pour"
	next "soigner le <user>.@"

	text_jump _GenericHealsHalfText

_HardenDexEntry::
	text "L'extérieur du"
	next "<user> devient plus"
	next "dur."

	bage "Augmente DEFENSE"
	next "du <user>."
	next "(+1 DEFENSE)"
	dex

_MinimizeDexEntry::
	text "Le <user> rétrécit"
	next "à une taille mini"
	next "pour esquiver.@"

	text_jump _GenericRaisesEvasion1StageText

_SmokescreenDexEntry::
	text "Fumée noire tirée"
	next "partout, aveuglant"
	next "l'ennemi.@"

	text_call _GenericLowerAccuracyText

	bage "Les types FIRE ne"
	next "sont pas affectés"
	next "par cette fumée"
	dex

_ConfuseRayDexEntry::
	text "D'étranges rayons"
	next "troublent"
	next "l'<opponent>."

	bage "Cause la confusion"
	dex

_WithdrawDexEntry::
	text "Le <user> se cache"
	next "dans sa carapace"
	next "ou abri."

	bage "Soigne 33% des HP"
	next "max et augmente"
	next "DEFENSE. (+1)"

	bage "Sans effet si les"
	next "HP sont au max"
	dex

_DefenseCurlDexEntry::
	text "Se roule en boule"
	next "pour augmenter sa"
	next "défense."

	bage "Le <user> ne subira"
	next "pas les coups"
	next "super efficaces"
	dex

_BarrierDexEntry::
	text "Une solide"
	next "barrière d'énergie"
	next "est érigée."

	bage "Augmente beaucoup"
	next "DEFENSE du <user>."
	next "(+2 DEFENSE)"
	dex

_LightScreenDexEntry::
	text "Un mur de lumière"
	next "merveilleux est"
	next "érigé par le <user>."

	bage "Réduit les dégâts"
	next "d'attaque SPECIAL"
	next "de moitié."
	; fall through
_GenericThisEffectOnlyAppliesToOriginalUser::
	bage "Cet effet ne"
	next "s'applique qu'au"
	next "<user> d'origine"
	dex

_HazeDexEntry::
	text "Une brume noire"
	next "qui perturbe les"
	next "pouvoirs psy est"

	bage "répandue."
	next "Le <user> devient"
	next "immunisé PSYCHIC"

	bage "jusqu'à ce qu'il"
	next "soit échangé."

	bage "Annule tous les"
	next "changements STAT"
	next "et la confusion."

	bage "Annule aussi:"
	next "MIST,"
	next "FOCUS ENERGY,"
	
	bage "LEECH SEED,"
	next "DISABLE, DIRE HIT"
	next "GUARD SPEC"
	dex

_ReflectDexEntry::
	text "Un mur de lumière"
	next "réfléchissant est"
	next "érigé par le <user>."

	bage "Réduit les dégâts"
	next "d'attaque physique"
	next "de moitié.@"
	text_jump _GenericThisEffectOnlyAppliesToOriginalUser

_FocusEnergyDexEntry::
	text "Le <user> inspire"
	next "profondément et"
	next "se concentre,"

	bage "renforçant son"
	next "esprit combatif"
	next "par sa volonté."

	bage "Augmente les"
	next "coups critiques"
	next "de 4×"
	dex

_BideDexEntry::
	text "Le <user> s'endurcit"
	next "en augmentant sa"
	next "force physique."

	bage "Augmente ATTACK"
	next "et DEFENSE."
	next "(+1 chaque)"
	dex

_MetronomeDexEntry::
	text "Le <user> agite"
	next "un doigt, et une"
	next "magie surnaturelle"

	bage "provoque un coup"
	next "aléatoire de"
	next "façon soudaine"
	dex

_MirrorMoveDexEntry::
	text "Utilise le dernier"
	next "coup utilisé par"
	next "un ennemi.@"

	text_call _GenericAlwaysGoesFirstText

	bage "Echoue si aucun"
	next "ennemi n'a encore"
	next "attaqué"
	dex

_SelfdestructDexEntry::
	text "Le <user> explose"
	next "dans une immense"
	next "déflagration."
	; fall through
_GenericExplodeDexEntry::
	bage "Inflige un lourd"
	next "recul au"
	next "<user>;"

	bage "moitié des dégâts"
	next "infligés. Si raté,"
	next "le <user> subit"

	bage "quand même 1/4"
	next "de ses HP max"
	next "en dégâts."

	bage "Si le <user> a"
	next "moins de 1/3 de"
	next "ses HP restants,"

	bage "l'explosion sera"
	next "extrêmement"
	next "puissante;"

	bage "puissance monte"
	next "à 500! Mais <user>"
	next "tombe toujours KO"
	dex

_EggBombDexEntry::
	text "Une bombe en forme"
	next "d'œuf est lancée"
	next "sur l'<opponent>,"

	bage "provoquant une"
	next "explosion.@"

	text_jump _GenericNoAdditionalEffectText

_LickDexEntry::
	text "Le <user> lèche"
	next "l'<opponent> avec"
	next "une longue langue@"

	text_jump _Generic10PercentParalysisText

_SmogDexEntry::
	text "Un nuage épais de"
	next "smog toxique"
	next "atteint l'ennemi.@"

	text_jump _Generic40PercentPoisonText

_SludgeDexEntry::
	text "De la boue toxique"
	next "corrosive recouvre"
	next "l'ennemi."

	bage "Son acidité fond"
	next "les surfaces"
	next "facilement.@"

	text_jump _Generic40PercentPoisonText

_BoneClubDexEntry::
	text "Un os est utilisé"
	next "pour frapper"
	next "l'<opponent>.@"

	text_jump _Generic10PercentFlinchText

_FireBlastDexEntry::
	text "Un souffle intense"
	next "de feu dévorant"
	next "engloutit"

	bage "l'<opponent>."
	next "30% de chances de"
	next "brûler l'ennemi"
	dex

_WaterfallDexEntry::
	text "Une charge"
	next "propulsée par un"
	next "torrent d'eau."

	bage "Assez puissant"
	next "pour remonter les"
	next "cascades.@"

	text_jump _Generic30PercentFlinchText

_ClampDexEntry::
	text "Pince l'ennemi"
	next "avec une coquille,"
	next "des mâchoires,"

	bage "ou un puissant"
	next "magnétisme.@"

	text_jump _GenericTrappingMoveText


_SwiftDexEntry::
	text "Des rayons en"
	next "forme d'étoile"
	next "frappent l'ennemi."

	bage "Surnommé"
	next "“Speed Star”"
	next "par les dresseurs."

	bage "Toujours en"
	next "premier et ne"
	next "rate jamais"
	dex

_SkullBashDexEntry::
	text "Charge comme une"
	next "fusée et percute"
	next "l'ennemi avec un"

	bage "crâne très dur.@"

	text_call _GenericKeptGoingCrashedText
	
	bage "Précision de 100%"
	next "si utilisé par un"
	next "#MON ROCK"
	dex

_SpikeCannonDexEntry::
	text "Des pointes dures"
	next "sont tirées à"
	next "grande vitesse."

	bage "Frappe 2 ou 3 fois"
	next "50% de chances"
	next "pour chaque"
	dex

_ConstrictDexEntry::
	text "L'<opponent> est"
	next "piégé par une"
	next "queue ou vrille,"

	bage "siphonnant"
	next "l'énergie de"
	next "l'ennemi."

	bage "Soigne le statut"
	next "anormal du <user>,"

	bage "ou celui d'un"
	next "allié si le <user>"
	next "n'en a pas"
	dex

_AmnesiaDexEntry::
	text "Le <user> vide son"
	next "esprit pour"
	next "oublier ses soucis"

	bage "Augmente beaucoup"
	next "le SPECIAL du <user>"
	next "(+2 SPECIAL)"
	dex

_KinesisDexEntry::
	text "Un mur de feu"
	next "brûle l'ennemi."

	bage "Cause brûlure si"
	next "touché. Ne brûle"
	next "pas les FIRE."

	bage "Chaque fois que le"
	next "coup touche un"
	next "ennemi brûlé, le"

	bage "mur grandit; puis-"
	next "sance monte de 30"
	next "pts par coup,"

	bage "max 80 puissance."
	next "Si le <user> est au"
	next "moins niveau 50,"

	bage "puissance monte de"
	next "60 pts par coup,"
	next "max 140 puissance"
	dex

_SoftboiledDexEntry::
	text "Un œuf délicieux"
	next "soigne le <user>."

	bage "Soigne la moitié"
	next "des HP max du <user>"

	bage "Utilisable hors"
	next "combat pour"
	next "soigner les #MON"
	dex

_HiJumpKickDexEntry::
	text "Le <user> saute"
	next "très haut pour"
	next "asséner un"

	bage "hyper-coup de"
	next "pied dévastateur.@"

	text_jump _GenericKeptGoingCrashedText

_GlareDexEntry::
	text "L'<opponent> est"
	next "fasciné par des"
	next "yeux terrifiants,"

	bage "l'effrayant au"
	next "point de ne plus"
	next "pouvoir bouger."

	bage "Paralyse"
	next "l'<opponent>"
	dex

_DreamEaterDexEntry::
	text "Dévore les rêves"
	next "d'un ennemi"
	next "endormi pour HP."

	bage "Ne fonctionne que"
	next "si l'<opponent> est"
	next "endormi.@"

	text_jump _GenericAbsorbMoveText

_PoisonGasDexEntry::
	text "Libère un nuage"
	next "de gaz corrosif"
	next "et étouffant."

	bage "Fait souvent des"
	next "coups critiques.@"

	text_jump _Generic20PercentPoisonText

_BarrageDexEntry::
	text "Lance des orbes"
	next "d'énergie étrange"
	next "sur l'ennemi."

	bage "L'origine de ces"
	next "orbes spectraux"
	next "est inconnue.@"

	text_jump _GenericHitsTwiceText

_LeechLifeDexEntry::
	text "Mord et aspire"
	next "l'énergie vitale"
	next "de l'ennemi.@"

	text_jump _GenericAbsorbMoveText

_LovelyKissDexEntry::
	text "Un baiser magique"
	next "est donné à"
	next "l'ennemi, le"

	bage "plongeant dans un"
	next "profond sommeil"
	dex

_SkyAttackDexEntry::
	text "Attaque à vitesse"
	next "supersonique où"
	next "le <user> s'envole"

	bage "dans la"
	next "stratosphère en"
	next "un éclair pour"

	bage "le plongeon ultime"
	next "en météore.@"

	text_jump _Generic25PercentRecoilText

_TransformDexEntry::
	text "Se transforme en"
	next "le #MON"
	next "<opponent>."

	bage "Tous les stats et"
	next "coups sont copiés."
	next "(Sauf HP)"

	bage "Dure jusqu'à la"
	next "fin du combat.@"

	text_jump _GenericAlwaysGoesFirstText

_BubbleDexEntry::
	text "Souffle une bulle"
	next "qui éclate sur"
	next "l'ennemi.@"
	
	text_jump _Generic33PercentLowerSpeedText

_DizzyPunchDexEntry::
	text "Un coup de poing"
	next "rythmé qui laisse"
	next "l'ennemi sonné.@"

	text_jump _Generic30PercentConfusionText

_SporeDexEntry::
	text "Des spores de"
	next "champignon"
	next "remplissent l'air"

	bage "tranquillisant"
	next "l'<opponent>."

	bage "L'ennemi tombe"
	next "dans un sommeil"
	dex

_FlashDexEntry::
	text "Un flash"
	next "instantané aveugle"
	next "l'ennemi."

	bage "Causé souvent par"
	next "un puissant arc"
	next "électrique.@"

	text_call _GenericAlwaysGoesFirstText
	text_end
	text_jump _Generic10PercentFlinchText

_PsywaveDexEntry::
	text "Une petite onde"
	next "psychique frappe"
	next "l'<opponent>."
	; fall through
_Generic33PercentLowerSpecialText::
	bage "33% de chances de"
	next "baisser SPECIAL."
	next "(-1 SPECIAL)"
	dex

_SplashDexEntry::
	text "Le <user> s'agite"
	next "dans tous les sens"
	next "inutilement."

	bage "Aucun effet"
	dex

_AcidArmorDexEntry::
	text "Le <user> modifie"
	next "sa structure"
	next "cellulaire pour"

	bage "se liquéfier et"
	next "obtenir plus de"
	next "protection."

	bage "Réduit les dégâts"
	next "(Physical/Special)"
	next "de moitié"
	dex
	
_CrabhammerDexEntry::
	text "Le <user> martèle"
	next "sans pitié"
	next "l'<opponent> avec"

	bage "une pince, poing,"
	next "ou bord"
	next "contondant.@"

	text_jump _GenericOftenLandsCriticalHitsText

_ExplosionDexEntry::
	text "Le <user> explose"
	next "comme une bombe"
	next "géante envoyant"

	bage "des éclats à"
	next "vitesse du son.@"
	text_jump _GenericExplodeDexEntry

_FurySwipesDexEntry::
	text "Griffe l'ennemi"
	next "avec des griffes"
	next "poussiéreuses.@"

	text_jump _GenericNoAdditionalEffectText

_BonemerangDexEntry::
	text "Lance un os comme"
	next "un boomerang pour"
	next "frapper l'ennemi"

	bage "2 fois de suite."
	next "Contrairement aux"
	next "autres GROUND,"

	bage "il peut toucher"
	next "les #MON de type"
	next "FLYING.@"

	text_jump _Generic33PercentLowerSpeedText

_RestDexEntry::
	text "Le <user> s'endort,"
	next "soignant tous les"
	next "dégâts."

	bage "Soigne tous les HP"
	next "et guérit tous"
	next "les statuts."

	bage "Le <user> dort"
	next "exactement 2"
	next "tours"
	dex

_RockSlideDexEntry::
	text "Une avalanche de"
	next "rochers tombe sur"
	next "l'ennemi.@"

	text_jump _Generic10PercentFlinchText

_HyperFangDexEntry::
	text "D'énormes crocs"
	next "mordent l'<opponent>.@"

	text_jump _Generic10PercentFlinchText
