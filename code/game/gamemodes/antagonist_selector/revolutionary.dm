/datum/antagonist_selector/revolutionary
	//Atleast 1 of any head.
	required_jobs = list(
		list(JOB_SITE_DIRECTOR = 1),
		list(JOB_HUMAN_RESOURCES_OFFICER = 1),
		list(JOB_SECURITY_CAPTAIN = 1),
		list(JOB_ENGINEERING_DIRECTOR = 1),
		list(JOB_MEDICAL_DIRECTOR = 1),
		list(JOB_SCIENCE_DIRECTOR = 1)
	)

	restricted_jobs = list(
		JOB_AI,
		JOB_CYBORG,
		JOB_SITE_DIRECTOR,
		JOB_HUMAN_RESOURCES_OFFICER,
		JOB_COMMUNICATIONS_OFFICER,
		JOB_ETHICS_COMMITTEE_LIAISON,
		JOB_INTERNAL_TRIBUNAL_DEPARTMENT_OFFICER,
		JOB_INTAKE_SPECIALIST,
		JOB_GOC_REP,
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

	antag_flag = ROLE_REV_HEAD
	antag_datum = /datum/antagonist/rev/head

/datum/antagonist_selector/revolutionary/give_antag_datums(datum/game_mode/gamemode)
	var/datum/game_mode/revolution/rev_gamemode = gamemode

	for(var/datum/mind/M in selected_antagonists)
		if(!rev_gamemode.check_eligible(M))
			selected_antagonists -= M
			log_game("Revolution: discarded [M.name] from head revolutionary due to ineligibility.")
			continue

		var/datum/antagonist/rev/head/new_head = new antag_datum()
		new_head.give_flash = TRUE
		new_head.remove_clumsy = TRUE
		M.add_antag_datum(new_head, rev_gamemode.revolution)
