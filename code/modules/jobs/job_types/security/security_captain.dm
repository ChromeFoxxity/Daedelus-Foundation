/datum/job/security_captain
	title = JOB_SECURITY_CAPTAIN
	description = "Lead the Security Department, oversee site defense operations, authorize SCP testing, \
		coordinate emergency responses, manage armory distribution, and maintain order during both routine \
		operations and containment crises."
	auto_deadmin_role_flags = DEADMIN_POSITION_HEAD|DEADMIN_POSITION_SECURITY
	head_announce = list(RADIO_CHANNEL_SECURITY)
	faction = FACTION_STATION
	total_positions = 1
	spawn_positions = 1
	supervisors = "the Site Director"
	selection_color = "#adadad"
	req_admin_notify = 1
	minimal_player_age = 14
	exp_requirements = 300
	exp_required_type = EXP_TYPE_CREW
	exp_required_type_department = EXP_TYPE_SECURITY
	exp_granted_type = EXP_TYPE_CREW

	employers = list(
		/datum/employer/scp
	)

	outfits = list(
		"Default" = list(
			SPECIES_HUMAN = /datum/outfit/job/security_captain,
		),
	)

	departments_list = list(
		/datum/job_department/security,
		/datum/job_department/command,
	)

	mind_traits = list(TRAIT_DONUT_LOVER)
	liver_traits = list(TRAIT_LAW_ENFORCEMENT_METABOLISM, TRAIT_ROYAL_METABOLISM)

	paycheck = PAYCHECK_COMMAND
	paycheck_department = ACCOUNT_SEC

	family_heirlooms = list(/obj/item/book/manual/wiki/security_space_law)
	mail_goodies = list(/obj/item/food/donut/caramel = 10, /obj/item/food/donut/matcha = 10, /obj/item/food/donut/blumpkin = 5, /obj/item/clothing/mask/whistle = 5, /obj/item/melee/baton/telescopic = 1)
	rpg_title = "Guard Leader"
	job_flags = JOB_ANNOUNCE_ARRIVAL | JOB_CREW_MANIFEST | JOB_EQUIP_RANK | JOB_CREW_MEMBER | JOB_NEW_PLAYER_JOINABLE | JOB_REOPEN_ON_ROUNDSTART_LOSS | JOB_ASSIGN_QUIRKS | JOB_CAN_BE_INTERN

	voice_of_god_power = 1.4 //Command staff has authority

/datum/job/security_captain/get_captaincy_announcement(mob/living/captain)
	return "Due to staffing shortages, [title] [captain.real_name] has been promoted temporarily to acting Site Director!"

/datum/outfit/job/security_captain
	name = JOB_SECURITY_CAPTAIN
	jobtype = /datum/job/security_captain

	id = /obj/item/card/id/advanced/black_card
	id_trim = /datum/id_trim/job/security_captain
	uniform = /obj/item/clothing/under/scp/hos/guardcom
	suit = /obj/item/clothing/suit/armor/vest/security/captain
	suit_store = /obj/item/gun/energy/e_gun
	backpack_contents = list(
		/obj/item/storage/evidencebag = 1,
		)
	belt = /obj/item/modular_computer/tablet/pda/foundation_security
	ears = /obj/item/radio/headset/heads/hos/alt
	glasses = /obj/item/clothing/glasses/hud/security/sunglasses
	gloves = /obj/item/clothing/gloves/combat
	head = /obj/item/clothing/head/helmet/security/captain
	shoes = /obj/item/clothing/shoes/jackboots
	mask = /obj/item/clothing/mask/balaclava
	l_pocket = /obj/item/restraints/handcuffs
	r_pocket = /obj/item/assembly/flash/handheld

	backpack = /obj/item/storage/backpack/security
	satchel = /obj/item/storage/backpack/satchel/sec
	duffelbag = /obj/item/storage/backpack/duffelbag/sec
	messenger = /obj/item/storage/backpack/messenger/sec

	box = /obj/item/storage/box/survival/security
	chameleon_extras = list(
		/obj/item/gun/energy/e_gun/hos,
		/obj/item/stamp/sc,
		)
	implants = list(/obj/item/implant/mindshield)
