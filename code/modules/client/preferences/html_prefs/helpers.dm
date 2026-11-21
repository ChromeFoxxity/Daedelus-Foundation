/datum/preferences/proc/update_html()
	usr << output(url_encode(html_create_window()), "preferences_window.preferences_browser:update_content")

/proc/get_job_name(job_title)
	// Job titles are already human-readable via JOB_ defines
	return job_title

/proc/get_faction_class_jobs(faction_id, class_id, player_rank = 0, player_class_id = "")
	var/list/jobs = list()
	if(!faction_id || !class_id)
		return jobs

	switch(faction_id)
		if("foundation")
			switch(class_id)
				if("administrative")
					jobs += list(
						JOB_SITE_DIRECTOR,
						JOB_ETHICS_COMMITTEE_LIAISON,
						JOB_INTERNAL_TRIBUNAL_DEPARTMENT_OFFICER,
						JOB_INTAKE_SPECIALIST,
						JOB_COMMUNICATIONS_OFFICER,
					)
				if("security")
					jobs += list(
						JOB_SECURITY_CAPTAIN,
						JOB_SECURITY_LIEUTENANT,
						JOB_SECURITY_SERGEANT,
						JOB_SECURITY_MEDIC,
						JOB_SECURITY_GUARD,
						JOB_SECURITY_CADET,
					)
				if("tactical")
					jobs += list(
						JOB_TRT_COMMANDER,
						JOB_TRT_SERGEANT,
						JOB_TRT_OPERATOR,
						JOB_TRT_CADET,
					)
				if("research")
					jobs += list(
						JOB_SCIENCE_DIRECTOR,
						JOB_ASSISTANT_SCIENCE_DIRECTOR,
						JOB_SENIOR_ROBOTICIST,
						JOB_SENIOR_RESEARCHER,
						JOB_ROBOTICIST,
						JOB_RESEARCHER,
						JOB_JUNIOR_RESEARCHER,
					)
				if("medical")
					jobs += list(
						JOB_MEDICAL_DIRECTOR,
						JOB_ASSISTANT_MEDICAL_DIRECTOR,
						JOB_SENIOR_DOCTOR,
						JOB_MEDICAL_DOCTOR,
						JOB_MEDICAL_TECHNICIAN,
						JOB_PSYCHOLOGIST,
						JOB_MEDICAL_STUDENT,
					)
				if("engineering")
					jobs += list(
						JOB_ENGINEERING_DIRECTOR,
						JOB_ASSISTANT_ENGINEERING_DIRECTOR,
						JOB_CONTAINMENT_ENGINEER,
						JOB_SENIOR_TECHNICIAN,
						JOB_TECHNICIAN,
						JOB_JUNIOR_TECHNICIAN,
					)
				if("service")
					jobs += list(
						JOB_HUMAN_RESOURCES_OFFICER,
						JOB_COOK,
						JOB_BARTENDER,
						JOB_CHAPLAIN,
						JOB_BOTANIST,
						JOB_JANITOR,
					)
				if("logistics")
					jobs += list(
						JOB_LOGISTICS_OFFICER,
						JOB_LOGISTICS_TECHNICIAN,
					)
				if("general")
					jobs += list(
						JOB_ASSISTANT,
						JOB_DCLASS,
					)

		if("goc")
			jobs += list(JOB_GOC_REP)
		if("uiu")
			jobs += list(JOB_UIU_REP)
		if("serpents_hand")
			jobs += list()
		if("chaos_insurgency")
			jobs += list()

	if (player_rank <= 0 || !player_class_id || player_class_id != class_id)
		return jobs

	var/list/filtered = list()
	for (var/job in jobs)
		var/required = get_required_rank_for_job(class_id, job)
		if (player_rank >= required)
			filtered += job
	return filtered

/proc/get_required_rank_for_job(class_id, job_title)
	switch(class_id)
		if("administrative")
			switch(job_title)
				if(JOB_COMMUNICATIONS_OFFICER)
					return 0
				if(JOB_INTAKE_SPECIALIST)
					return 1
				if(JOB_INTERNAL_TRIBUNAL_DEPARTMENT_OFFICER)
					return 2
				if(JOB_ETHICS_COMMITTEE_LIAISON)
					return 3
				if(JOB_SITE_DIRECTOR)
					return 4
		if("security")
			switch(job_title)
				if(JOB_SECURITY_CADET)
					return 0
				if(JOB_SECURITY_GUARD)
					return 1
				if(JOB_SECURITY_MEDIC)
					return 2
				if(JOB_SECURITY_SERGEANT)
					return 3
				if(JOB_SECURITY_LIEUTENANT)
					return 4
				if(JOB_SECURITY_CAPTAIN)
					return 5
		if("tactical")
			switch(job_title)
				if(JOB_TRT_CADET)
					return 0
				if(JOB_TRT_OPERATOR)
					return 1
				if(JOB_TRT_SERGEANT)
					return 2
				if(JOB_TRT_COMMANDER)
					return 3
		if("research")
			switch(job_title)
				if(JOB_JUNIOR_RESEARCHER)
					return 0
				if(JOB_RESEARCHER)
					return 1
				if(JOB_ROBOTICIST)
					return 2
				if(JOB_SENIOR_RESEARCHER)
					return 3
				if(JOB_SENIOR_ROBOTICIST)
					return 4
				if(JOB_ASSISTANT_SCIENCE_DIRECTOR)
					return 5
				if(JOB_SCIENCE_DIRECTOR)
					return 6
		if("medical")
			switch(job_title)
				if(JOB_MEDICAL_STUDENT)
					return 0
				if(JOB_PSYCHOLOGIST)
					return 1
				if(JOB_MEDICAL_TECHNICIAN)
					return 2
				if(JOB_MEDICAL_DOCTOR)
					return 3
				if(JOB_SENIOR_DOCTOR)
					return 4
				if(JOB_ASSISTANT_MEDICAL_DIRECTOR)
					return 5
				if(JOB_MEDICAL_DIRECTOR)
					return 6
		if("engineering")
			switch(job_title)
				if(JOB_JUNIOR_TECHNICIAN)
					return 0
				if(JOB_TECHNICIAN)
					return 1
				if(JOB_SENIOR_TECHNICIAN)
					return 2
				if(JOB_CONTAINMENT_ENGINEER)
					return 3
				if(JOB_ASSISTANT_ENGINEERING_DIRECTOR)
					return 4
				if(JOB_ENGINEERING_DIRECTOR)
					return 5
		if("service")
			switch(job_title)
				if(JOB_JANITOR)
					return 0
				if(JOB_BOTANIST)
					return 1
				if(JOB_CLOWN)
					return 2
				if(JOB_BARTENDER)
					return 3
				if(JOB_COOK)
					return 4
				if(JOB_HUMAN_RESOURCES_OFFICER)
					return 5
		if("logistics")
			switch(job_title)
				if(JOB_LOGISTICS_TECHNICIAN)
					return 0
				if(JOB_LOGISTICS_OFFICER)
					return 1
		if("general")
			switch(job_title)
				if(JOB_ASSISTANT)
					return 0
				if(JOB_DCLASS)
					return 1
	return 0

/proc/get_job_description(job_title)
	var/datum/job/J = SSjob.GetJob(job_title)
	if(J)
		if(istext(J.description))
			return J.description
	return "No description available."
