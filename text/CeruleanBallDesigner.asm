_CeruleanBallDesignerSwitchBallMenuStart::
	text "Changer la"
	line "# BALL d'un"
	cont "#MON?"
	done

_CeruleanBallDesignerCustomizeBallMenuStart::
	text "Modifier les"
	line "#BALLs custom?"
	done

_NoBallsToSwitch::
	text "Aucune BALL"
	line "dans le sac!"
	done

_CurrentlyInABall::
	text "Actuellement:"
	line "@"
	text_ram_namebuffer
	text_end

_AlreadyInThatBall::
	text "C'est déjà dans"
	line "ce type de BALL."
	done

_NoRoomForBall::
	text "Plus de place"
	line "pour l'ancienne"
	cont "# BALL!"
	done

_ChangedBallText1::
	text "Mis @"
	text_ram_namebuffer
	text ""
	line "dans une neuve"
	cont "@"
	text_ram_stringbuffer
	text "!"
	done

_ChangedBallText2::
	text "Mis l'ancienne"
	line "@"
	text_ram_namebuffer
	text " dans"
	cont "votre sac."
	done

_ChangeIntoWarning::
	text "En le mettant"
	line "dans @"
	text_ram_stringbuffer
	text ","
	para "la @"
	text_ram_stringbuffer
	text " ne"
	line "pourra plus être"
	cont "récupérée."
	para "A cause d'un fort"
	line "mécanisme de"
	cont "capture,"
	para "les @"
	text_ram_stringbuffer
	text "s"
	line "ne sont pas"
	cont "réutilisables!"
	para "Changer quand"
	line "même?"
	done

_ChangeOutOfWarning::
	text "Le retirer de"
	line "la @"
	text_ram_namebuffer
	text ""
	cont "va détruire la"
	cont "@"
	text_ram_namebuffer
	text "."
	para "Son mécanisme de"
	line "capture ne marche"
	cont "qu'une fois!"
	para "Changer quand"
	line "même?"
	done

_CeruleanBallDesignerBlankPokeballText::
	text "C'est une"
	line "# BALL vierge!"
	para "Prête pour un"
	line "beau design!"
	done

_CeruleanBallDesignerCameraText::
	text "C'est un CAMERA"
	line "instantané!"
	para "Il imprime la"
	line "photo juste après"
	cont "l'avoir prise!"
	done

_CeruleanBallDesignerCamera2Text::
	text "Prenons des photos"
	line "inspirantes!"
	prompt

_CeruleanBallDesignerDarkRoomSignText::
	text "DARKROOM"
	para "Gardez la porte"
	line "fermée!"
	para "Photos en cours"
	line "de développement."
	done

_CeruleanBallDesignerBallDisplayText::
	text "Une # BALL en"
	line "argent massif est"
	cont "exposée!"
	para "La gravure dit:"
	para "MERCI POUR VOTRE"
	line "EXCELLENT TRAVAIL!"
	para "-SILPH CO."
	done

_CeruleanBallDesignerPhotosText::
	text "Des photos sont"
	line "en développement!"
	para "Ne pas toucher!"
	done

_CeruleanBallDesignerSinkText::
	text "Eviers pour bains"
	line "chimiques photo"
	cont "et agrandisseur!"
	done

_CeruleanBallDesignerPosterText::
	text "Une affiche"
	line "publicitaire."
	para "ONDINE porte un"
	line "uniforme rouge de"
	cont "sauveteur, souffle"
	cont "dans un sifflet."
	para "Elle brandit une"
	line "SUPER BALL face"
	cont "au spectateur."
	para "Pas besoin d'être"
	line "sauvé -"
	para "avec une"
	line "SUPER BALL!"
	para "-SILPH CO."
	done

_CeruleanBallDesignerDesignerGreeting::
	text "Je suis un"
	line "DESIGNER de"
	cont "# BALL!"
	para "SILPH CO. crée la"
	line "tech de capture,"
	cont "moi le look!"
	para "Regardez mon"
	line "dernier design-"
	para "Dans toute sa"
	line "gloire bleue!"
	prompt

_CeruleanBallDesignerDesignerSecondTime::
	text "Je cherche de"
	line "nouvelles idées"
	cont "sur ce carnet."
	para "Idées de design"
	line "de # BALL!"
	para "Argh, je n'arrive"
	line "pas à trouver!"
	para "Hmm<...>"
	para "Tu pourrais"
	line "peut-être aider."
	para "Tu veux devenir"
	line "mon assistant?"
	done

_CeruleanBallDesignerDesignerBecameAssistant::
	text "Hourra! J'ai un"
	line "assistant!"
	para "Prêt à commencer?<PARA>@"
	text_end

_CeruleanBallDesignerGoGetCamera::
	text "Va dans ma"
	line "chambre noire et"
	cont "prends la CAMERA."

	para "Prends des photos"
	line "avec, trouve-moi"
	cont "de l'inspiration!"
	done

_CeruleanBallDesignerDesignerGotCamera::
	text "Tu as ma CAMERA?"
	para "Bien!"
	para "J'ai noté quelques"
	line "concepts qui"
	cont "m'inspireraient"
	cont "sur ce bloc-notes!"
	para "Jette un oeil!"
	done

_CeruleanBallDesignerDesignerWaitingForPhotos::
	text "De nouvelles"
	line "photos?"
	para "Non?"
	para "Au fait,"
	para "Tu peux changer"
	line "les # BALLs de"
	cont "ton #MON sur"
	cont "mon établi!"
	para "Essaie!"
	done

_CeruleanBallDesignerNewPhoto::
	text "Oh? Tu as une"
	line "nouvelle photo?!"
	para "Ah, trop bien!"
	line "Montre! Montre!"
	prompt

_CeruleanBallDesignerWait::
	text "!!!"
	line "Attends un peu<...>"
	prompt

_CeruleanBallDesignerEureka::
	text "EUREKA!!!"
	prompt

_CeruleanBallDesignerDesigned::
	text "Inspiré par ta"
	line "photo,"
	para "j'ai créé la"
	line "@"
	text_ram_stringbuffer
	text "!"
	done

_CeruleanBallDesignerDesigned2::
	text "<PARA>Mets ton #MON"
	line "dedans sur mon"
	cont "établi,"
	para "ou personnalise"
	line "avec mes outils!"
	para "Merci encore,"
	line "mon assistant!"
	done

_BallDesignerPokemonBreederReaction::
	text "#MON et humains"
	line "vivant ensemble"
	cont "sur cette verte"
	cont "terre!"
	para "Notre planète est"
	line "comme un arbre!"
	prompt

_BallDesignerPsyduckReaction::
	text "Sa belle âme se"
	line "reflète dans une"
	cont "eau ondulante!"
	prompt

_BallDesignerFlareonReaction::
	text "Une boule de"
	line "fourrure en feu!"
	prompt

_BallDesignerJigglypuffReaction::
	text "OH. MON. DIEU!"
	para "C'est trooop"
	line "mignon!"
	prompt

_BallDesignerJolteonReaction::
	text "Electrisant!"
	para "Ça a l'air bien"
	line "piquant!"
	prompt

_BallDesignerPorygonReaction::
	text "Whoa!"
	para "Il surfe sur le"
	line "web virtuel?"
	prompt

_BallDesignerFossilReaction::
	text "Ces anciennes"
	line "pierres:"
	para "jardins d'os!"
	prompt

_BallDesignerArticunoReaction::
	text "Brrr! Tu as dû"
	line "geler en prenant"
	cont "cette photo!"
	prompt

_BallDesignerAbraReaction::
	text "Que peut-il bien"
	line "voir dans ses"
	cont "rêves?"
	prompt

_BallDesignerPidgeotReaction::
	text "Wow! Si dynamique!"
	para "Il plane sur"
	line "le vent!"
	prompt

_BallDesignerGrimerReaction::
	text "C'est mignon tout"
	line "en étant de la"
	cont "boue toxique!"
	prompt

_BallDesignerGastlyReaction::
	text "Quelle photo"
	line "effrayante!"
	prompt

_BallDesignerScytherReaction::
	text "Il tranche à"
	line "travers un champ!"
	prompt

_BallDesignerLassReaction::
	text "Regarde son beau"
	line "sourire!"
	para "Quel ange!"
	prompt

_BallDesignerMankeyReaction::
	text "Il a l'air si"
	line "furieux qu'il va"
	cont "exploser!"
	prompt

_BallDesignerGamblerReaction::
	text "Une photo de dés?"
	para "C'est plutôt"
	line "aléatoire! Héhé."
	prompt

_BallDesignerPokemonBreederHint::
	text "Un homme au"
	line "chapeau de paille,"
	cont "dans un pré vert."
	prompt

_BallDesignerPsyduckHint::
	text "Un #MON vivant"
	line "dans un étang"
	cont "près d'un port."
	prompt

_BallDesignerFlareonHint::
	text "Un #MON de feu"
	line "dans une ROUTE"
	cont "rocheuse à l'est."
	prompt

_BallDesignerJigglypuffHint::
	text "Un #MON rond et"
	line "mignon qui chante"
	cont "au sud de la ville"
	cont "grise."
	prompt

_BallDesignerJolteonHint::
	text "Un #MON"
	line "électrique aux"
	cont "abords d'une"
	cont "grande ville."
	prompt

_BallDesignerPorygonHint::
	text "Un #MON virtuel"
	line "naviguant dans"
	cont "le cyberespace."
	prompt

_BallDesignerFossilHint::
	text "Preuve en pierre"
	line "de #MON"
	cont "préhistoriques!"
	prompt

_BallDesignerArticunoHint::
	text "Un #MON ultra"
	line "rare dans une"
	cont "zone glacée!"
	prompt

_BallDesignerAbraHint::
	text "Un petit #MON"
	line "endormi dans une"
	cont "ROUTE au nord."
	prompt

_BallDesignerPidgeotHint::
	text "Un superbe #MON"
	line "oiseau dans une"
	cont "ROUTE avec plein"
	cont "de clôtures."
	prompt

_BallDesignerGrimerHint::
	text "Un #MON vivant"
	line "en secret sous un"
	cont "chemin souterrain!"
	prompt

_BallDesignerGastlyHint::
	text "Une petite fille"
	line "en contact avec"
	cont "le surnaturel!"
	prompt

_BallDesignerScytherHint::
	text "Un #MON rapide"
	line "fonçant dans une"
	cont "ROUTE pleine de"
	cont "hautes herbes."
	prompt

_BallDesignerLassHint::
	text "Une fille en jupe"
	line "très féminine qui"
	cont "adore MELOFEE."
	prompt

_BallDesignerMankeyHint::
	text "Une boule de poils"
	line "en colère vivant"
	cont "près du chemin"
	cont "des MOTARDS!"
	prompt

_BallDesignerGamblerHint::
	text "Un homme chanceux"
	line "qui adore le chaos"
	cont "au combat!"
	prompt

_CeruleanBallDesignerThanksForHelp::
	text "Tu m'as aidé à"
	line "créer tant de"
	cont "# BALLs!"
	para "Personnalise les"
	line "tiennes!"
	para "Va sur mon établi"
	line "et au boulot!"
	para "Bon travail,"
	line "assistant!"
	done

_CeruleanBallDesignerBenchCustomizeNoPermission::
	text "Plein d'outils et"
	line "de gadgets pour"
	cont "créer de nouvelles"
	cont "# BALLs!"
	para "Je n'ai pas la"
	line "permission de les"
	cont "utiliser."
	done

_NeedWorkBenchInfo::
	text "Besoin d'infos sur"
	line "l'établi?"
	prompt

_WorkbenchInfoBasic::
	text "Les # BALLs"
	line "custom sont"
	cont "spéciales."
	para "Elles ont des"
	line "animations uniques"
	cont "en envoyant vos"
	cont "#MON!"
	para "Mais elles n'ont"
	line "pas de mécanisme"
	cont "de capture!"
	para "Impossible de"
	line "capturer des"
	cont "#MON sauvages"
	cont "avec."
	prompt

_WorkbenchInfoChangingBalls::
	text "Vous pouvez"
	line "changer les"
	cont "# BALLs de vos"
	cont "#MON."
	para "Pour les BALLs"
	line "objet, il en faut"
	cont "une dans le sac"
	cont "pour y mettre un"
	cont "#MON."
	para "Les BALLs custom"
	line "sont illimitées!"
	para "En mettant un"
	line "#MON dans une"
	cont "BALL custom,"
	para "vous récupérez"
	line "la BALL objet!"
	para "Economisez et"
	line "réutilisez les"
	cont "BALLs pour plus"
	cont "de #MON!"
	prompt 

_WorkbenchInfoCustomizingBalls::
	text "Vous pouvez"
	line "modifier les BALLs"
	cont "custom débloquées."
	para "Changez leurs"
	line "effets"
	cont "audiovisuels!"
	para "Quand le DESIGNER"
	line "crée des BALLs,"
	cont "vous débloquerez"
	cont "plus d'options."
	prompt

_CeruleanBallDesignerBookshelfText::
	text "Un système audio"
	line "à bandes!"
	para "Plein de cassettes"
	line "sur l'étagère!"
	para "Classique, jazz,"
	line "big band<...>"
	done

_CeruleanBallDesignerCannotChangeTile::
	text "Impossible de"
	line "changer la tuile"
	cont "de cette anim."
	para "OG Poof + Explode"
	line "utilisent des"
	cont "images statiques."
	prompt

_CeruleanBallDesignerCannotChangeColor::
	text "Pas de changement"
	line "de couleur ici."
	prompt

_BallDesignerInfoText::
	text "Si ON, à AZURIA"
	line "une maison"
	cont "contiendra le"
	cont "BALL DESIGNER."
	para "Travaillez avec"
	line "le DESIGNER pour"
	cont "créer de nouvelles"
	cont "# BALLs."
	para "Personnalisez les"
	line "BALLs: effets"
	cont "audiovisuels à"
	cont "débloquer!"
	prompt

_BallDesignerCameraBack::
	text "Au fait,"
	para "Je peux ravoir"
	line "ma CAMERA?"
	done

_BallDesignerCameraBackPC::
	text "C'est dans ton PC!"
	line "Récupère-le!"
	done

_BallDesignerCameraBorrowAgain::
	text "Merci!"
	para "N'hésite pas à le"
	line "reprendre dans"
	cont "ma chambre noire!"
	done
