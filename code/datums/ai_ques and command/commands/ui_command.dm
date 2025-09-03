/datum/ai_command/ui_act
	// This should do shit when the ai uses ui_act ideally but since I want to prototype this quick
	name = "Click"
	process_required = 5
	var/obj/machinery/machinery
	var/act
	var/atom/user
	var/list/param

/datum/ai_command/ui_act/New(machine, action, params, use)
	. = ..()
	machinery = machine
	act = action
	user = use
	param = params

/datum/ai_command/ui_act/execute()
	machinery.machine_ui_act(act, param, user, ai_called = TRUE)
	..()
