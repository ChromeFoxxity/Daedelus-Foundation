/datum/job/intake_specialist
	title = JOB_INTAKE_SPECIALIST
	description = "Manage classified records, secure Foundation databases, oversee information clearance \
		and archival procedures, and investigate breaches of informational security across the site."
	department_head = list(JOB_SITE_DIRECTOR)
	faction = FACTION_STATION
	total_positions = 1
	spawn_positions = 1
	supervisors = "the Site Director, and RAISA Directorate"
	selection_color = "#063ea7"
	minimal_player_age = 14
	exp_requirements = 180
	exp_required_type = EXP_TYPE_CREW
	exp_required_type_department = EXP_TYPE_COMMAND
	exp_granted_type = EXP_TYPE_CREW

	employers = list(
		/datum/employer/scp,
	)

	outfits = list(
		"Default" = list(
			SPECIES_HUMAN = /datum/outfit/job/intake_specialist,
		),
	)

	departments_list = list(
		/datum/job_department/command,
	)

	liver_traits = list(TRAIT_ENGINEER_METABOLISM)

	paycheck = PAYCHECK_MEDIUM
	paycheck_department = ACCOUNT_CMD

	family_heirlooms = list(/obj/item/clothing/head/hardhat, /obj/item/screwdriver, /obj/item/wrench, /obj/item/weldingtool, /obj/item/crowbar, /obj/item/wirecutters)
	rpg_title = "Analyst"
	job_flags = JOB_ANNOUNCE_ARRIVAL | JOB_CREW_MANIFEST | JOB_EQUIP_RANK | JOB_CREW_MEMBER | JOB_NEW_PLAYER_JOINABLE | JOB_REOPEN_ON_ROUNDSTART_LOSS | JOB_ASSIGN_QUIRKS | JOB_CAN_BE_INTERN

/datum/outfit/job/intake_specialist
	name = "Intake Specialist"
	jobtype = /datum/job/intake_specialist

	id_trim = /datum/id_trim/job/intake_specialist
	uniform = /obj/item/clothing/under/rank/engineering/engineer
	belt = /obj/item/storage/belt/utility/full
	ears = /obj/item/radio/headset/headset_eng
	head = /obj/item/clothing/head/hardhat
	shoes = /obj/item/clothing/shoes/workboots
	gloves = /obj/item/clothing/gloves/color/yellow
	l_pocket = /obj/item/modular_computer/tablet/pda/foundation_engineer
	r_pocket = /obj/item/t_scanner

	backpack = /obj/item/storage/backpack/industrial
	satchel = /obj/item/storage/backpack/satchel/eng
	duffelbag = /obj/item/storage/backpack/duffelbag/engineering

	box = /obj/item/storage/box/survival/engineer
	pda_slot = ITEM_SLOT_LPOCKET
	skillchips = list(/obj/item/skillchip/job/engineer)
