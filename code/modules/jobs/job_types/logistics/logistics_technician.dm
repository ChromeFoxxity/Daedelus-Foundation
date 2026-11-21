/datum/job/logistics_technician
	title = JOB_LOGISTICS_TECHNICIAN
	description = "Distribute supplies to the departments that ordered them, \
		collect empty crates, load and unload the supply shuttle, \
		ship bounty cubes."
	department_head = list(JOB_LOGISTICS_OFFICER)
	faction = FACTION_STATION
	total_positions = 3
	spawn_positions = 2
	supervisors = "the Logistics Officer"
	selection_color = "#3A2300"
	exp_granted_type = EXP_TYPE_CREW

	employers = list(
		/datum/employer/scp
	)

	outfits = list(
		"Default" = list(
			SPECIES_HUMAN = /datum/outfit/job/logistics_technician,
		),
		"Shaft Miner" = list(
			SPECIES_HUMAN = /datum/outfit/job/miner,
		),
	)

	paycheck = PAYCHECK_EASY
	paycheck_department = ACCOUNT_CAR
	departments_list = list(
		/datum/job_department/cargo,
		)

	family_heirlooms = list(/obj/item/clipboard)

	mail_goodies = list(
		/obj/item/pizzabox = 10,
		/obj/item/stack/sheet/mineral/gold = 5,
		/obj/item/stack/sheet/mineral/uranium = 4,
		/obj/item/stack/sheet/mineral/diamond = 3,
		/obj/item/gun/ballistic/rifle/boltaction = 1
	)
	rpg_title = "Merchantman"
	job_flags = JOB_ANNOUNCE_ARRIVAL | JOB_CREW_MANIFEST | JOB_EQUIP_RANK | JOB_CREW_MEMBER | JOB_NEW_PLAYER_JOINABLE | JOB_REOPEN_ON_ROUNDSTART_LOSS | JOB_ASSIGN_QUIRKS | JOB_CAN_BE_INTERN | JOB_CAN_BE_INTERN

/datum/outfit/job/logistics_technician
	name = JOB_LOGISTICS_TECHNICIAN
	jobtype = /datum/job/logistics_technician

	id_trim = /datum/id_trim/job/logistics_technician
	uniform = /obj/item/clothing/under/rank/cargo/tech
	belt = /obj/item/modular_computer/tablet/pda/cargo
	ears = /obj/item/radio/headset/headset_cargo
	l_hand = /obj/item/export_scanner
