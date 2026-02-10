_ViridianSchoolHouseBrunetteGirlText::
	text "Pfiou! J'essaie"
	line "de retenir toutes"
	cont "mes notes."
	done

_ViridianSchoolHouseCooltrainerFText::
	text "OK!"

	para "Lis le tableau"
	line "attentivement!"
	done

_SchoolText3::
	text "Pfiou! La colle"
	line "n'en finit pas!"
	done

_SchoolText4::
	text "SALLE DE RETENUE"
	done

; basement

_SchoolB1FGuyNearStairs::
	text "Pourquoi nos"
	line "classes sont"
	cont "au sous-sol?"

	para "On adore les"
	line "#MON SOL à"
	cont "JADIELLE!"

	para "C'est normal"
	line "d'étudier sous"
	cont "terre!"
	done

_SchoolB1FCornerGameboyKid::
	text "Chut! Dis pas"
	line "que je me cache"
	cont "ici."

	para "J'ai déjà appris"
	line "tout le manuel."
	
	para "Faut que je"
	line "finisse ce jeu!"
	
	para "C'est quoi?"
	line "Ca s'appelle:"
	
	para "FOR THE FROG"
	line "THE BELL TOLLS"
	
	para "J'accroche"
	line "grave!"
	done


_SchoolB1FLittleGirlProdigy::
	text "J'ai sauté 3"
	line "classes!"

	para "Maman dit que"
	line "j'irai loin!"
	
	para "Tu savais?"
	
	para "Une capacité du"
	line "même TYPE que le"
	cont "#MON qui l'utilise"
	cont "fait plus de"
	cont "dégâts!"
	
	para "Je trouve ça"
	line "génial!"
	done


_SchoolB1FNerd::
	text "Ahh! Me"
	line "déconcentre pas!"
	
	para "Je laisserai pas"
	line "cette gamine"
	cont "insulter mon"
	cont "intellect!"
	
	para "Un peu de savoir"
	line "de l'immense"
	cont "base de données"
	cont "qu'est mon"
	cont "cerveau:"
	
	para "Les #MON"
	line "PSY ont presque"
	cont "aucune faiblesse!"
	prompt

_SchoolB1FLittleGirlRetort::
	text "Ils sont faibles"
	line "au TYPE INSECTE."
	prompt

_SchoolB1FLittleGirlRetort2::
	text "Ils sont faibles"
	line "aux types"
	cont "INSECTE et"
	cont "SPECTRE."
	prompt

_SchoolB1FNerdSilence::
	text "Silence!!"
	prompt

_SchoolB1FLittleGirlBro::
	text "Oublie pas de"
	line "manger les légumes"
	cont "de maman au"
	cont "déjeuner, frérot!"
	prompt

_SchoolB1FNerdAck::
	text "Argh!!"
	done

_SchoolB1FRocker::
	text "GUS: L'école"
	line "c'est pour les"
	cont "nuls."
	para "Les vrais"
	line "apprennent les"
	cont "#MON en"
	cont "combat!"
	para "Pas vrai?"
	done

_SchoolB1FRockerYes::
	text "Les gagnants"
	line "pensent pareil!"
	para "Tu me motives,"
	line "mec!@"
	text_jump _SchoolB1FRockerBattleNow

_SchoolB1FRockerNo::
	text "Là je suis énervé!"
	para "Les bouffons"
	line "comme toi doivent"
	cont "être remis à leur"
	cont "place!"
	; fall through
_SchoolB1FRockerBattleNow::
	para "Battons-nous"
	line "ici et"
	cont "maintenant!!"
	done

_SchoolB1FDetentionText::
	text "HAUT-PARLEUR: GUS"
	cont "G"
	line "- SE PRESENTER"
	para "EN RETENUE POUR"
	line "AVOIR COMBATTU"
	cont "EN CLASSE."
	para "GUS: Aïe!"
	done

_SchoolB1FStudentTeacher::	
	text "Je suis"
	line "stagiaire."
	para "J'aide cette"
	line "classe!"
	para "Tu savais?"
	para "Une capacité"
	line "a des éléments"
	cont "de 3 TYPEs:"
	para "FEU, GLACE et"
	line "ELECTRIQUE!"
	para "Ca s'appelle"
	line "TRIPLATTAQUE!"
	done

_SchoolB1FBrunetteGirl::
	text "JEN: Psst!"
	para "C'est quoi la"
	line "réponse au 3?"
	done

_SchoolB1FDetention2Text::
	text "HAUT-PARLEUR: JEN"
	cont "J"
	line "- SE PRESENTER"
	para "EN RETENUE POUR"
	line "AVOIR TRICHE"
	cont "AU QUIZ."
	prompt

_SchoolB1FNotAgainText::
	text "JEN: Pas encore!"
	done

_SchoolB1FTutorText::
	text "Vous devez"
	line "apprendre les 15"
	cont "types #MON!"
	para "Pas la moitié!"
	para "C'est vous qui"
	line "m'avez demandé"
	cont "de vous aider!"
	done

_SchoolB1FLeftTuteeText::
	text "Les capacités"
	line "physiques,"
	cont "c'est mes"
	cont "préférées!"
	para "Elles utilisent"
	line "l'ATTAQUE et la"
	cont "DEFENSE pour"
	cont "les dégâts."
	para "Selon le TYPE"
	line "de la capacité!"
	para "J'ai noté les"
	line "TYPEs physiques"
	cont "dans mon cahier."
	done

_SchoolB1FRightTuteeText::
	text "Les capacités"
	line "spéciales,"
	cont "c'est mes"
	cont "préférées!"
	para "Elles utilisent"
	line "le statut SPECIAL"
	cont "pour les dégâts."
	para "Selon le TYPE"
	line "de la capacité!"
	para "Ma prof a noté"
	line "les TYPEs spéciaux"
	cont "dans son cahier."
	done

_SchoolB1FLeftTuteeNotebook::
	text "Liste TYPEs"
	line "physiques:"
	para "NORMAL, COMBAT," 
	line "INSECTE, ROCHE,"
	cont "SOL" 
	para "POISON, VOL"
	done

_SchoolB1FTutorNotebook::
	text "Liste TYPEs"
	line "spéciaux:"
	para "FEU, EAU, GLACE" 
	line "PLANTE, ELECTRIQUE" 
	para "PSY, DRAGON"
	done

_SchoolB1FBottomLeftNotebook::
	text "En combat,"
	cont "certaines"
	line "capacités frappent"
	cont "toujours en"
	cont "premier!"
	para "COUP D'BOULE,"
	line "POING COMETE,"
	cont "COUPE VENT sont"
	cont "des exemples."
	done

_SchoolB1FRightBlackboard::
	text "FEU bat PLANTE"
	para "PLANTE bat EAU"
	para "EAU bat FEU!"
	para "Comme pierre-"
	line "-feuille-ciseaux!"
	done

_SchoolB1FBottomRightNotebook::
	text "WOW!"
	para "Les #MON"
	line "SPECTRE sont"
	para "immunisés aux"
	line "capacités COMBAT"
	cont "et NORMAL!"
	done


_SchoolB1FNerdTextbook::
	text "Notes sur chaque"
	line "stat #MON."
	prompt

_SchoolB1FNerdNotebookRepeat::
	text "Lire sur quelle"
	line "stat?"
	done

_SchoolB1FNerdNotebookHP::
	text "Détermine les PV"
	line "du #MON."
	para "Plus il en a,"
	line "plus il est"
	cont "dur à K.O."
	prompt

_SchoolB1FNerdNotebookAttack::
	text "Détermine les"
	line "dégâts des"
	cont "attaques"
	cont "physiques."
	prompt

_SchoolB1FNerdNotebookDefense::
	text "Détermine les"
	line "dégâts reçus"
	cont "par les attaques"
	cont "physiques."
	prompt

_SchoolB1FNerdNotebookSpeed::
	text "Détermine quel"
	line "#MON frappe"
	cont "en premier."
	para "Celui qui a la"
	line "VITESSE la plus"
	cont "haute commence."
	prompt

_SchoolB1FNerdNotebookSpecial::
	text "Détermine les"
	line "dégâts des"
	cont "attaques"
	cont "spéciales et"
	cont "les dégâts reçus"
	cont "des attaques"
	cont "spéciales."
	prompt

_SchoolB1FRightTeacher::
	text "Savoir quels"
	line "TYPEs sont bons"
	cont "contre lesquels"
	cont "à mémoriser!"
	para "Mais en aventure"
	line "#MON tu"
	cont "apprendras vite!"
	para "Amuse-toi bien!"
	done

_SchoolB1FRockerNotebook::
	text "Plein de"
	line "gribouillis."
	para "Une version"
	line "rigolote du prof"
	cont "attaquée par des"
	cont "PIAFABEC en"
	cont "colère."
	done

_SchoolB1FBrunetteGirlNotebook::
	text "#MON le plus"
	line "mignon: TAUPIQUEUR"
	para "Mec le plus"
	cont "mignon:"
	line "Celui derrière"
	cont "moi!"
	done

_SchoolB1FBottomCenterNotebook::
	text "Certaines"
	cont "capacités"
	line "causent la"
	cont "confusion."
	para "Un #MON confus"
	line "peut se blesser"
	cont "en attaquant."
	para "La confusion"
	line "dure 2 à 5 tours."
	para "Elle part en"
	line "changeant de"
	cont "#MON ou en"
	cont "finissant le"
	cont "combat."
	done

_SchoolB1FLeftClassroomSign::
	text "CLASSE 2A -"
	line "CAPACITES #MON"
	done

_SchoolB1FRightClassroomSign::
	text "CLASSE 1A -"
	line "BASES #MON"
	done

_SchoolB1FRightPoster::
	text "Un beau paysage"
	line "de JADIELLE."
	para "En grosses"
	line "lettres:"
	para "LE MONDE"
	line "MERVEILLEUX DES"
	cont "#MON"
	para "-Ca commence"
	line "par apprendre!-"
	done

_SchoolB1FLeftPoster::
	text "Un tableau des 15"
	line "TYPEs #MON en"
	cont "icônes colorées."
	para "Derrière, une"
	line "photo du PLATEAU"
	cont "INDIGO au coucher"
	cont "du soleil."
	done

_SchoolB1FLeftBlackboard::
	text "DEVOIRS DU JOUR:"
	para "Ecris un poème"
	line "sur 10 capacités"
	cont "#MON que tu"
	cont "aimes!"
	para "EXEMPLE:"
	para "PISTOLET A O est"
	line "cool, CARAPUCE"
	cont "c'est le bon - une"
	cont "douche arrose mes"
	cont "fleurs!"
	done

