/datum/job/senior_technician
	title = JOB_SENIOR_TECHNICIAN
	description = "Oversee the site's power systems, Supermatter stability, atmospherics, communications, \
		infrastructure maintenance, and engineering personnel to ensure the facility remains fully operational."
	department_head = list(JOB_ENGINEERING_DIRECTOR)
	faction = FACTION_STATION
	total_positions = 2
	spawn_positions = 2
	supervisors = "the Site Director, Engineering Director, and Assistant Engineering Director"
	selection_color = "#9e7e4e"
	minimal_player_age = 7
	exp_requirements = 180
	exp_required_type = EXP_TYPE_CREW
	exp_required_type_department = EXP_TYPE_ENGINEERING
	exp_granted_type = EXP_TYPE_CREW

	employers = list(
		/datum/employer/scp,
	)

	outfits = list(
		"Default" = list(
			SPECIES_HUMAN = /datum/outfit/job/senior_technician,
		),
	)

	departments_list = list(
		/datum/job_department/engineering,
	)

	liver_traits = list(TRAIT_ENGINEER_METABOLISM)

	paycheck = PAYCHECK_MEDIUM
	paycheck_department = ACCOUNT_ENG

	family_heirlooms = list(/obj/item/clothing/head/hardhat, /obj/item/screwdriver, /obj/item/wrench, /obj/item/weldingtool, /obj/item/crowbar, /obj/item/wirecutters)
	mail_goodies = list(
		/obj/item/storage/box/lights/mixed = 20,
		/obj/item/lightreplacer = 10,
		/obj/item/spess_knife = 10,
		/obj/item/holosign_creator/engineering = 8,
		/obj/item/wrench/bolter = 8,
		/obj/item/clothing/head/hardhat/red = 1
	)
	rpg_title = "Senior Crystallomancer"
	job_flags = JOB_ANNOUNCE_ARRIVAL | JOB_CREW_MANIFEST | JOB_EQUIP_RANK | JOB_CREW_MEMBER | JOB_NEW_PLAYER_JOINABLE | JOB_REOPEN_ON_ROUNDSTART_LOSS | JOB_ASSIGN_QUIRKS | JOB_CAN_BE_INTERN

/datum/outfit/job/senior_technician
	name = "Senior Technician"
	jobtype = /datum/job/assistant_engineering_director

	id_trim = /datum/id_trim/job/assistant_engineering_director
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
