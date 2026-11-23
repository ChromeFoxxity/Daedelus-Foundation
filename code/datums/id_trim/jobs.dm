/**
 * This file contains all the trims associated with station jobs.
 * It also contains special prisoner trims and the miner's spare ID trim.
 */

#ifndef ACCESS_LCZ
#define ACCESS_LCZ 100
#endif
#ifndef ACCESS_HCZ
#define ACCESS_HCZ 101
#endif
#ifndef ACCESS_EZ
#define ACCESS_EZ 102
#endif
#ifndef ACCESS_TOX
#define ACCESS_TOX 112
#endif
#ifndef ACCESS_TOX_STORAGE
#define ACCESS_TOX_STORAGE 113
#endif
#ifndef ACCESS_VIROLOGY
#define ACCESS_VIROLOGY 118
#endif
#ifndef ACCESS_XENOARCH
#define ACCESS_XENOARCH 123
#endif

/// ID Trims for station jobs.
/datum/id_trim/job
	trim_state = "trim_assistant"

	/// The extra access the card should have when CONFIG_GET(flag/jobs_have_minimal_access) is FALSE.
	var/list/extra_access = list()
	/// The extra wildcard_access the card should have when CONFIG_GET(flag/jobs_have_minimal_access) is FALSE.
	var/list/extra_wildcard_access = list()
	/// The base access the card should have when CONFIG_GET(flag/jobs_have_minimal_access) is TRUE.
	var/list/minimal_access = list()
	/// The base wildcard_access the card should have when CONFIG_GET(flag/jobs_have_minimal_access) is TRUE.
	var/list/minimal_wildcard_access = list()
	/// Static list. Cache of any mapping config job changes.
	var/static/list/job_changes
	/// What config entry relates to this job. Should be a lowercase job name with underscores for spaces, eg "prisoner" "science_director" "head_of_security"
	var/config_job
	/// An ID card with an access in this list can apply this trim to IDs or use it as a job template when adding access to a card. If the list is null, cannot be used as a template. Should be Head of Staff or ID Console accesses or it may do nothing.
	var/list/template_access
	/// The typepath to the job datum from the id_trim. This is converted to one of the job singletons in New().
	var/datum/job/job = /datum/job/unassigned

/datum/id_trim/job/New()
	if(ispath(job))
		job = SSjob.GetJobType(job)

	if(isnull(job_changes))
		job_changes = SSmapping.config.job_changes

	if(!length(job_changes) || !config_job)
		refresh_trim_access()
		return

	var/list/access_changes = job_changes[config_job]

	if(!length(access_changes))
		refresh_trim_access()
		return

	if(islist(access_changes["additional_access"]))
		extra_access |= access_changes["additional_access"]
	if(islist(access_changes["additional_minimal_access"]))
		minimal_access |= access_changes["additional_minimal_access"]
	if(islist(access_changes["additional_wildcard_access"]))
		extra_wildcard_access |= access_changes["additional_wildcard_access"]
	if(islist(access_changes["additional_minimal_wildcard_access"]))
		minimal_wildcard_access |= access_changes["additional_minimal_wildcard_access"]

	refresh_trim_access()

/**
 * Goes through various non-map config settings and modifies the trim's access based on this.
 *
 * Returns TRUE if the config is loaded, FALSE otherwise.
 */
/datum/id_trim/job/proc/refresh_trim_access()
	// If there's no config loaded then assume minimal access.
	if(!config)
		access = minimal_access.Copy()
		wildcard_access = minimal_wildcard_access.Copy()
		return FALSE

	// There is a config loaded. Check for the jobs_have_minimal_access flag being set.
	if(CONFIG_GET(flag/jobs_have_minimal_access))
		access = minimal_access.Copy()
		wildcard_access = minimal_wildcard_access.Copy()
	else
		access = minimal_access | extra_access
		wildcard_access = minimal_wildcard_access | extra_wildcard_access

	// If the config has global maint access set, we always want to add maint access.
	if(CONFIG_GET(flag/everyone_has_maint_access))
		access |= list(ACCESS_ENGINEERING_LVL1)

	return TRUE

/datum/id_trim/job/assistant
	assignment = "Assistant"
	trim_state = "trim_assistant"
	sechud_icon_state = SECHUD_ASSISTANT
	extra_access = list()
	minimal_access = list()
	config_job = "assistant"
	template_access = list(ACCESS_ADMIN_LVL4, ACCESS_ADMIN_LVL5)
	job = /datum/job/assistant

/datum/id_trim/job/assistant/refresh_trim_access()
	. = ..()

	if(!.)
		return

	// Config has assistant maint access set.
	if(CONFIG_GET(flag/assistants_have_maint_access))
		access |= list(ACCESS_ENGINEERING_LVL1)

//

/// ADMINISTRATIVE STAFF JOBS

//

/datum/id_trim/job/site_director
	assignment = JOB_SITE_DIRECTOR
	intern_alt_name = "Junior Site Director"
	trim_state = "gold_level5"
	sechud_icon_state = SECHUD_SITE_DIRECTOR
	template_access = list(
		ACCESS_ADMIN_LVL5,
		ACCESS_SERVICE_LVL5,
	)
	config_job = "site_director"
	job = /datum/job/site_director

/// Captain gets all station accesses hardcoded in because it's the Captain.
/datum/id_trim/job/site_director/New()
	extra_access |= (SSid_access.get_flag_access_list(ACCESS_FLAG_COMMON) + SSid_access.get_flag_access_list(ACCESS_FLAG_COMMAND))
	extra_wildcard_access |= (SSid_access.get_flag_access_list(ACCESS_FLAG_PRV_COMMAND) + SSid_access.get_flag_access_list(ACCESS_FLAG_CAPTAIN))
	minimal_access |= (SSid_access.get_flag_access_list(ACCESS_FLAG_COMMON) + SSid_access.get_flag_access_list(ACCESS_FLAG_COMMAND))
	minimal_wildcard_access |= (SSid_access.get_flag_access_list(ACCESS_FLAG_PRV_COMMAND) + SSid_access.get_flag_access_list(ACCESS_FLAG_CAPTAIN))

	return ..()

/datum/id_trim/job/ethics_committee_liaison
	assignment = JOB_ETHICS_COMMITTEE_LIAISON
	intern_alt_name = "Junior Ethics Committee Liaison"
	trim_state = "silver_level4"
	sechud_icon_state = SECHUD_ETHICS_COMMITTEE_LIAISON
	minimal_access = list(
		ACCESS_ADMIN_LVL1,
		ACCESS_ADMIN_LVL2,
		ACCESS_ADMIN_LVL3,
		ACCESS_SECURITY_LVL1,
		ACCESS_SECURITY_LVL2,
	)
	minimal_wildcard_access = list(
		ACCESS_ADMIN_LVL4,
	)
	extra_access = list()
	extra_wildcard_access = list()
	minimal_wildcard_access = list()
	template_access = list(
		ACCESS_ADMIN_LVL5,
		ACCESS_SERVICE_LVL5,
	)
	config_job = "ecl"
	job = /datum/job/ethics_committee_liaison

/datum/id_trim/job/internal_tribunal_department_officer
	assignment = JOB_INTERNAL_TRIBUNAL_DEPARTMENT_OFFICER
	intern_alt_name = "Junior Internal Tribunal Department Officer"
	trim_state = "silver_level3"
	sechud_icon_state = SECHUD_INTERNAL_TRIBUNAL_DEPARTMENT_OFFICER
	minimal_access = list(
		ACCESS_ADMIN_LVL1,
		ACCESS_ADMIN_LVL2,
		ACCESS_SECURITY_LVL1,
		ACCESS_SECURITY_LVL2,
	)
	minimal_wildcard_access = list(
		ACCESS_ADMIN_LVL3,
	)
	extra_access = list()
	extra_wildcard_access = list()
	minimal_wildcard_access = list()
	template_access = list(
		ACCESS_ADMIN_LVL5,
		ACCESS_SERVICE_LVL5,
	)
	config_job = "itdo"
	job = /datum/job/internal_tribunal_department_officer

/datum/id_trim/job/intake_specialist
	assignment = JOB_INTAKE_SPECIALIST
	intern_alt_name = "Trainee Intake Specialist"
	trim_state = "silver_level2"
	sechud_icon_state = SECHUD_INTAKE_SPECIALIST
	minimal_access = list(
		ACCESS_ADMIN_LVL1,
		ACCESS_ADMIN_LVL2,
		ACCESS_SECURITY_LVL1,
	)
	minimal_wildcard_access = list()
	extra_access = list()
	extra_wildcard_access = list()
	minimal_wildcard_access = list()
	template_access = list(
		ACCESS_ADMIN_LVL5,
		ACCESS_SERVICE_LVL5,
	)
	config_job = "intake_specialist"
	job = /datum/job/intake_specialist

/datum/id_trim/job/goc_rep
	assignment = JOB_GOC_REP
	intern_alt_name = "Global Occult Coalition Junior Representative"
	trim_state = "silver_level2"
	sechud_icon_state = SECHUD_GOI_REP
	minimal_access = list(
		ACCESS_ADMIN_LVL1,
		ACCESS_ADMIN_LVL2,
	)
	extra_access = list()
	extra_wildcard_access = list()
	minimal_wildcard_access = list()
	template_access = list(
		ACCESS_ADMIN_LVL5,
		ACCESS_SERVICE_LVL5,
	)
	config_job = "goc_rep"
	job = /datum/job/goc_rep

/datum/id_trim/job/uiu_rep
	assignment = JOB_UIU_REP
	intern_alt_name = "Unusual Incidents Unit Junior Representative"
	trim_state = "silver_level2"
	sechud_icon_state = SECHUD_GOI_REP
	minimal_access = list(
		ACCESS_ADMIN_LVL1,
		ACCESS_ADMIN_LVL2,
	)
	extra_access = list()
	extra_wildcard_access = list()
	minimal_wildcard_access = list()
	template_access = list(
		ACCESS_ADMIN_LVL5,
		ACCESS_SERVICE_LVL5,
	)
	config_job = "uiu_rep"
	job = /datum/job/uiu_rep

/datum/id_trim/job/communications_officer
	assignment = JOB_COMMUNICATIONS_OFFICER
	intern_alt_name = "Communications Officer-in-Training"
	trim_state = "silver_level2"
	sechud_icon_state = SECHUD_communications_officer
	minimal_access = list(
		ACCESS_ADMIN_LVL1,
		ACCESS_ADMIN_LVL2,
		ACCESS_SERVICE_LVL1,
		ACCESS_MEDICAL_LVL1,
		ACCESS_ENGINEERING_LVL1,
		ACCESS_ENGINEERING_LVL2,
		ACCESS_SCIENCE_LVL1,
	)
	extra_access = list()
	extra_wildcard_access = list()
	minimal_wildcard_access = list()
	template_access = list(
		ACCESS_ADMIN_LVL5,
		ACCESS_SERVICE_LVL5,
	)
	config_job = "communications_officer"
	job = /datum/job/communications_officer

//

/// SECURITY DEPARTMENT JOBS

//

/datum/id_trim/job/security_captain
	assignment = JOB_SECURITY_CAPTAIN
	intern_alt_name = "Junior Security Captain"
	trim_state = "level5"
	sechud_icon_state = SECHUD_SECURITY_CAPTAIN
	minimal_access = list(
		ACCESS_ADMIN_LVL1,
		ACCESS_ADMIN_LVL2,
		ACCESS_MEDICAL_LVL1,
		ACCESS_MEDICAL_LVL2,
		ACCESS_SCIENCE_LVL1,
		ACCESS_ENGINEERING_LVL1,
		ACCESS_LOGISTICS_LVL1,
		ACCESS_LOGISTICS_LVL2,
		ACCESS_SERVICE_LVL1,
		ACCESS_SECURITY_LVL1,
		ACCESS_SECURITY_LVL2,
		ACCESS_SECURITY_LVL3,
		ACCESS_SECURITY_LVL4,
	)
	extra_access = list()
	extra_wildcard_access = list()
	minimal_wildcard_access = list(
		ACCESS_SECURITY_LVL5,
	)
	template_access = list(
		ACCESS_ADMIN_LVL5,
		ACCESS_SERVICE_LVL5,
	)
	job = /datum/job/security_captain
	config_job = "security_captain"

/datum/id_trim/job/security_lieutenant
	assignment = JOB_SECURITY_LIEUTENANT
	intern_alt_name = "Security Master Sergeant"
	trim_state = "level4"
	sechud_icon_state = SECHUD_SECURITY_LIEUTENANT
	minimal_access = list(
		ACCESS_ADMIN_LVL1,
		ACCESS_SCIENCE_LVL1,
		ACCESS_MEDICAL_LVL1,
		ACCESS_LOGISTICS_LVL1,
		ACCESS_SERVICE_LVL1,
		ACCESS_ENGINEERING_LVL1,
		ACCESS_SECURITY_LVL1,
		ACCESS_SECURITY_LVL2,
		ACCESS_SECURITY_LVL3,
		ACCESS_SECURITY_LVL4,
	)
	extra_access = list(
		ACCESS_MEDICAL_LVL2,
		ACCESS_LOGISTICS_LVL2,
	)
	extra_wildcard_access = list()
	minimal_wildcard_access = list()
	template_access = list(
		ACCESS_ADMIN_LVL5,
		ACCESS_SERVICE_LVL5,
		ACCESS_SECURITY_LVL5,
	)
	config_job = "security_lieutenant"
	job = /datum/job/security_lieutenant

/datum/id_trim/job/security_sergeant
	assignment = JOB_SECURITY_SERGEANT
	intern_alt_name = "Security Corporal"
	trim_state = "level3"
	sechud_icon_state = SECHUD_SECURITY_SERGEANT
	minimal_access = list(
		ACCESS_LOGISTICS_LVL1,
		ACCESS_SERVICE_LVL1,
		ACCESS_ENGINEERING_LVL1,
		ACCESS_SECURITY_LVL1,
		ACCESS_SECURITY_LVL2,
		ACCESS_SECURITY_LVL3,
	)
	extra_access = list(
		ACCESS_SCIENCE_LVL1,
		ACCESS_MEDICAL_LVL1,
	)
	extra_wildcard_access = list()
	minimal_wildcard_access = list()
	template_access = list(
		ACCESS_ADMIN_LVL5,
		ACCESS_SERVICE_LVL5,
		ACCESS_SECURITY_LVL5,
	)
	config_job = "security_sergeant"
	job = /datum/job/security_sergeant

/datum/id_trim/job/security_medic
	assignment = JOB_SECURITY_MEDIC
	intern_alt_name = "Junior Security Combat Medic"
	trim_state = "level2"
	sechud_icon_state = SECHUD_SECURITY_MEDIC
	minimal_access = list(
		ACCESS_LOGISTICS_LVL1,
		ACCESS_ENGINEERING_LVL1,
		ACCESS_MEDICAL_LVL1,
		ACCESS_MEDICAL_LVL2,
		ACCESS_SECURITY_LVL1,
		ACCESS_SECURITY_LVL2,
	)
	extra_access = list(
		ACCESS_SERVICE_LVL1,
		ACCESS_SCIENCE_LVL1,
		ACCESS_MEDICAL_LVL3,
	)
	extra_wildcard_access = list()
	minimal_wildcard_access = list()
	template_access = list(
		ACCESS_ADMIN_LVL5,
		ACCESS_SERVICE_LVL5,
		ACCESS_SECURITY_LVL5,
	)
	config_job = "security_medic"
	job = /datum/job/security_medic

/datum/id_trim/job/security_guard
	assignment = JOB_SECURITY_GUARD
	trim_state = "level2"
	sechud_icon_state = SECHUD_SECURITY_GUARD
	minimal_access = list(
		ACCESS_LOGISTICS_LVL1,
		ACCESS_ENGINEERING_LVL1,
		ACCESS_SECURITY_LVL1,
		ACCESS_SECURITY_LVL2,
	)
	extra_access = list(
		ACCESS_SERVICE_LVL1,
		ACCESS_SCIENCE_LVL1,
		ACCESS_MEDICAL_LVL1,
		ACCESS_SECURITY_LVL3,
	)
	extra_wildcard_access = list()
	minimal_wildcard_access = list()
	template_access = list(
		ACCESS_ADMIN_LVL5,
		ACCESS_SERVICE_LVL5,
		ACCESS_SECURITY_LVL5,
	)
	config_job = "security_guard"
	job = /datum/job/security_guard

/datum/id_trim/job/security_cadet
	assignment = JOB_SECURITY_CADET
	trim_state = "level1"
	sechud_icon_state = SECHUD_SECURITY_CADET
	minimal_access = list(
		ACCESS_SECURITY_LVL1,
	)
	extra_access = list(
		ACCESS_ENGINEERING_LVL1,
		ACCESS_SERVICE_LVL1,
		ACCESS_SCIENCE_LVL1,
		ACCESS_MEDICAL_LVL1,
		ACCESS_SECURITY_LVL2,
	)
	extra_wildcard_access = list()
	minimal_wildcard_access = list()
	template_access = list(
		ACCESS_ADMIN_LVL5,
		ACCESS_SERVICE_LVL5,
		ACCESS_SECURITY_LVL5,
	)
	config_job = "security_cadet"
	job = /datum/job/security_cadet

//

/// SCIENTIFIC DEPARTMENT JOBS

//

/datum/id_trim/job/science_director
	assignment = JOB_SCIENCE_DIRECTOR
	intern_alt_name = "Associate Science Director"
	trim_state = "level5"
	sechud_icon_state = SECHUD_SCIENCE_DIRECTOR
	minimal_access = list(
		ACCESS_ADMIN_LVL1,
		ACCESS_ADMIN_LVL2,
		ACCESS_MEDICAL_LVL1,
		ACCESS_MEDICAL_LVL2,
		ACCESS_SCIENCE_LVL1,
		ACCESS_SCIENCE_LVL2,
		ACCESS_SCIENCE_LVL3,
		ACCESS_SCIENCE_LVL4,
		ACCESS_ENGINEERING_LVL1,
	)
	extra_access = list()
	extra_wildcard_access = list()
	minimal_wildcard_access = list(
		ACCESS_SCIENCE_LVL5,
	)
	template_access = list(
		ACCESS_ADMIN_LVL5,
		ACCESS_SERVICE_LVL5,
	)
	job = /datum/job/science_director
	config_job = "science_director"

/datum/id_trim/job/assistant_science_director
	assignment = JOB_ASSISTANT_SCIENCE_DIRECTOR
	intern_alt_name = "Junior Assistant Science Director"
	trim_state = "level4"
	sechud_icon_state = SECHUD_ASSISTANT_SCIENCE_DIRECTOR
	minimal_access = list(
		ACCESS_ADMIN_LVL1,
		ACCESS_MEDICAL_LVL1,
		ACCESS_SCIENCE_LVL1,
		ACCESS_SCIENCE_LVL2,
		ACCESS_SCIENCE_LVL3,
		ACCESS_ENGINEERING_LVL1,
	)
	extra_access = list()
	extra_wildcard_access = list()
	minimal_wildcard_access = list(
		ACCESS_SCIENCE_LVL4,
	)
	template_access = list(
		ACCESS_ADMIN_LVL5,
		ACCESS_SERVICE_LVL5,
		ACCESS_SCIENCE_LVL5,
	)
	job = /datum/job/assistant_science_director
	config_job = "assistant_science_director"

/datum/id_trim/job/senior_roboticist
	assignment = JOB_SENIOR_ROBOTICIST
	intern_alt_name = "Senior Roboticist-in-Training"
	trim_state = "level2"
	sechud_icon_state = SECHUD_SENIOR_ROBOTICIST
	minimal_access = list(
		ACCESS_MEDICAL_LVL1,
		ACCESS_SCIENCE_LVL1,
		ACCESS_SCIENCE_LVL2,
		ACCESS_SCIENCE_LVL3,
		ACCESS_ENGINEERING_LVL1,
	)
	extra_access = list()
	extra_wildcard_access = list()
	minimal_wildcard_access = list()
	template_access = list(
		ACCESS_ADMIN_LVL5,
		ACCESS_SERVICE_LVL5,
		ACCESS_SCIENCE_LVL5,
	)
	job = /datum/job/senior_roboticist
	config_job = "senior_roboticist"

/datum/id_trim/job/senior_researcher
	assignment = JOB_SENIOR_RESEARCHER
	intern_alt_name = "Senior Researcher-in-Training"
	trim_state = "level3"
	sechud_icon_state = SECHUD_SENIOR_RESEARCHER
	minimal_access = list(
		ACCESS_MEDICAL_LVL1,
		ACCESS_SCIENCE_LVL1,
		ACCESS_SCIENCE_LVL2,
		ACCESS_SCIENCE_LVL3,
	)
	extra_access = list()
	extra_wildcard_access = list()
	minimal_wildcard_access = list()
	template_access = list(
		ACCESS_ADMIN_LVL5,
		ACCESS_SERVICE_LVL5,
		ACCESS_SCIENCE_LVL5,
	)
	job = /datum/job/senior_researcher
	config_job = "senior_researcher"

/datum/id_trim/job/roboticist
	assignment = JOB_ROBOTICIST
	intern_alt_name = "Junior Roboticist"
	trim_state = "level2"
	sechud_icon_state = SECHUD_ROBOTICIST
	minimal_access = list(
		ACCESS_SCIENCE_LVL1,
		ACCESS_SCIENCE_LVL2,
		ACCESS_ENGINEERING_LVL1,
	)
	extra_access = list()
	extra_wildcard_access = list()
	minimal_wildcard_access = list()
	template_access = list(
		ACCESS_ADMIN_LVL5,
		ACCESS_SERVICE_LVL5,
		ACCESS_SCIENCE_LVL5,
	)
	job = /datum/job/roboticist
	config_job = "roboticist"

/datum/id_trim/job/researcher
	assignment = JOB_RESEARCHER
	intern_alt_name = "Associate Researcher"
	trim_state = "level2"
	sechud_icon_state = SECHUD_RESEARCHER
	minimal_access = list(
		ACCESS_SCIENCE_LVL1,
		ACCESS_SCIENCE_LVL2,
	)
	extra_access = list()
	extra_wildcard_access = list()
	minimal_wildcard_access = list()
	template_access = list(
		ACCESS_ADMIN_LVL5,
		ACCESS_SERVICE_LVL5,
		ACCESS_SCIENCE_LVL5,
	)
	job = /datum/job/researcher
	config_job = "researcher"

/datum/id_trim/job/junior_researcher
	assignment = JOB_JUNIOR_RESEARCHER
	trim_state = "level1"
	sechud_icon_state = SECHUD_JUNIOR_RESEARCHER
	minimal_access = list(
		ACCESS_SCIENCE_LVL1,
	)
	extra_access = list()
	extra_wildcard_access = list()
	minimal_wildcard_access = list()
	template_access = list(
		ACCESS_ADMIN_LVL5,
		ACCESS_SERVICE_LVL5,
		ACCESS_SCIENCE_LVL5,
	)
	job = /datum/job/junior_researcher
	config_job = "junior_researcher"

//

/// MEDICAL DEPARTMENT JOBS

//

/datum/id_trim/job/medical_director
	assignment = JOB_MEDICAL_DIRECTOR
	intern_alt_name = "Associate Medical Director"
	trim_state = "level5"
	sechud_icon_state = SECHUD_MEDICAL_DIRECTOR
	minimal_access = list(
		ACCESS_ADMIN_LVL1,
		ACCESS_ADMIN_LVL2,
		ACCESS_MEDICAL_LVL1,
		ACCESS_MEDICAL_LVL2,
		ACCESS_MEDICAL_LVL3,
		ACCESS_MEDICAL_LVL4,
		ACCESS_SCIENCE_LVL1,
		ACCESS_ENGINEERING_LVL1,
	)
	extra_access = list()
	extra_wildcard_access = list()
	minimal_wildcard_access = list(
		ACCESS_MEDICAL_LVL5,
	)
	template_access = list(
		ACCESS_ADMIN_LVL5,
		ACCESS_SERVICE_LVL5,
	)
	job = /datum/job/medical_director
	config_job = "medical_director"

/datum/id_trim/job/assistant_medical_director
	assignment = JOB_ASSISTANT_MEDICAL_DIRECTOR
	intern_alt_name = "Junior Assistant Medical Director"
	trim_state = "level4"
	sechud_icon_state = SECHUD_ASSISTANT_MEDICAL_DIRECTOR
	minimal_access = list(
		ACCESS_ADMIN_LVL1,
		ACCESS_MEDICAL_LVL1,
		ACCESS_MEDICAL_LVL2,
		ACCESS_MEDICAL_LVL3,
		ACCESS_SCIENCE_LVL1,
		ACCESS_ENGINEERING_LVL1,
	)
	extra_access = list()
	extra_wildcard_access = list()
	minimal_wildcard_access = list(
		ACCESS_MEDICAL_LVL4,
	)
	template_access = list(
		ACCESS_ADMIN_LVL5,
		ACCESS_SERVICE_LVL5,
		ACCESS_MEDICAL_LVL5,
	)
	job = /datum/job/assistant_medical_director
	config_job = "assistant_medical_director"

/datum/id_trim/job/senior_doctor
	assignment = JOB_SENIOR_DOCTOR
	intern_alt_name = "Senior Doctor-in-Training"
	trim_state = "level3"
	sechud_icon_state = SECHUD_SENIOR_DOCTOR
	minimal_access = list(
		ACCESS_MEDICAL_LVL1,
		ACCESS_MEDICAL_LVL2,
		ACCESS_MEDICAL_LVL3,
	)
	extra_access = list()
	extra_wildcard_access = list()
	minimal_wildcard_access = list()
	template_access = list(
		ACCESS_ADMIN_LVL5,
		ACCESS_SERVICE_LVL5,
		ACCESS_MEDICAL_LVL5,
	)
	job = /datum/job/senior_doctor
	config_job = "senior_doctor"

/datum/id_trim/job/medical_doctor
	assignment = JOB_MEDICAL_DOCTOR
	intern_alt_name = "Resident Doctor"
	trim_state = "level2"
	sechud_icon_state = SECHUD_MEDICAL_DOCTOR
	minimal_access = list(
		ACCESS_MEDICAL_LVL1,
		ACCESS_MEDICAL_LVL2,
	)
	extra_access = list()
	extra_wildcard_access = list()
	minimal_wildcard_access = list()
	template_access = list(
		ACCESS_ADMIN_LVL5,
		ACCESS_SERVICE_LVL5,
		ACCESS_MEDICAL_LVL5,
	)
	job = /datum/job/medical_doctor
	config_job = "medical_doctor"

/datum/id_trim/job/medical_technician
	assignment = JOB_MEDICAL_TECHNICIAN
	intern_alt_name = "Medical Technician Trainee"
	trim_state = "level2"
	sechud_icon_state = SECHUD_MEDICAL_TECHNICIAN
	minimal_access = list(
		ACCESS_MEDICAL_LVL1,
		ACCESS_MEDICAL_LVL2,
		ACCESS_LOGISTICS_LVL1,
		ACCESS_SERVICE_LVL1,
		ACCESS_ENGINEERING_LVL1,
	)
	extra_access = list()
	extra_wildcard_access = list()
	minimal_wildcard_access = list()
	template_access = list(
		ACCESS_ADMIN_LVL5,
		ACCESS_SERVICE_LVL5,
		ACCESS_MEDICAL_LVL5,
	)
	job = /datum/job/medical_technician
	config_job = "medical_technician"

/datum/id_trim/job/psychologist
	assignment = JOB_PSYCHOLOGIST
	trim_state = "level1"
	sechud_icon_state = SECHUD_PSYCHOLOGIST
	minimal_access = list(
		ACCESS_MEDICAL_LVL1,
		ACCESS_SERVICE_LVL1,
	)
	extra_access = list()
	extra_wildcard_access = list()
	minimal_wildcard_access = list()
	template_access = list(
		ACCESS_ADMIN_LVL5,
		ACCESS_SERVICE_LVL5,
		ACCESS_MEDICAL_LVL5,
	)
	job = /datum/job/psychologist
	config_job = "psychologist"

/datum/id_trim/job/medical_student
	assignment = JOB_MEDICAL_STUDENT
	trim_state = "level1"
	sechud_icon_state = SECHUD_MEDICAL_STUDENT
	minimal_access = list(
		ACCESS_MEDICAL_LVL1,
	)
	extra_access = list()
	extra_wildcard_access = list()
	minimal_wildcard_access = list()
	template_access = list(
		ACCESS_ADMIN_LVL5,
		ACCESS_SERVICE_LVL5,
		ACCESS_MEDICAL_LVL5,
	)
	job = /datum/job/medical_student
	config_job = "medical_student"

//

/// ENGINEERING DEPARTMENT JOBS

//

/datum/id_trim/job/engineering_director
	assignment = JOB_ENGINEERING_DIRECTOR
	intern_alt_name = "Associate Engineering Director"
	trim_state = "level5"
	sechud_icon_state = SECHUD_ENGINEERING_DIRECTOR
	minimal_access = list(
		ACCESS_ADMIN_LVL1,
		ACCESS_ADMIN_LVL2,
		ACCESS_ENGINEERING_LVL1,
		ACCESS_ENGINEERING_LVL2,
		ACCESS_ENGINEERING_LVL3,
		ACCESS_ENGINEERING_LVL4,
		ACCESS_SCIENCE_LVL1,
	)
	extra_access = list()
	extra_wildcard_access = list()
	minimal_wildcard_access = list(
		ACCESS_ENGINEERING_LVL5,
	)
	template_access = list(
		ACCESS_ADMIN_LVL5,
		ACCESS_SERVICE_LVL5,
	)
	job = /datum/job/engineering_director
	config_job = "engineering_director"

/datum/id_trim/job/assistant_engineering_director
	assignment = JOB_ASSISTANT_ENGINEERING_DIRECTOR
	intern_alt_name = "Junior Assistant Engineering Director"
	trim_state = "level4"
	sechud_icon_state = SECHUD_ASSISTANT_ENGINEERING_DIRECTOR
	minimal_access = list(
		ACCESS_ADMIN_LVL1,
		ACCESS_ENGINEERING_LVL1,
		ACCESS_ENGINEERING_LVL2,
		ACCESS_ENGINEERING_LVL3,
		ACCESS_SCIENCE_LVL1,
	)
	extra_access = list()
	extra_wildcard_access = list()
	minimal_wildcard_access = list(
		ACCESS_ENGINEERING_LVL4,
	)
	template_access = list(
		ACCESS_ADMIN_LVL5,
		ACCESS_SERVICE_LVL5,
		ACCESS_ENGINEERING_LVL5,
	)
	job = /datum/job/assistant_engineering_director
	config_job = "assistant_engineering_director"

/datum/id_trim/job/containment_engineer
	assignment = JOB_CONTAINMENT_ENGINEER
	intern_alt_name = "Junior Containment Engineer"
	trim_state = "level3"
	sechud_icon_state = SECHUD_CONTAINMENT_ENGINEER
	minimal_access = list(
		ACCESS_ENGINEERING_LVL1,
		ACCESS_ENGINEERING_LVL2,
		ACCESS_ENGINEERING_LVL3,
		ACCESS_SCIENCE_LVL1,
		ACCESS_SCIENCE_LVL2,
	)
	extra_access = list()
	extra_wildcard_access = list()
	minimal_wildcard_access = list()
	template_access = list(
		ACCESS_ADMIN_LVL5,
		ACCESS_SERVICE_LVL5,
		ACCESS_ENGINEERING_LVL5,
	)
	job = /datum/job/containment_engineer
	config_job = "containment_engineer"

/datum/id_trim/job/senior_technician
	assignment = JOB_SENIOR_TECHNICIAN
	intern_alt_name = "Senior Technician-in-Training"
	trim_state = "level3"
	sechud_icon_state = SECHUD_SENIOR_TECHNICIAN
	minimal_access = list(
		ACCESS_ENGINEERING_LVL1,
		ACCESS_ENGINEERING_LVL2,
		ACCESS_ENGINEERING_LVL3,
	)
	extra_access = list()
	extra_wildcard_access = list()
	minimal_wildcard_access = list()
	template_access = list(
		ACCESS_ADMIN_LVL5,
		ACCESS_SERVICE_LVL5,
		ACCESS_ENGINEERING_LVL5,
	)
	job = /datum/job/senior_technician
	config_job = "senior_technician"

/datum/id_trim/job/facility_technician
	assignment = JOB_FACILITY_TECHNICIAN
	intern_alt_name = "Associate Facility Technician"
	trim_state = "level2"
	sechud_icon_state = SECHUD_FACILITY_TECHNICIAN
	minimal_access = list(
		ACCESS_ENGINEERING_LVL1,
		ACCESS_ENGINEERING_LVL2,
	)
	extra_access = list()
	extra_wildcard_access = list()
	minimal_wildcard_access = list()
	template_access = list(
		ACCESS_ADMIN_LVL5,
		ACCESS_SERVICE_LVL5,
		ACCESS_ENGINEERING_LVL5,
	)
	job = /datum/job/facility_technician
	config_job = "facility_technician"

/datum/id_trim/job/junior_technician
	assignment = JOB_JUNIOR_TECHNICIAN
	trim_state = "level1"
	sechud_icon_state = SECHUD_JUNIOR_TECHNICIAN
	minimal_access = list(
		ACCESS_ENGINEERING_LVL1,
		ACCESS_ENGINEERING_LVL2, // I have to do this since Level 1 is maintenance.
	)
	extra_access = list()
	extra_wildcard_access = list()
	minimal_wildcard_access = list()
	template_access = list(
		ACCESS_ADMIN_LVL5,
		ACCESS_SERVICE_LVL5,
		ACCESS_ENGINEERING_LVL5,
	)
	job = /datum/job/junior_technician
	config_job = "junior_technician"

//

/// LOGISTICS DEPARTMENT JOBS

//

/datum/id_trim/job/logistics_officer
	assignment = JOB_LOGISTICS_OFFICER
	intern_alt_name = "Associate Logistics Officer"
	trim_state = "level4"
	sechud_icon_state = SECHUD_LOGISTICS_OFFICER
	minimal_access = list(
		ACCESS_ADMIN_LVL1,
		ACCESS_LOGISTICS_LVL1,
		ACCESS_LOGISTICS_LVL2,
		ACCESS_LOGISTICS_LVL3,
		ACCESS_ENGINEERING_LVL1,
	)
	extra_access = list()
	extra_wildcard_access = list()
	minimal_wildcard_access = list(
		ACCESS_LOGISTICS_LVL4,
	)
	template_access = list(
		ACCESS_ADMIN_LVL5,
		ACCESS_SERVICE_LVL5,
	)
	job = /datum/job/logistics_officer
	config_job = "logistics_officer"

/datum/id_trim/job/logistics_technician
	assignment = JOB_LOGISTICS_TECHNICIAN
	intern_alt_name = "Junior Logistics Technician"
	trim_state = "level2"
	sechud_icon_state = SECHUD_LOGISTICS_TECHNICIAN
	minimal_access = list(
		ACCESS_LOGISTICS_LVL1,
		ACCESS_LOGISTICS_LVL2,
	)
	extra_access = list()
	extra_wildcard_access = list()
	minimal_wildcard_access = list()
	template_access = list(
		ACCESS_ADMIN_LVL5,
		ACCESS_SERVICE_LVL5,
		ACCESS_LOGISTICS_LVL4,
	)
	job = /datum/job/logistics_technician
	config_job = "logistics_technician"

// SERVICE JOBS

/datum/id_trim/job/human_resources_officer
	assignment = JOB_HUMAN_RESOURCES_OFFICER
	intern_alt_name = "Junior Human Resources Officer"
	trim_state = "silver_level5"
	sechud_icon_state = SECHUD_HUMAN_RESOURCES_OFFICER
	minimal_access = list(
		ACCESS_ADMIN_LVL1,
		ACCESS_ADMIN_LVL2,
		ACCESS_ENGINEERING_LVL1,
		ACCESS_LOGISTICS_LVL1,
		ACCESS_LOGISTICS_LVL2,
		ACCESS_SERVICE_LVL1,
		ACCESS_SERVICE_LVL2,
		ACCESS_SERVICE_LVL3,
		ACCESS_SERVICE_LVL4,
	)
	minimal_wildcard_access = list(
		ACCESS_SERVICE_LVL5,
	)
	extra_access = list()
	extra_wildcard_access = list()
	minimal_wildcard_access = list()
	template_access = list(
		ACCESS_ADMIN_LVL5,
		ACCESS_SERVICE_LVL5,
	)
	config_job = "human_resources_officer"
	job = /datum/job/human_resources_officer

/datum/id_trim/job/bartender
	assignment = JOB_BARTENDER
	intern_alt_name = "Intern Bartender"
	trim_state = "level3"
	sechud_icon_state = SECHUD_BARTENDER
	minimal_access = list(
		ACCESS_SERVICE_LVL1,
		ACCESS_SERVICE_LVL2,
		ACCESS_SERVICE_LVL3,
	)
	extra_access = list()
	extra_wildcard_access = list()
	minimal_wildcard_access = list()
	template_access = list(
		ACCESS_ADMIN_LVL5,
		ACCESS_SERVICE_LVL5,
	)
	job = /datum/job/bartender
	config_job = "bartender"

/datum/id_trim/job/cook
	assignment = JOB_COOK
	intern_alt_name = "Intern Cook"
	trim_state = "level3"
	sechud_icon_state = SECHUD_COOK
	minimal_access = list(
		ACCESS_SERVICE_LVL1,
		ACCESS_SERVICE_LVL2,
		ACCESS_SERVICE_LVL3,
	)
	extra_access = list()
	extra_wildcard_access = list()
	minimal_wildcard_access = list()
	template_access = list(
		ACCESS_ADMIN_LVL5,
		ACCESS_SERVICE_LVL5,
	)
	job = /datum/job/cook
	config_job = "cook"

/datum/id_trim/job/cook/chef
	assignment = "Chef"
	intern_alt_name = "Intern Chef"
	sechud_icon_state = SECHUD_CHEF

/datum/id_trim/job/morale_officer
	assignment = JOB_MORALE_OFFICER
	intern_alt_name = "Junior Morale Officer"
	trim_state = "level2"
	sechud_icon_state = SECHUD_MORALE_OFFICER
	minimal_access = list(
		ACCESS_SERVICE_LVL1,
		ACCESS_SERVICE_LVL2,
		ACCESS_ENGINEERING_LVL1,
	)
	extra_access = list()
	extra_wildcard_access = list()
	minimal_wildcard_access = list()
	template_access = list(
		ACCESS_ADMIN_LVL5,
		ACCESS_SERVICE_LVL5,
	)
	job = /datum/job/morale_officer
	config_job = "morale_officer"

/datum/id_trim/job/botanist
	assignment = JOB_BOTANIST
	intern_alt_name = "Intern Botanist"
	trim_state = "level2"
	sechud_icon_state = SECHUD_BOTANIST
	minimal_access = list(
		ACCESS_SERVICE_LVL1,
		ACCESS_SERVICE_LVL2,
	)
	extra_access = list()
	extra_wildcard_access = list()
	minimal_wildcard_access = list()
	template_access = list(
		ACCESS_ADMIN_LVL5,
		ACCESS_SERVICE_LVL5,
	)
	job = /datum/job/botanist
	config_job = "botanist"

/datum/id_trim/job/chaplain
	assignment = JOB_CHAPLAIN
	intern_alt_name = "Intern Chaplain"
	trim_state = "level2"
	sechud_icon_state = SECHUD_CHAPLAIN
	minimal_access = list(
		ACCESS_SERVICE_LVL1,
		ACCESS_SERVICE_LVL2,
	)
	extra_access = list()
	extra_wildcard_access = list()
	minimal_wildcard_access = list()
	template_access = list(
		ACCESS_ADMIN_LVL5,
		ACCESS_SERVICE_LVL5,
	)
	job = /datum/job/chaplain
	config_job = "chaplain"

/datum/id_trim/job/janitor
	assignment = JOB_JANITOR
	intern_alt_name = "Intern Janitor"
	trim_state = "level1"
	sechud_icon_state = SECHUD_JANITOR
	minimal_access = list(
		ACCESS_SERVICE_LVL1,
		ACCESS_ENGINEERING_LVL1,
	)
	extra_access = list()
	extra_wildcard_access = list()
	minimal_wildcard_access = list()
	template_access = list(
		ACCESS_ADMIN_LVL5,
		ACCESS_SERVICE_LVL5,
	)
	job = /datum/job/chaplain
	config_job = "chaplain"

/datum/id_trim/job/dclass
	assignment = JOB_DCLASS
	intern_alt_name = "Fresh D-Class Personnel"
	trim_state = "classd"
	sechud_icon_state = SECHUD_DCLASS
	minimal_access = list(
		ACCESS_DCLASS,
	)
	extra_access = list()
	extra_wildcard_access = list()
	minimal_wildcard_access = list()
	template_access = list(
		ACCESS_ADMIN_LVL5,
		ACCESS_SERVICE_LVL5,
		ACCESS_SECURITY_LVL3,
	)
	job = /datum/job/dclass
	config_job = "dclass"

/datum/id_trim/job/dclass/janitor
	assignment = "D-Class Janitor"
	trim_state = "classd_janitor"
	sechud_icon_state = SECHUD_DCLASS_JANITOR
	minimal_access = list(
		ACCESS_DCLASS,
		ACCESS_DCLASS_JANITORIAL,
	)

/datum/id_trim/job/dclass/cook
	assignment = "D-Class Cook"
	trim_state = "classd_cook"
	sechud_icon_state = SECHUD_DCLASS_COOK
	minimal_access = list(
		ACCESS_DCLASS,
		ACCESS_DCLASS_KITCHEN,
	)

/datum/id_trim/job/dclass/botanist
	assignment = "D-Class Botanist"
	trim_state = "classd_botanist"
	sechud_icon_state = SECHUD_DCLASS_BOTANIST
	minimal_access = list(
		ACCESS_DCLASS,
		ACCESS_DCLASS_BOTANY,
	)

/datum/id_trim/job/dclass/miner
	assignment = "D-Class Miner"
	trim_state = "classd_miner"
	sechud_icon_state = SECHUD_DCLASS_MINER
	minimal_access = list(
		ACCESS_DCLASS,
		ACCESS_DCLASS_MINING,
	)
