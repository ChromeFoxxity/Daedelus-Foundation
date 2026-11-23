/datum/job/senior_roboticist
	title = JOB_SENIOR_ROBOTICIST
	description = "Research new technology, create explosives, experiment with strange objects, or synthesize dangerous chemicals."
	department_head = list(JOB_SCIENCE_DIRECTOR)
	faction = FACTION_STATION
	total_positions = 1
	spawn_positions = 1
	supervisors = "the Site Director, Science Director, and Assistant Science Director"
	selection_color = "#0f4aa3"
	minimal_player_age = 14
	exp_requirements = 180
	exp_required_type = EXP_TYPE_CREW
	exp_required_type_department = EXP_TYPE_SCIENCE
	exp_granted_type = EXP_TYPE_CREW

	employers = list(
		/datum/employer/scp,
	)

	outfits = list(
		"Default" = list(
			SPECIES_HUMAN = /datum/outfit/job/senior_researcher,
		),
	)

	departments_list = list(
		/datum/job_department/science,
	)

	paycheck = PAYCHECK_MEDIUM
	paycheck_department = ACCOUNT_SCI

	family_heirlooms = list(/obj/item/toy/plush/pkplush)
	mail_goodies = list(
		/obj/item/storage/box/flashes = 20,
		/obj/item/stack/sheet/iron/twenty = 15,
		/obj/item/modular_computer/laptop = 5,
		/obj/item/mmi/posibrain = 5,
	)
	rpg_title = "Senior Necromancer"
	job_flags = JOB_ANNOUNCE_ARRIVAL | JOB_CREW_MANIFEST | JOB_EQUIP_RANK | JOB_CREW_MEMBER | JOB_NEW_PLAYER_JOINABLE | JOB_REOPEN_ON_ROUNDSTART_LOSS | JOB_ASSIGN_QUIRKS | JOB_CAN_BE_INTERN

/datum/outfit/job/senior_roboticist
	name = "Senior Robotics Technician"
	jobtype = /datum/job/senior_roboticist

	id_trim = /datum/id_trim/job/senior_roboticist
	uniform = /obj/item/clothing/under/rank/rnd/scientist
	suit = /obj/item/clothing/suit/toggle/labcoat/science
	backpack_contents = list(/obj/item/scp_scanner/experimental = 1)
	belt = /obj/item/modular_computer/tablet/pda/foundation_science
	ears = /obj/item/radio/headset/headset_med
	shoes = /obj/item/clothing/shoes/laceup
	gloves = /obj/item/clothing/gloves/color/latex
	glasses = /obj/item/clothing/glasses/science
	l_hand = /obj/item/clipboard

	backpack = /obj/item/storage/backpack/science
	satchel = /obj/item/storage/backpack/satchel/science
	duffelbag = /obj/item/storage/backpack/duffelbag/science

	pda_slot = ITEM_SLOT_BELT
	skillchips = list()
