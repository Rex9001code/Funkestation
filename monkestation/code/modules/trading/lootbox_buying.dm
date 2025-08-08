// Kill lootboxes with hammers

/client/var/lootbox_prompt = FALSE

/client/proc/try_open_or_buy_lootbox()
	if(!prefs || lootbox_prompt)
		return
	if(isnewplayer(mob))
		to_chat(src, span_warning("You can't [prefs.lootboxes_owned ? "open" : "buy"] a lootbox here! Observe or spawn in first, then try again."))
		return
	if(!prefs.lootboxes_owned)
		lootbox_prompt = TRUE
		buy_lootbox()
	if(prefs.lootboxes_owned)
		open_lootbox()

/client/proc/buy_lootbox()
	if(!prefs)
		lootbox_prompt = FALSE
		return
	switch(tgui_alert(src, "Would you like to purchase a lootbox? 5K", "Buy a lootbox!", list("Yes", "No")))
		if("Yes")
			attempt_lootbox_buy()
			lootbox_prompt = FALSE
		else
			lootbox_prompt = FALSE
			return

/client/proc/attempt_lootbox_buy()
	prefs.lootboxes_owned++
	prefs.save_preferences()

/client/proc/open_lootbox()
	message_admins("[ckey] opened a lootbox!")
	log_game("[ckey] opened a lootbox!")
	if(!mob)
		return

	if(isnewplayer(mob))
		to_chat(mob, span_warning("You can't open a lootbox here! The lootbox has been added to your inventory. Observe or spawn in first, then click the button again."))
		return

	if(!prefs.lootboxes_owned)
		return
	prefs.lootboxes_owned--
	prefs.save_preferences()
	mob.trigger_lootbox_on_self()

/proc/give_lootboxes_to_randoms(amount)
	for(var/i = 1 to amount)
		var/mob/mob = pick(GLOB.player_list)
		if(!mob.client)
			continue
		mob.client.give_lootbox(1)

/client/proc/give_lootbox(amount)
	if(!prefs)
		return
	prefs.lootboxes_owned += amount
	to_chat(mob, span_notice("You have been given [amount] lootboxes! Open it using the escape menu."))
	prefs.save_preferences()
