/datum/persistent_client
	/// Patreon data for this player.
	var/datum/patreon_data/patreon
	/// Twitch subscription data for this player.
	var/datum/twitch_data/twitch
	/// Currently active challenges.
	var/list/datum/challenge/active_challenges
	/// Currently applied challenges.
	var/list/datum/challenge/applied_challenges
	/// The challenge menu for this mob.
	var/datum/challenge_selector/challenge_menu

/datum/persistent_client/New(ckey, client)
	. = ..()
	patreon = new(ckey, src)
	twitch = new(ckey, src)
