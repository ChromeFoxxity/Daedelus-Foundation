/// Trim for basic Central Office cards.
/datum/id_trim/central
	access = list(ACCESS_CENTRAL, ACCESS_CENTRAL_HR)
	assignment = JOB_CENTRAL
	trim_state = "gold_level3"
	sechud_icon_state = SECHUD_CENTRAL

/// So corpses stop complaining.
/datum/id_trim/central/corpse
	access = list(ACCESS_CENTRAL)
	assignment = JOB_CENTRAL
	trim_state = "gold_level3"
	sechud_icon_state = SECHUD_CENTRAL

/// Trim for Central Office Inspectors.
/datum/id_trim/central/inspector
	access = list(ACCESS_CENTRAL)
	assignment = JOB_CENTRAL_INSPECTOR
	trim_state = "gold_level2"

/// Trim for Central Office O5 Command.
/datum/id_trim/centcom/o5
	assignment = JOB_CENTRAL_O5
	trim_state = "gold_level5"

/datum/id_trim/central/o5/New()
	. = ..()

	access = SSid_access.get_region_access_list(list(REGION_CENTCOM, REGION_ALL_STATION))

/// Trim for Central Office O5 Command Representatives.
/datum/id_trim/centcom/o5/representative
	assignment = JOB_CENTRAL_O5_REP
	trim_state = "gold_level4"

/datum/id_trim/centcom/o5/representative/New()
	. = ..()

	access = list(ACCESS_CENTRAL, ACCESS_CENTRAL_HR, ACCESS_O5) | (SSid_access.get_region_access_list(list(REGION_ALL_STATION)) - ACCESS_ADMIN_LVL5)

/// Trim for Central Office Ethics Committee Officials.
/datum/id_trim/central/ethics_committee
	assignment = JOB_CENTRAL_ETHICS
	trim_state = "gold_level4"

/datum/id_trim/central/ethics_committee/New()
	. = ..()

	access = list(ACCESS_CENTRAL, ACCESS_CENTRAL_HR) | (SSid_access.get_region_access_list(list(REGION_ALL_STATION)) - ACCESS_ADMIN_LVL5)

/// Trim for Central Office Internal Tribunal Officials.
/datum/id_trim/central/internal_tribunal
	assignment = JOB_CENTRAL_TRIBUNAL
	trim_state = "gold_level3"

/datum/id_trim/central/internal_tribunal/New()
	. = ..()

	access = list(ACCESS_CENTRAL, ACCESS_CENTRAL_HR) | (SSid_access.get_region_access_list(list(REGION_ALL_STATION)) - ACCESS_ADMIN_LVL5)

/// Trim for Central Office Internal Security Department.
/datum/id_trim/central/internal_security_agent
	assignment = JOB_CENTRAL_SECURITY
	trim_state = "gold_level2"

/datum/id_trim/central/internal_security_agent/New()
	. = ..()

	access = list(ACCESS_CENTRAL, ACCESS_ISD) | (SSid_access.get_region_access_list(list(REGION_ALL_STATION)) - ACCESS_ADMIN_LVL5)

/// Trim for Central Office Internal Security Department.
/datum/id_trim/central/internal_security_officer
	assignment = JOB_CENTRAL_SECURITY_LEADER
	trim_state = "gold_level3"

/datum/id_trim/central/internal_security_officer/New()
	. = ..()

	access = list(ACCESS_CENTRAL, ACCESS_CENTRAL_HR, ACCESS_ISD) | (SSid_access.get_region_access_list(list(REGION_ALL_STATION)) - ACCESS_ADMIN_LVL5)

/// Trim for the Mobile Task Force.
/datum/id_trim/central/mtf
	assignment = JOB_E11_PRIVATE
	trim_state = "gold_level1"
	sechud_icon_state = SECHUD_MTF_PRIVATE

/datum/id_trim/central/mtf/New()
	. = ..()

	access = list(ACCESS_CENTRAL, ACCESS_MTF) | (SSid_access.get_region_access_list(list(REGION_ALL_STATION)) - ACCESS_ADMIN_LVL5)

/datum/id_trim/central/mtf/specialist
	assignment = JOB_E11_SPECIALIST
	trim_state = "gold_level2"
	sechud_icon_state = SECHUD_MTF_SPECIALIST

/datum/id_trim/central/mtf/specialist/New()
	. = ..()

	access = list(ACCESS_CENTRAL, ACCESS_MTF) | (SSid_access.get_region_access_list(list(REGION_ALL_STATION)) - ACCESS_ADMIN_LVL5)

/datum/id_trim/central/mtf/medic
	assignment = JOB_E11_MEDIC
	trim_state = "gold_level2"
	sechud_icon_state = SECHUD_MTF_MEDIC

/datum/id_trim/central/mtf/medic/New()
	. = ..()

	access = list(ACCESS_CENTRAL, ACCESS_MTF) | (SSid_access.get_region_access_list(list(REGION_ALL_STATION)) - ACCESS_ADMIN_LVL5)

/datum/id_trim/central/mtf/sergeant
	assignment = JOB_E11_SERGEANT
	trim_state = "gold_level3"
	sechud_icon_state = SECHUD_MTF_SERGEANT

/datum/id_trim/central/mtf/sergeant/New()
	. = ..()

	access = list(ACCESS_CENTRAL, ACCESS_MTF) | (SSid_access.get_region_access_list(list(REGION_ALL_STATION)) - ACCESS_ADMIN_LVL5)

/datum/id_trim/central/mtf/captain
	assignment = JOB_E11_CAPTAIN
	trim_state = "gold_level4"
	sechud_icon_state = SECHUD_MTF_CAPTAIN

/datum/id_trim/central/mtf/captain/New()
	. = ..()

	access = list(ACCESS_CENTRAL, ACCESS_MTF, ACCESS_MTF_LEADER) | (SSid_access.get_region_access_list(list(REGION_ALL_STATION)))

/datum/id_trim/central/mtf/resh1
	assignment = JOB_R1_OPERATIVE
	trim_state = "gold_level5"
	sechud_icon_state = SECHUD_MTF_RESH1

/datum/id_trim/central/mtf/resh1/New()
	. = ..()

	access = SSid_access.get_region_access_list(list(REGION_CENTCOM, REGION_ALL_STATION))

/datum/id_trim/central/mtf/alpha1
	assignment = JOB_A1_OPERATIVE
	trim_state = "gold_level3"
	sechud_icon_state = SECHUD_MTF_ALPHA1

/datum/id_trim/central/mtf/alpha1/New()
	. = ..()

	access = list(ACCESS_CENTRAL, ACCESS_CENTRAL_HR, ACCESS_MTF) | (SSid_access.get_region_access_list(list(REGION_ALL_STATION)) - ACCESS_ADMIN_LVL5)

/datum/id_trim/central/mtf/alpha1/commander
	assignment = JOB_A1_COMMANDER
	trim_state = "gold_level4"

/datum/id_trim/central/mtf/alpha1/commander/New()
	. = ..()

	access = list(ACCESS_CENTRAL, ACCESS_CENTRAL_HR, ACCESS_MTF, ACCESS_MTF_LEADER) | (SSid_access.get_region_access_list(list(REGION_ALL_STATION)))

/datum/id_trim/central/mtf/omega1
	assignment = JOB_O1_COMMANDER
	trim_state = "gold_level3"
	sechud_icon_state = SECHUD_MTF_OMEGA1

/datum/id_trim/central/mtf/omega1/New()
	. = ..()

	access = list(ACCESS_CENTRAL, ACCESS_MTF) | (SSid_access.get_region_access_list(list(REGION_ALL_STATION)) - ACCESS_ADMIN_LVL5)

/datum/id_trim/central/mtf/omega1/commander
	assignment = JOB_O1_COMMANDER
	trim_state = "gold_level4"

/datum/id_trim/central/mtf/omega1/commander/New()
	. = ..()

	access = list(ACCESS_CENTRAL, ACCESS_MTF, ACCESS_MTF_LEADER) | (SSid_access.get_region_access_list(list(REGION_ALL_STATION)))

/datum/id_trim/central/mtf/nu7
	assignment = JOB_N7_OPERATIVE
	trim_state = "gold_level2"
	sechud_icon_state = SECHUD_MTF_NU7

/datum/id_trim/central/mtf/nu7/New()
	. = ..()

	access = list(ACCESS_CENTRAL, ACCESS_MTF) | (SSid_access.get_region_access_list(list(REGION_ALL_STATION)) - ACCESS_ADMIN_LVL5)

/datum/id_trim/central/mtf/nu7/commander
	assignment = JOB_N7_COMMANDER
	trim_state = "gold_level3"

/datum/id_trim/central/mtf/nu7/commander/New()
	. = ..()

	access = list(ACCESS_CENTRAL, ACCESS_MTF, ACCESS_MTF_LEADER) | (SSid_access.get_region_access_list(list(REGION_ALL_STATION)))

/datum/id_trim/central/mtf/epsilon9
	assignment = JOB_E9_OPERATIVE
	trim_state = "gold_level2"
	sechud_icon_state = SECHUD_MTF_EPSILON9

/datum/id_trim/central/mtf/epsilon9/New()
	. = ..()

	access = list(ACCESS_CENTRAL, ACCESS_MTF) | (SSid_access.get_region_access_list(list(REGION_ALL_STATION)) - ACCESS_ADMIN_LVL5)

/datum/id_trim/central/mtf/epsilon9/commander
	assignment = JOB_E9_COMMANDER
	trim_state = "gold_level3"

/datum/id_trim/central/mtf/epsilon9/commander/New()
	. = ..()

	access = list(ACCESS_CENTRAL, ACCESS_MTF, ACCESS_MTF_LEADER) | (SSid_access.get_region_access_list(list(REGION_ALL_STATION)))

/datum/id_trim/central/mtf/beta7
	assignment = JOB_B7_OPERATIVE
	trim_state = "gold_level2"
	sechud_icon_state = SECHUD_MTF_BETA7

/datum/id_trim/central/mtf/beta7/New()
	. = ..()

	access = list(ACCESS_CENTRAL, ACCESS_MTF) | (SSid_access.get_region_access_list(list(REGION_ALL_STATION)) - ACCESS_ADMIN_LVL5)

/datum/id_trim/central/mtf/beta7/commander
	assignment = JOB_B7_COMMANDER
	trim_state = "gold_level3"

/datum/id_trim/central/mtf/beta7/commander/New()
	. = ..()

	access = list(ACCESS_CENTRAL, ACCESS_MTF, ACCESS_MTF_LEADER) | (SSid_access.get_region_access_list(list(REGION_ALL_STATION)))

/datum/id_trim/central/mtf/alpha45
	assignment = JOB_A45_AGENT
	trim_state = "gold_level2"
	sechud_icon_state = SECHUD_MTF_ALPHA45

/datum/id_trim/central/mtf/alpha45/New()
	. = ..()

	access = list(ACCESS_CENTRAL, ACCESS_MTF) | (SSid_access.get_region_access_list(list(REGION_ALL_STATION)) - ACCESS_ADMIN_LVL5)
