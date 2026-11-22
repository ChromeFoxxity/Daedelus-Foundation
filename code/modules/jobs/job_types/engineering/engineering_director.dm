/datum/job/engineering_director
	title = JOB_ENGINEERING_DIRECTOR
	description = "Oversee the site's power systems, Supermatter stability, atmospherics, communications, \
		infrastructure maintenance, and engineering personnel to ensure the facility remains fully operational."
	auto_deadmin_role_flags = DEADMIN_POSITION_HEAD
	head_announce = list(RADIO_CHANNEL_ENGINEERING)
	faction = FACTION_STATION
	total_positions = 1
	spawn_positions = 1
	supervisors = "the Site Director"
	selection_color = "#d89e48"
	req_admin_notify = 1
	minimal_player_age = 14
	exp_requirements = 180
	exp_required_type = EXP_TYPE_CREW
	exp_required_type_department = EXP_TYPE_ENGINEERING
	exp_granted_type = EXP_TYPE_CREW

	employers = list(
		/datum/employer/scp,
	)

	outfits = list(
		"Default" = list(
			SPECIES_HUMAN = /datum/outfit/job/engineering_director,
		),
	)

	departments_list = list(
		/datum/job_department/engineering,
		/datum/job_department/command,
	)

	liver_traits = list(TRAIT_ENGINEER_METABOLISM, TRAIT_ROYAL_METABOLISM)

	paycheck = PAYCHECK_COMMAND
	paycheck_department = ACCOUNT_ENG

	family_heirlooms = list(/obj/item/clothing/head/hardhat/white, /obj/item/screwdriver, /obj/item/wrench, /obj/item/weldingtool, /obj/item/crowbar, /obj/item/wirecutters)
	mail_goodies = list(
		/obj/item/food/cracker = 25, //you know. for poly
		/obj/item/stack/sheet/mineral/diamond = 15,
		/obj/item/stack/sheet/mineral/uranium/five = 15,
		/obj/item/stack/sheet/mineral/plasma/five = 15,
		/obj/item/stack/sheet/mineral/gold = 15,
		/obj/effect/spawner/random/engineering/tool_advanced = 3
	)
	rpg_title = "Head Crystallomancer"
	job_flags = JOB_ANNOUNCE_ARRIVAL | JOB_CREW_MANIFEST | JOB_EQUIP_RANK | JOB_CREW_MEMBER | JOB_NEW_PLAYER_JOINABLE | JOB_REOPEN_ON_ROUNDSTART_LOSS | JOB_ASSIGN_QUIRKS | JOB_CAN_BE_INTERN

	voice_of_god_power = 1.4 //Command staff has authority

/datum/job/engineering_director/get_captaincy_announcement(mob/living/captain)
	return "Due to staffing shortages, [title] [captain.real_name] has been promoted temporarily to acting Site Director!"

/datum/outfit/job/engineering_director
	name = "Engineering Director"
	jobtype = /datum/job/engineering_director

	id = /obj/item/card/id/advanced/black_card
	id_trim = /datum/id_trim/job/engineering_director
	uniform = /obj/item/clothing/under/rank/engineering/chief_engineer
	backpack_contents = list(
		/obj/item/assembly/flash/handheld
	)
	belt = /obj/item/storage/belt/utility/full
	ears = /obj/item/radio/headset/heads/ce
	gloves = /obj/item/clothing/gloves/color/yellow
	head = /obj/item/clothing/head/hardhat/white
	suit = /obj/item/clothing/suit/hazardvest
	shoes = /obj/item/clothing/shoes/workboots
	l_pocket = /obj/item/modular_computer/tablet/pda/foundation_engineer

	backpack = /obj/item/storage/backpack/industrial
	satchel = /obj/item/storage/backpack/satchel/eng
	duffelbag = /obj/item/storage/backpack/duffelbag/engineering

	box = /obj/item/storage/box/survival/engineer
	chameleon_extras = /obj/item/stamp/ed
	skillchips = list(/obj/item/skillchip/job/engineer)
	pda_slot = ITEM_SLOT_LPOCKET
