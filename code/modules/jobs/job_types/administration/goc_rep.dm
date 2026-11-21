/datum/job/goc_rep
	title = JOB_GOC_REP
	description = "Represent your respective group of interest. Advise command personnel \
	about your group's best interests. Use the GOI Relations Terminal to file intelligence reports, \
	send communiques to your organization, and manage diplomatic standing with the Foundation."
	auto_deadmin_role_flags = DEADMIN_POSITION_HEAD
	faction = FACTION_STATION
	total_positions = 1
	spawn_positions = 1
	supervisors = "the Global Occult Coalition"
	selection_color = "#4c97b4"
	minimal_player_age = 14
	exp_requirements = 180
	exp_required_type = EXP_TYPE_CREW
	exp_required_type_department = EXP_TYPE_COMMAND
	exp_granted_type = EXP_TYPE_CREW

	employers = list(
		/datum/employer/goc,
	)

	outfits = list(
		"Default" = list(
			SPECIES_HUMAN = /datum/outfit/job/goc_rep,
		),
	)

	departments_list = list(
		/datum/job_department/command,
	)

	liver_traits = list(TRAIT_ROYAL_METABOLISM)

	paycheck = PAYCHECK_MEDIUM
	paycheck_department = ACCOUNT_CMD

	family_heirlooms = list(/obj/item/book/manual/wiki/security_space_law)
	rpg_title = "Prince"
	job_flags = JOB_ANNOUNCE_ARRIVAL | JOB_CREW_MANIFEST | JOB_EQUIP_RANK | JOB_CREW_MEMBER | JOB_NEW_PLAYER_JOINABLE | JOB_REOPEN_ON_ROUNDSTART_LOSS | JOB_ASSIGN_QUIRKS | JOB_CAN_BE_INTERN

/datum/outfit/job/goc_rep
	name = JOB_GOC_REP
	jobtype = /datum/job/goi_rep
	allow_jumpskirt = FALSE

	id = /obj/item/card/id/advanced/black_blank
	id_trim = /datum/id_trim/job/goc_rep
	uniform = /obj/item/clothing/under/suit/charcoal
	backpack_contents = list(
		/obj/item/assembly/flash/handheld = 1
	)
	belt = /obj/item/modular_computer/tablet/pda/foundation_command
	ears = /obj/item/radio/headset/headset_com
	glasses = /obj/item/clothing/glasses/sunglasses
	shoes = /obj/item/clothing/shoes/laceup

	backpack = /obj/item/storage/backpack
	satchel = /obj/item/storage/backpack/satchel
	duffelbag = /obj/item/storage/backpack/duffelbag
