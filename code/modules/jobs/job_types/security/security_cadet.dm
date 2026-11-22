/datum/job/security_cadet
	title = JOB_SECURITY_CADET
	description = "Assist with basic checkpoint and patrol duties under supervision, support Security personnel in \
		low-risk operations, and learn standard procedures in preparation for full Security Guard responsibilities."
	auto_deadmin_role_flags = DEADMIN_POSITION_SECURITY
	department_head = list(JOB_SECURITY_CAPTAIN)
	faction = FACTION_STATION
	total_positions = 6
	spawn_positions = 6
	supervisors = "the Security Captain, Security Lieutenant, Security Sergeant, and Security Guards"
	selection_color = "#7e7e7e"
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
			SPECIES_HUMAN = /datum/outfit/job/security_cadet,
		),
	)

	departments_list = list(
		/datum/job_department/security,
	)

	mind_traits = list(TRAIT_DONUT_LOVER)
	liver_traits = list(TRAIT_LAW_ENFORCEMENT_METABOLISM)

	paycheck = PAYCHECK_EASY
	paycheck_department = ACCOUNT_SEC

	family_heirlooms = list(/obj/item/book/manual/wiki/security_space_law, /obj/item/clothing/head/beret/sec)
	mail_goodies = list(/obj/item/food/donut/caramel = 10, /obj/item/food/donut/matcha = 10, /obj/item/food/donut/blumpkin = 5, /obj/item/clothing/mask/whistle = 5, /obj/item/melee/baton/telescopic = 1)
	rpg_title = "Junior Guard"
	job_flags = JOB_ANNOUNCE_ARRIVAL | JOB_CREW_MANIFEST | JOB_EQUIP_RANK | JOB_CREW_MEMBER | JOB_NEW_PLAYER_JOINABLE | JOB_REOPEN_ON_ROUNDSTART_LOSS | JOB_ASSIGN_QUIRKS

/datum/outfit/job/security_cadet
	name = JOB_SECURITY_CADET
	jobtype = /datum/job/security_cadet

	id = /obj/item/card/id/advanced/white_card
	id_trim = /datum/id_trim/job/security_cadet
	uniform = /obj/item/clothing/under/scp/hos/guardcom
	suit = /obj/item/clothing/suit/armor/vest/security/sergeant
	suit_store = /obj/item/gun/energy/e_gun
	backpack_contents = list(
		/obj/item/storage/evidencebag = 1,
		)
	belt = /obj/item/modular_computer/tablet/pda/foundation_security
	ears = /obj/item/radio/headset/heads/hos/alt
	glasses = /obj/item/clothing/glasses/hud/security/sunglasses
	gloves = /obj/item/clothing/gloves/combat
	head = /obj/item/clothing/head/helmet/security
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
