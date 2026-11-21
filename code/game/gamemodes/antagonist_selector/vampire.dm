/datum/antagonist_selector/vampire
	restricted_jobs = list(JOB_CYBORG, JOB_AI)
	protected_jobs = list(
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

	antag_datum = /datum/antagonist/vampire
	antag_flag = ROLE_VAMPIRE

/datum/antagonist_selector/vampire/trim_candidates(list/candidates)
	. = ..()
	for(var/mob/dead/new_player/candidate_player in candidates)
		var/client/candidate_client = GET_CLIENT(candidate_player)
		if (!candidate_client || !candidate_player.mind) // Are they connected?
			candidates.Remove(candidate_player)
			continue

		var/datum/preferences/prefs = candidate_client.prefs
		var/species_type = prefs.read_preference(/datum/preference/choiced/species)
		if(ispath(species_type, /datum/species/ipc))
			candidates.Remove(candidate_player)
			continue
