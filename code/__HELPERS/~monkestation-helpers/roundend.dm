/datum/controller/subsystem/ticker/proc/save_tokens()
	rustg_file_write(json_encode(GLOB.saved_token_values), "[GLOB.log_directory]/tokens.json")

/datum/controller/subsystem/ticker/proc/calculate_rewards()
	for(var/client/client as anything in GLOB.clients)
		calculate_add_jobxp(client)

/datum/controller/subsystem/ticker/proc/calculate_add_jobxp(client/client)
	var/hour = round((world.time - SSticker.round_start_time) / 36000)
	var/minute = round(((world.time - SSticker.round_start_time) - (hour * 36000)) / 600)
	var/added_xp = round(25 + (minute ** 0.85))
	if(!client)
		return
	if(client?.mob?.mind?.assigned_role)
		add_jobxp(client, added_xp, client?.mob?.mind?.assigned_role?.title)
