/datum/antagonist_selector/bloodbrother
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

	antag_datum = /datum/antagonist/brother
	antag_flag = ROLE_BROTHER

	/// The smallest teams can be.
	var/minimum_team_size = 2

	var/list/datum/team/brother_team/pre_brother_teams = list()

/datum/antagonist_selector/bloodbrother/Destroy()
	pre_brother_teams = null
	return ..()

/datum/antagonist_selector/bloodbrother/decide_antagonists(num_antagonists)
	var/num_teams = max(1, round(num_antagonists / minimum_team_size))

	for(var/j in 1 to num_teams)
		if(length(candidates) < minimum_team_size) //This shouldn't ever happen but, just in case
			break

		var/datum/team/brother_team/team = new
		// 10% chance to add 1 more member
		var/team_size = prob(10) ? min(minimum_team_size + 1, candidates) : minimum_team_size

		for(var/k in 1 to team_size)
			var/mob/bro = pick_n_take(candidates)
			team.add_member(bro.mind)
			select_antagonist(bro)

		pre_brother_teams += team

/datum/antagonist_selector/bloodbrother/give_antag_datums()
	for(var/datum/team/brother_team/team in pre_brother_teams)
		for(var/datum/mind/M in team.members)
			M.add_antag_datum(/datum/antagonist/brother, team)
