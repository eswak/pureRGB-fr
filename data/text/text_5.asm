_CableClubNPCPleaseComeAgainText::
	text "A bientôt!"
	done

_CableClubNPCMakingPreparationsText::
	text "Nous préparons"
	line "le lien."
	cont "Patience s.v.p.!"
	done

_UsedStrengthText::
	text_ram wNameBuffer
	text_start
	line "utilise FORCE.@"
	text_end

_CanMoveBouldersText::
	text_ram wNameBuffer
	text_start
	line "peut bouger"
	cont "les rochers."
	done

_CurrentTooFastText::
	text_start
_CurrentTooFastTextEntry::
	db "Le courant est"
	line "trop rapide!"
	done

_CurrentTooFastText2::
	text "Impossible de"
	line "SURFER ici!"
	para "@"
	text_jump _CurrentTooFastTextEntry

_CyclingIsFunText::
	text "Le vélo,"
	line "c'est cool!"
	cont "Oublie le SURF!"
	prompt

_FlashLightsAreaText::
	text "Un FLASH éclaire"
	line "les environs!"
	prompt

_EscapeText::
	text "Fuite@"
	text_end

_WarpText::
	text "Téléportation@"
	text_end

_ToLastPkmnCenterText::
	text " au dernier"
	line "CENTRE #MON?"
	prompt

_PocketAbraFlavorText1::
	text_ram wPocketAbraNick
	text_start
	line "attrape rapidement"
	cont "votre main avec"
	cont "impatience."
	prompt

_PocketAbraFlavorText2::
	text_ram wPocketAbraNick
	text_start
	line "a l'air très"
	cont "excité!"
	prompt

_PocketAbraFlavorText3::
	text_ram wPocketAbraNick
	text_start
	line "somnolait dans"
	cont "votre sac."
	prompt

_PocketAbraFlavorText4::
	text_ram wPocketAbraNick
	text_start
	line "s'est installé"
	cont "confortablement"
	cont "sur votre épaule."
	prompt

_PocketAbraFlavorText5::
	text_ram wPocketAbraNick
	text_start
	line "se concentre de"
	cont "toutes ses forces!"
	prompt

_PocketAbraNo::
	text_ram wPocketAbraNick
	text_start
	line "a l'air déçu..."
	prompt

_WarpToLastPokemonCenterText::
	text "Téléportation au"
	line "dernier CENTRE"
	cont "#MON visité."
	prompt

_CannotUseTeleportNowText::
	text_ram wNameBuffer
	text " ne"
	line "peut utiliser la"
	cont "TELEPORTATION."
	prompt

_CannotFlyHereText::
	text_ram wNameBuffer
	text " ne"
	line "peut VOLER ici."
	prompt

_CannotDigHereText::
	text_ram wNameBuffer
	text " ne"
	line "peut creuser ici."
	prompt

_CannotDigWhileSurfingText::
	text "Impossible de"
	line "creuser en SURFANT"
	cont "sur l'eau!"
	prompt

_NoWhereToDigDown::
	text "Vous allez"
	line "atteindre l'eau"
	cont "si vous creusez"
	cont "ici."
	para "Trouvez un sol"
	line "plus stable."
	prompt

_NotHealthyEnoughText::
	text "Points de vie"
	line "insuffisants."
	prompt

_AlreadyBrightText::
	text "C'est déjà"
	line "assez lumineux."
	prompt

_NewBadgeRequiredText::
	text "Non! Un nouveau"
	line "BADGE est requis."
	prompt

_CannotUseItemsHereText::
	text "Pas d'objets ici!"
	prompt

_CannotGetOffHereText::
	text "Impossible de"
	line "descendre ici!"
	prompt

_GotMonText::
	text "<PLAYER> obtient:"
	line "@"
	text_ram wNameBuffer
	text "!@"
	text_end

_SentToBoxText::
	text "Plus de place"
	line "pour un #MON!"
	cont "@"
	text_ram wBoxMonNicks
	text " est"
	cont "transféré à la"
	cont "BOITE @"
	text_ram wStringBuffer
	text " du PC!"
	prompt

_BoxIsFullText::
	text "Plus de place"
	line "pour un #MON!"

	para "La BOITE #MON"
	line "est pleine!"

	para "Changez de BOITE"
	line "dans un CENTRE"
	cont "#MON!"
	done