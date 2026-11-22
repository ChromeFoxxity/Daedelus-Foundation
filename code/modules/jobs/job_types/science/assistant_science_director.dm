/datum/job/assistant_science_director
	title = JOB_ASSISTANT_SCIENCE_DIRECTOR
	description = "Assist in managing the Scientific Department, oversee SCP testing and research operations, \
		supervise scientific personnel, coordinate specialized divisions, and act in place of the Science \
		Director when required."
	department_head = list(JOB_SCIENCE_DIRECTOR)
	faction = FACTION_STATION
	total_positions = 1
	spawn_positions = 1
	supervisors = "the Site Director, and Science Director"
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
			SPECIES_HUMAN = /datum/outfit/job/assistant_science_director,
		),
	)

	departments_list = list(
		/datum/job_department/science,
	)

	paycheck = PAYCHECK_HARD
	paycheck_department = ACCOUNT_SCI

	family_heirlooms = list(/obj/item/toy/plush/slimeplushie)
	mail_goodies = list(
		/obj/item/storage/box/monkeycubes = 30,
		/obj/item/circuitboard/machine/sleeper/party = 3,
		/obj/item/borg/upgrade/ai = 2
	)
	rpg_title = "Acting Elder Thamuaturgist"
	job_flags = JOB_ANNOUNCE_ARRIVAL | JOB_CREW_MANIFEST | JOB_EQUIP_RANK | JOB_CREW_MEMBER | JOB_NEW_PLAYER_JOINABLE | JOB_REOPEN_ON_ROUNDSTART_LOSS | JOB_ASSIGN_QUIRKS | JOB_CAN_BE_INTERN

/datum/outfit/job/assistant_science_director
	name = "Assistant Science Director"
	jobtype = /datum/job/assistant_science_director

	id = /obj/item/card/id/advanced/black_card
	id_trim = /datum/id_trim/job/assistant_science_director
	uniform = /obj/item/clothing/under/rank/rnd/scientist
	suit = /obj/item/clothing/suit/toggle/labcoat
	suit_store = /obj/item/flashlight/pen
	backpack_contents = list(
		/obj/item/roller = 1,
		/obj/item/bodybag/stasis = 1,
	)
	belt = /obj/item/storage/belt/medical/paramedic
	ears = /obj/item/radio/headset/headset_med
	head = /obj/item/clothing/head/soft/paramedic
	gloves = /obj/item/clothing/gloves/color/black
	shoes = /obj/item/clothing/shoes/laceup
	l_pocket = /obj/item/modular_computer/tablet/pda/foundation_science

	backpack = /obj/item/storage/backpack/medic
	satchel = /obj/item/storage/backpack/satchel/med
	duffelbag = /obj/item/storage/backpack/duffelbag/med

	box = /obj/item/storage/box/survival/medical
	chameleon_extras = /obj/item/gun/syringe
	pda_slot = ITEM_SLOT_LPOCKET
