/**
 * This is the file you should use to add alternate titles for each job, just
 * follow the way they're done here, it's easy enough and shouldn't take any
 * time at all to add more or add some for a job that doesn't have any.
 */


/datum/job
	/// The list of alternative job titles people can pick from, null by default.
	var/list/alt_titles = null

// Heads
/datum/job/security_captain
	alt_titles = list(JOB_SECURITY_CAPTAIN, "Security Major")

// Research

/datum/job/junior_researcher
	alt_titles = list(
		"Junior AIAD Technican",
		"Junior Cryptozoologist",
		"Junior Xenobiologist",
		"Junior Xenoentomologist",
		"Junior Xenobotanologist",
		"Junior Xenoarcheologist",
		"Apprentice Thaumatologist",
		"Apprentice Alchemist",
		"Research Assistant"
		)

/datum/job/researcher
	alt_titles = list(
		JOB_RESEARCHER,
		"AIAD Technican",
		"Cryptozoologist",
		"Xenobiologist",
		"Xenoentomologist",
		"Xenobotanologist",
		"Xenoarcheologist",
		"Alchemist",
		"Thaumatologist"
		)

/datum/job/senior_researcher
	alt_titles = list(
		JOB_RESEARCHER,
		"Senior AIAD Technican",
		"Senior Cryptozoologist",
		"Senior Xenobiologist",
		"Senior Xenoentomologist",
		"Senior Xenobotanologist",
		"Senior Xenoarcheologist",
		"Elder Alchemist",
		"Elder Thaumatologist"
		)

// Medical

// Service

/datum/job/cook
	alt_titles = list(JOB_COOK, "Chef", "Culinary Artist")

/datum/job/botanist
	alt_titles = list(JOB_BOTANIST, "Hydroponicist")

/datum/job/janitor
	alt_titles = list(JOB_JANITOR, "Custodian", "Sanitation Technician")

/datum/job/chaplain
	alt_titles = list(JOB_CHAPLAIN, "Horizon Initiative Shepard", "Priest", "Preacher", "Reverend", "Oracle", "Pontifex", "Magister", "High Priest", "Imam", "Rabbi", "Monk", "Counselor")
