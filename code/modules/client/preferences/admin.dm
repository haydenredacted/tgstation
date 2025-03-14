/datum/preference/color/asay_color
	category = PREFERENCE_CATEGORY_GAME_PREFERENCES
	savefile_key = "asaycolor"
	savefile_identifier = PREFERENCE_PLAYER

/datum/preference/color/asay_color/create_default_value()
	return DEFAULT_ASAY_COLOR

/datum/preference/color/asay_color/is_accessible(datum/preferences/preferences)
	if (!..(preferences))
		return FALSE

	return is_admin(preferences.parent) && CONFIG_GET(flag/allow_admin_asaycolor)

/// What outfit to equip when spawning as a briefing officer for an ERT
/datum/preference/choiced/brief_outfit
	category = PREFERENCE_CATEGORY_GAME_PREFERENCES
	savefile_key = "brief_outfit"
	savefile_identifier = PREFERENCE_PLAYER

/datum/preference/choiced/brief_outfit/deserialize(input, datum/preferences/preferences)
	var/path = text2path(input)
	if (!ispath(path, /datum/outfit))
		return create_default_value()

	return path

/datum/preference/choiced/brief_outfit/serialize(input)
	return "[input]"

/datum/preference/choiced/brief_outfit/create_default_value()
	return /datum/outfit/centcom/commander

/datum/preference/choiced/brief_outfit/init_possible_values()
	return subtypesof(/datum/outfit)

/datum/preference/choiced/brief_outfit/is_accessible(datum/preferences/preferences)
	if (!..(preferences))
		return FALSE

	return is_admin(preferences.parent)

/datum/preference/toggle/bypass_deadmin_in_centcom
	category = PREFERENCE_CATEGORY_GAME_PREFERENCES
	savefile_key = "bypass_deadmin_in_centcom"
	savefile_identifier = PREFERENCE_PLAYER

/datum/preference/toggle/bypass_deadmin_in_centcom/is_accessible(datum/preferences/preferences)
	if (!..(preferences))
		return FALSE

	return is_admin(preferences.parent)

/// When enabled, prevents any and all ghost role pop-ups WHILE ADMINNED.
/datum/preference/toggle/ghost_roles_as_admin
	category = PREFERENCE_CATEGORY_GAME_PREFERENCES
	savefile_key = "ghost_roles_as_admin"
	savefile_identifier = PREFERENCE_PLAYER

/datum/preference/toggle/ghost_roles_as_admin/is_accessible(datum/preferences/preferences)
	if (!..(preferences))
		return FALSE

	return is_admin(preferences.parent)

/datum/preference/toggle/comms_notification
	category = PREFERENCE_CATEGORY_GAME_PREFERENCES
	savefile_key = "comms_notification"
	savefile_identifier = PREFERENCE_PLAYER

/datum/preference/toggle/comms_notification/is_accessible(datum/preferences/preferences)
	if (!..(preferences))
		return FALSE

	return is_admin(preferences.parent)

/datum/preference/toggle/auto_deadmin_on_ready_or_latejoin
	category = PREFERENCE_CATEGORY_GAME_PREFERENCES
	savefile_key = "auto_deadmin_on_ready_or_latejoin"
	savefile_identifier = PREFERENCE_PLAYER

/datum/preference/toggle/auto_deadmin_on_ready_or_latejoin/is_accessible(datum/preferences/preferences)
	if (!..(preferences))
		return FALSE
	if (preferences.toggles & DEADMIN_ALWAYS) //No reason to show if they're deadminning always, because deadmin always also deadmins on ready / latejoin
		return FALSE

	return is_admin(preferences.parent)
