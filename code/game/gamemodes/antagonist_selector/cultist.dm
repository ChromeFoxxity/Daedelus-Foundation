/datum/antagonist_selector/cultist
	restricted_jobs = list(
		JOB_AI,
		JOB_CYBORG,
		JOB_DCLASS,
		JOB_CHAPLAIN,
		JOB_SITE_DIRECTOR,
		JOB_HUMAN_RESOURCES_OFFICER,
		JOB_COMMUNICATIONS_OFFICER,
		JOB_ETHICS_COMMITTEE_LIAISON,
		JOB_INTERNAL_TRIBUNAL_DEPARTMENT_OFFICER,
		JOB_INTAKE_SPECIALIST,
		JOB_GOC_REP,
		JOB_UIU_REP,
		JOB_ENGINEERING_DIRECTOR,
		JOB_ASSISTANT_ENGINEERING_DIRECTOR,
		JOB_MEDICAL_DIRECTOR,
		JOB_ASSISTANT_MEDICAL_DIRECTOR,
		JOB_SCIENCE_DIRECTOR,
		JOB_ASSISTANT_SCIENCE_DIRECTOR,
		JOB_LOGISTICS_OFFICER,
		JOB_SECURITY_CAPTAIN,
		JOB_SECURITY_LIEUTENANT,
		JOB_SECURITY_SERGEANT,
		JOB_SECURITY_MEDIC,
		JOB_SECURITY_GUARD,
		JOB_SECURITY_CADET,
		JOB_TRT_COMMANDER,
		JOB_TRT_SERGEANT,
		JOB_TRT_OPERATOR,
		JOB_TRT_CADET,
	)

	antag_datum = /datum/antagonist/cult
	antag_flag = ROLE_CULTIST

/datum/antagonist_selector/cultist/give_antag_datums(datum/game_mode/gamemode)
	var/datum/game_mode/bloodcult/cult_gamemode = gamemode
	cult_gamemode.main_cult = new

	for(var/datum/mind/M in selected_antagonists)
		var/datum/antagonist/cult/new_cultist = new antag_datum()
		new_cultist.cult_team = cult_gamemode.main_cult
		new_cultist.give_equipment = TRUE
		M.add_antag_datum(new_cultist)
		GLOB.pre_setup_antags -= M

	cult_gamemode.main_cult.setup_objectives()
