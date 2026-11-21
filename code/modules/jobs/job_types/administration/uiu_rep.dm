/datum/job/uiu_rep
	title = JOB_UIU_REP
	description = "Represent your respective group of interest. Advise command personnel \
	about your group's best interests. Use the GOI Relations Terminal to file intelligence reports, \
	send communiques to your organization, and manage diplomatic standing with the Foundation."
	auto_deadmin_role_flags = DEADMIN_POSITION_HEAD
	faction = FACTION_STATION
	total_positions = 1
	spawn_positions = 1
	supervisors = "the Federal Bereau of Investigation"
	selection_color = "#265228"
	minimal_player_age = 14
	exp_requirements = 180
	exp_required_type = EXP_TYPE_CREW
	exp_required_type_department = EXP_TYPE_COMMAND
	exp_granted_type = EXP_TYPE_CREW

	employers = list(
		/datum/employer/uiu,
	)

	outfits = list(
		"Default" = list(
			SPECIES_HUMAN = /datum/outfit/job/uiu_rep,
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

/datum/outfit/job/uiu_rep
	name = JOB_UIU_REP
	jobtype = /datum/job/goi_rep
	allow_jumpskirt = FALSE

	id_trim = /datum/id_trim/job/uiu_rep
	uniform = /obj/item/clothing/under/rank/security/guard
	suit = /obj/item/clothing/suit/irs
	belt = /obj/item/modular_computer/tablet/pda/foundation_investigations
	ears = /obj/item/radio/headset/heads/hos
	gloves = /obj/item/clothing/gloves/forensic
	neck = /obj/item/clothing/neck/tie/black
	shoes = /obj/item/clothing/shoes/laceup
	l_pocket = /obj/item/toy/crayon/white
	r_pocket = /obj/item/storage/fancy/cigarettes/dromedaryco

	l_hand = /obj/item/storage/briefcase/crimekit

	chameleon_extras = list(
		/obj/item/clothing/glasses/sunglasses,
		/obj/item/gun/ballistic/revolver/detective,
		)

	backpack = /obj/item/storage/backpack
	satchel = /obj/item/storage/backpack/satchel
	duffelbag = /obj/item/storage/backpack/duffelbag
	messenger = /obj/item/storage/backpack/messenger

	implants = list(/obj/item/implant/mindshield)
