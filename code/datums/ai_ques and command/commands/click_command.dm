/datum/ai_command/click
	// This should do shit when the ai uses ui_act ideally but since I want to prototype this quick
	name = "Click"
	process_required = 10

	// The ai doing the command
	var/obj/machinery/stored_machine
	// The UI action the ai is performing
	var/act
	// The parameters
	var/list/params = list()
	// The ai
	var/mob/living/silicon/ai/artificial

/datum/ai_command/click/New(machine, action, param, ai)
	. = ..()
	stored_machine = machine
	act = action
	params = param
	artificial = ai

/datum/ai_command/click/execute()
	stored_machine.ui_act(act, params, command_called = TRUE, artificial)
	..()
