/datum/ai_command
	/// The name of this command
	var/name = "Basic Ai Command"
	/// Amount of processing this command needs to execute
	var/process_required = 1
	/// Amount of processing we've done
	var/processes = 0
	/// if this command even exists
	var/live = TRUE

/// This runs on every processing from the ai_quem if the processes reach the amount required the ai command will execute
/datum/ai_command/proc/progress(processing_amount)
	processes += processing_amount
	if(processes >= process_required)
		execute()

/// Do something
/datum/ai_command/proc/execute()
	processes = 0
	live = FALSE
	qdel(src)
