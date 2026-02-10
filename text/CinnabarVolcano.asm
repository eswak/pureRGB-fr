_CinnabarVolcanoBombRocksText::
	text "Ces rochers"
	cont "bloquent"
	line "la lave."
	para "Les faire sauter"
	line "avec un #MON?"
	done

_CinnabarVolcanoBombRocksTextDoneJump::
	para "@"
_CinnabarVolcanoBombRocksTextDone::
	text "La lave s'écoule"
	line "du volcan."
	done

_CinnabarVolcanoProspectorGreetingNotMetText::
	text "Hé, gamin!"
	para "C'est dangereux"
	line "ici!"
	para "Qu'est-ce que tu"
	line "fais là?"
	para "Tu as des #MON"
	line "costauds!"
	prompt

_CinnabarVolcanoProspectorGreetingMetText::
	text "PROSPECTEUR: Hé"
	line "gamin!"
	para "Te revoir ici!"
	para "Tu tombes au"
	line "bon moment!"
	para "Tu as des #MON"
	line "costauds!"
	prompt

_CinnabarVolcanoProspectorStrongMonsText::
	text "Le VOLCAN de"
	line "CRAMOIS'ILE est"
	cont "trop chaud pour"
	cont "un explorateur."
	para "Tu peux peut-être"
	line "nous aider!"
	para "D'abord, mets"
	line "une de ces"
	cont "combinaisons-"
	prompt

_CinnabarVolcanoProspectorLavaSuitText::
	text "Une COMBINAISON"
	line "ANTI-LAVE!"
	para "Elle te protège"
	line "de la chaleur!"
	para "C'est un four"
	line "là-dedans!"
	para "Essaie celle-ci!"
	prompt

_CinnabarVolcanoProspectorLetsGo::
	text "Nickel!"
	para "Bon,"
	line "suis-moi!"
	done

_CinnabarVolcanoProspectorHeresProblem::
	text "Alors gamin,"
	line "voilà le problème-"
	prompt

_CinnabarVolcanoProspectorLavaExplain::
	text "Il y a trop de"
	line "lave dans le"
	cont "cône principal!"
	para "D'habitude ça"
	line "s'écoule sous"
	cont "l'eau."
	para "Si on ne vide pas"
	line "cette lave,"
	cont "le volcan va"
	cont "entrer en"
	cont "éruption!"
	para "La lave doit être"
	line "bloquée quelque"
	cont "part en bas."
	para "Tu dois dégager"
	line "ces blocages!"
	prompt

_CinnabarVolcanoProspectorBlowRocks::
	text "Les rochers comme"
	line "celui-ci créent"
	cont "des blocages!"
	para "Trouve-les et"
	line "fais-les sauter,"
	cont "casse-les,"
	cont "fonds-les"
	cont "peu importe,"
	cont "débarrasse-toi"
	cont "d'eux!"
	prompt

_CinnabarVolcanoGiveDrill::
	text "Il faut creuser"
	line "plus profond dans"
	cont "le volcan!"
	para "Il n'y a pas"
	line "d'accès en bas,"
	cont "prends une FORET!"
	prompt

_CinnabarVolcanoGotDrill::
	text "<PLAYER> obtient"
	line "une FORET"
	cont "PUISSANTE!"
	done

_CinnabarVolcanoDrill::
	text "Appuie sur SELECT"
	line "pour la FORET."
	para "Tu peux percer"
	line "où tu vois des"
	cont "fissures!"
	para "Il faut une mèche"
	line "neuve pour"
	cont "creuser."
	para "Pour en faire une,"
	line "mets 3 RUBIS"
	cont "dans la FORET!"
	para "Tu devrais en"
	line "trouver plein ici!"
	prompt

_CinnabarVolcanoFriend::
	text "L'autre avec son"
	line "ARCANIN va dégager"
	cont "le côté ouest."
	prompt

_CinnabarVolcanoYouClearEast::
	text "Toi, tu dégages"
	line "le côté est!"
	para "Une dernière"
	cont "chose."
	para "Comme il fait"
	line "très chaud,"
	cont "utilise"
	cont "des #MON FEU,"
	cont "SOL ou ROCHE."
	para "Eux seuls tiennent"
	line "le coup ici!"
	prompt

_ExplodeRocksExplosionText::
	text_ram wNameBuffer
	text " utilise"
	line "EXPLOSION pour"
	cont "faire sauter les"
	cont "rochers!"
	done

_ExplodeRocksSelfdestructText::
	text_ram wNameBuffer
	text " utilise"
	line "DESTRUCTION pour"
	cont "faire sauter les"
	cont "rochers!"
	done

_ShatteredRocksSkullBashText::
	text_ram wNameBuffer
	text " pulvérise"
	line "les rochers avec"
	cont "COUD'KRANE!"
	done

_ShatteredRocksText::
	text_ram wNameBuffer
	text " pulvérise"
	line "les rochers d'un"
	cont "coup puissant!"
	done

_MeltedRocksText::
	text_ram wNameBuffer
	text " fond"
	line "les rochers avec"
	cont "un feu surchauffé!"
	done

_RocksGoneText::
	text "L'écoulement de"
	line "lave est débloqué!"
	done

_WhereRubiesText::
	text "Il faut trouver"
	line "des RUBIS pour"
	cont "la FORET!"
	para "Ils doivent être"
	line "à cet étage!"
	done

_FoundRubyText::
	text "<PLAYER> trouve"
	line "un RUBIS!"
	done

_RubyTwoMoreToGoText::
	text "Encore deux@"
	text_jump _MoreToGoText
	
_MoreToGoText:
	text_end
	text " à trouver!"
	done

_RubyOneMoreToGoText::
	text "Encore un@"
	text_jump _MoreToGoText

_RubyGotAllOfThemText::
	text "<PLAYER> insère"
	line "les 3 RUBIS dans"
	cont "la FORET."
	done

_RubyGoodToGo::
	text "La FORET passe"
	line "en mode puissance!"
	para "Tu peux creuser"
	line "vers l'étage du"
	cont "dessous!"
	done

_ItsRhydon::
	text "C'est un"
	cont "RHINOFEROS."
	para "Il a l'air"
	line "ennuyé."
	prompt

_RhydonGetOnBack::
	text "Monter sur son"
	cont "dos?"
	done

_RhydonGotOnBack::
	text "C'est parti!"
	done

_GotRocksalts::
	text "<PLAYER> trouve"
	line "des SELS DE ROCHE!"
	done

_GotLimestone::
	text "<PLAYER> trouve"
	line "du CALCAIRE!"
	done

_ItsGraveler::
	text "C'est un"
	cont "GRAVALANCH."
	para "Il se fait masser"
	line "par la lave"
	cont "qui coule."
	para "Il a l'air un peu"
	line "affamé."
	done

_GiveGravelerRockSalts::
	text "Lui donner des"
	line "SELS DE ROCHE"
	cont "à manger?"
	done

_GravelerMunching::
	text "Le GRAVALANCH"
	line "croque les"
	cont "SELS DE ROCHE."
	para "Il a l'air"
	line "content!"
	done

_ItsSickRhydon::
	text "Encore un"
	line "RHINOFEROS."
	para "Celui-ci a l'air"
	line "d'avoir mal au"
	cont "ventre."
	done

_GiveRhydonLimestone::
	text "Lui donner du"
	line "CALCAIRE broyé"
	cont "pour soigner sa"
	cont "indigestion?"
	done

_RhydonGrinded::
	text "<PLAYER> a réduit"
	line "le CALCAIRE en"
	cont "poudre avec la"
	cont "FORET."
	done

_GotAntacidText::
	text "Le CALCAIRE"
	line "est devenu"
	cont "ANTACIDE!"
	done

_GaveRhydonAntacid::
	text "Le RHINOFEROS"
	line "malade a avalé"
	cont "l'ANTACIDE."
	prompt

_RhydonResting::
	text "Le RHINOFEROS"
	line "ira mieux mais"
	cont "doit se reposer!"
	done

_MagmarBoss::
	text "Un gros MAGMAR"
	line "barre la route."
	done

_MagmarFight::
	text "Il a l'air très"
	line "agressif."
	para "Le combattre?"
	done

_VolcanoBattleBurnText::
	text "Le volcan est"
	line "trop chaud pour"
	cont "@"
	text_ram wBattleMonNick
	text "!"
	prompt


_LetsDoThis::
	text "C'est parti!"
	done

_MagmarBattleInit::
	text "Un voile de magma"
	line "recouvre @"
	text_ram wEnemyMonNick
	text "!"
	para "Il s'est renforcé!"
	prompt

_EnemyMonWasDefeatedText::
	text "Ennemi @"
	text_ram wEnemyMonNick
	text_start
	line "vaincu!"
	prompt

_MagmarDefeat::
	text "MAGMAR a admis"
	line "sa défaite et"
	cont "s'est écarté."
	done

_UhohVolcano::
	text "Oh non. La lave"
	line "va traverser tout"
	cont "le mur est!"
	para "Faut se mettre"
	line "à l'abri vite!"
	done

_VolcanoBlockagesGone::
	text "Wow! Ça devrait"
	line "évacuer l'excès"
	cont "de lave!"
	para "<PLAYER> a"
	line "dégagé tous les"
	cont "blocages!"
	done

_VolcanoGoBackMainFloor::
	text_start
	para "Voyons comment"
	line "ça s'est passé"
	cont "en haut."
	done

_VolcanoBlaineJoinUs::
	text "Content que tu"
	line "nous rejoignes!"
	done

_VolcanoProspectorDone::
	text "Whoa!"
	para "Qu'est-ce que"
	line "t'as fait?"
	para "La lave se vide"
	line "à toute vitesse!!"
	para "Regarde!"
	prompt

_VolcanoProspectorDone2::
	text "Ça devrait"
	line "stopper"
	cont "l'éruption!"
	para "Sortons d'ici,"
	line "gamin!"
	para "Je transpire comme"
	line "un MYSTHERBE au"
	cont "salad bar!"
	done

_VolcanoProspectorPhew::
	text "Pfiou, on peut"
	line "enfin enlever"
	cont "ces combinaisons!"
	prompt

_VolcanoProspectorRightBlaine::
	text "Content de les"
	line "avoir!"
	para "Ils ont servi!"
	para "Même si toi et"
	line "AUGUSTE avez fait"
	cont "tout le boulot!"
	prompt

_VolcanoBlaineMessage1::
	text "AUGUSTE: Ça"
	cont "devrait"
	line "retenir"
	cont "l'éruption."
	para "Cette chaleur!"
	para "J'espérais revoir"
	line "l'oiseau de feu"
	cont "#MON croisé"
	cont "il y a des années."
	para "Tant pis!"
	para "On se reverra"
	line "peut-être!"
	prompt

_VolcanoBlaineMessageNotDone::
	text "C'est <PLAYER>,"
	line "c'est ça?"
	para "Bon boulot!"
	para "Viens me défier"
	line "à l'ARENE de"
	cont "CRAMOIS'ILE!"
	para "Si tu peux y"
	line "entrer!"
	para "Hah! A la"
	cont "prochaine!"
	done

_VolcanoBlaineMessageGymDone::
	text "On se revoit,"
	line "<PLAYER>!"
	para "Ce jeune loup"
	cont "était"
	line "l'un des deux"
	cont "dresseurs qui"
	cont "m'ont"
	cont "battu à l'ARENE!"
	para "Continue comme ça!"
	para "Hah! A la"
	cont "prochaine!"
	done

_VolcanoProspectorAfterMessage::
	text "Je reste ici"
	line "prospecter!"
	para "T'as vu tous ces"
	line "RUBIS!"
	para "Tu peux utiliser"
	line "la COMBINAISON"
	cont "ANTI-LAVE autant"
	cont "que tu veux,"
	cont "gamin!"
	done

_VolcanoAvoidWestSide::
	text "Quelqu'un s'occupe"
	line "déjà du côté"
	cont "ouest."
	para "Dégage les"
	line "blocages de"
	cont "l'autre"
	cont "côté!"
	done

_VolcanoGetToIt::
	text "Je surveille"
	line "la lave ici."
	para "J'aimerais t'aider"
	line "mais j'ai pas de"
	cont "#MON avec moi!"
	para "Au boulot, gamin!"
	done

_FailedDrillFloorText::
	text "La FORET est trop"
	line "usée pour creuser!"
	para "Trouve 3 RUBIS"
	line "pour une nouvelle"
	cont "mèche!"
	done

_CinnabarVolcanoFloor2WarpTilesText::
	text "Whoa! C'est quoi?"
	para "La lave a dû"
	line "ouvrir le sol"
	cont "par là!"
	done

_CinnabarVolcanoWestMagmar1Text::
	text "Des MAGMAR se"
	line "prélassent dans"
	cont "la lave."
	done

_CinnabarVolcanoWestMagmar1QuestionText::
	text "On dirait qu'il"
	line "y a de la place"
	cont "pour un de plus!"
	prompt

_CinnabarVolcanoWestMagmar2Text::
	text "MAGMAR: Fwoo?"
	done

_CinnabarVolcanoWestMagmar3Text::
	text "MAGMAR: Fshaa!"
	done

_CinnabarVolcanoWestLavaFlowText::
	text "C'est ici"
	cont "qu'AUGUSTE"
	line "a dégagé un"
	cont "blocage de lave.@"
	text_jump _CinnabarVolcanoBombRocksTextDoneJump

_CinnabarVolcanoWestMagmarTransformText1::
	text "@"
	text_ram wNameBuffer
	text " a l'air"
	line "emballé pour un"
	cont "bain de lave!"
	done

_CinnabarVolcanoWestMagmarTransformText2::
	text "@"
	text_ram wNameBuffer
	text " fait"
	line "un plouf dans"
	cont "la mare de lave!"
	done

_CinnabarVolcanoWestMagmarTransformText3::
	text "La puissance"
	line "volcanique irradie"
	cont "@"
	text_ram wNameBuffer
	text "!"
	done

_MagmarEventAlready::
	text "C'est déjà"
	line "rempli de la"
	cont "chaleur du volcan."
	done

_CinnabarVolcanoWestMagmarTransformText4::
	text "<PARA>Il est devenu"
	line "si brûlant que"
	cont "l'eau autour"
	cont "s'évapore!"
	para "@"
	text_ram wNameBuffer
	text " est"
	line "immunisé contre"
	cont "les capacités EAU"
	cont "et FEU!"
	para "La puissance"
	line "tectonique du"
	cont "volcan coule en"
	cont "lui!"
	para "Les capacités SOL"
	line "infligeront des"
	cont "dégâts bonus!"
	done

_Route21CinnabarVolcanoSignText::
	text "VOLCAN CRAMOIS'ILE"
	para "DANGER!"
	para "NE PAS ENTRER"
	line "SANS COMBINAISON"
	cont "ANTI-CHALEUR!"
	done
