/datum/job/communications_officer
	title = JOB_COMMUNICATIONS_OFFICER
	description = "Keep communications systems online. Inform the site of on-going threats. Dispatch security, \
	medical, and engineering personnel via the Communications Console. Monitor facility threat levels and \
	coordinate emergency responses. Make site-wide announcements to keep personnel informed."
	department_head = list(JOB_SITE_DIRECTOR)
	faction = FACTION_STATION
	total_positions = 1
	spawn_positions = 1
	supervisors = "the Site Director"
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
			SPECIES_HUMAN = /datum/outfit/job/communications_officer,
		),
	)

	departments_list = list(
		/datum/job_department/command,
	)

	liver_traits = list(TRAIT_ROYAL_METABOLISM)

	paycheck = PAYCHECK_MEDIUM
	paycheck_department = ACCOUNT_CMD

	family_heirlooms = list(
		/obj/item/modular_computer/laptop,
		/obj/item/radio,
		/obj/item/pai_card,
		/obj/item/multitool,
	)
	mail_goodies = list(
		/obj/item/coffee_cartridge = 20,
		/obj/item/reagent_containers/cup = 10,
		/obj/item/stock_parts/subspace = 8,
		/obj/item/banhammer = 8,
		/obj/item/disk/computer/maintenance = 1,
	)
	rpg_title = "Messenger"
	job_flags = JOB_ANNOUNCE_ARRIVAL | JOB_CREW_MANIFEST | JOB_EQUIP_RANK | JOB_CREW_MEMBER | JOB_NEW_PLAYER_JOINABLE | JOB_REOPEN_ON_ROUNDSTART_LOSS | JOB_ASSIGN_QUIRKS | JOB_CAN_BE_INTERN

/datum/outfit/job/communications_officer
	name = JOB_COMMUNICATIONS_OFFICER
	jobtype = /datum/job/communications_officer
	allow_jumpskirt = FALSE

	id = /obj/item/card/id/advanced/black_blank
	id_trim = /datum/id_trim/job/communications_officer
	uniform = /obj/item/clothing/under/suit/charcoal
	backpack_contents = list(
		/obj/item/assembly/flash/handheld = 1
	)
	belt = /obj/item/modular_computer/tablet/pda/foundation_comms
	ears = /obj/item/radio/headset/heads/captain
	gloves = /obj/item/clothing/gloves/color/white
	shoes = /obj/item/clothing/shoes/laceup

	backpack = /obj/item/storage/backpack
	satchel = /obj/item/storage/backpack/satchel
	duffelbag = /obj/item/storage/backpack/duffelbag

	implants = list(/obj/item/implant/mindshield)

