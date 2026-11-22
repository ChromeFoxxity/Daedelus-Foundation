/datum/job/ethics_committee_liaison
	title = JOB_ETHICS_COMMITTEE_LIAISON
	description = "You are a liaison of the Ethics Committee. Ensure committee-approved practices \
	are followed on site and investigate all unethical behaviors to report back to the committee. \
	Use the Ethics Review Console to file and review violations, oversee high-risk SCP tests, and \
	recommend amnestic treatment for exposed personnel. "
	auto_deadmin_role_flags = DEADMIN_POSITION_HEAD|DEADMIN_POSITION_SECURITY
	department_head = list(JOB_SITE_DIRECTOR)
	faction = FACTION_STATION
	total_positions = 1
	spawn_positions = 1
	supervisors = "the Site Director, and Ethics Committee"
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
			SPECIES_HUMAN = /datum/outfit/job/ethics_committee_liaison,
		),
	)

	departments_list = list(
		/datum/job_department/command,
	)

	liver_traits = list(TRAIT_ROYAL_METABOLISM)

	paycheck = PAYCHECK_HARD
	paycheck_department = ACCOUNT_CMD

	family_heirlooms = list(/obj/item/gavelhammer, /obj/item/book/manual/wiki/security_space_law)
	rpg_title = "Jury"
	job_flags = JOB_ANNOUNCE_ARRIVAL | JOB_CREW_MANIFEST | JOB_EQUIP_RANK | JOB_CREW_MEMBER | JOB_NEW_PLAYER_JOINABLE | JOB_REOPEN_ON_ROUNDSTART_LOSS | JOB_ASSIGN_QUIRKS | JOB_CAN_BE_INTERN

	voice_of_god_power = 1.4 //Command staff has authority

/datum/outfit/job/ethics_committee_liaison
	name = JOB_ETHICS_COMMITTEE_LIAISON
	jobtype = /datum/job/ethics_committee_liaison
	allow_jumpskirt = FALSE

	id = /obj/item/card/id/advanced/black_card
	id_trim = /datum/id_trim/job/ethics_committee_liaison
	uniform = /obj/item/clothing/under/suit/charcoal
	backpack_contents = list(
		/obj/item/assembly/flash/handheld = 1
	)
	belt = /obj/item/modular_computer/tablet/pda/foundation_ethics
	ears = /obj/item/radio/headset/heads/hos
	glasses = /obj/item/clothing/glasses/sunglasses
	gloves = /obj/item/clothing/gloves/color/white
	shoes = /obj/item/clothing/shoes/laceup

	backpack = /obj/item/storage/backpack
	satchel = /obj/item/storage/backpack/satchel
	duffelbag = /obj/item/storage/backpack/duffelbag

	chameleon_extras = list(
		/obj/item/gun/energy/e_gun,
		/obj/item/stamp/sid,
		)
	implants = list(/obj/item/implant/mindshield)

