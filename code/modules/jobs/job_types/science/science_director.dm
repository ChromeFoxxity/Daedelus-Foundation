/datum/job/science_director
	title = JOB_SCIENCE_DIRECTOR
	description = "oversees all scientific operations, manages and authorizes SCP testing, supervises research \
		personnel, and directs the Robotics and Psionics divisions while ensuring all experimentation remains \
		safe, controlled, and compliant with Foundation protocol."
	auto_deadmin_role_flags = DEADMIN_POSITION_HEAD
	head_announce = list(RADIO_CHANNEL_SCIENCE)
	faction = FACTION_STATION
	total_positions = 1
	spawn_positions = 1
	supervisors = "the Site Director"
	selection_color = "#146aeb"
	req_admin_notify = 1
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
			SPECIES_HUMAN = /datum/outfit/job/science_director,
		),
	)

	departments_list = list(
		/datum/job_department/science,
		/datum/job_department/command,
	)

	liver_traits = list(TRAIT_ROYAL_METABOLISM)

	paycheck = PAYCHECK_COMMAND
	paycheck_department = ACCOUNT_SCI

	family_heirlooms = list(/obj/item/toy/plush/slimeplushie)
	mail_goodies = list(
		/obj/item/storage/box/monkeycubes = 30,
		/obj/item/circuitboard/machine/sleeper/party = 3,
		/obj/item/borg/upgrade/ai = 2
	)
	rpg_title = "Elder Thamuaturgist"
	job_flags = JOB_ANNOUNCE_ARRIVAL | JOB_CREW_MANIFEST | JOB_EQUIP_RANK | JOB_CREW_MEMBER | JOB_NEW_PLAYER_JOINABLE | JOB_REOPEN_ON_ROUNDSTART_LOSS | JOB_ASSIGN_QUIRKS | JOB_CAN_BE_INTERN

	voice_of_god_power = 1.4 //Command staff has authority

/datum/job/science_director/get_captaincy_announcement(mob/living/captain)
	return "Due to staffing shortages, [title] [captain.real_name] has been promoted temporarily to acting Site Director!"

/datum/outfit/job/science_director
	name = "Science Director"
	jobtype = /datum/job/science_director

	id = /obj/item/card/id/advanced/black_card
	id_trim = /datum/id_trim/job/science_director
	uniform = /obj/item/clothing/under/rank/rnd/science_director/alt
	backpack_contents = list(
		/obj/item/assembly/flash/handheld,
		/obj/item/laser_pointer
	)
	suit = /obj/item/clothing/suit/toggle/labcoat/science
	belt = /obj/item/modular_computer/tablet/pda/foundation_science
	ears = /obj/item/radio/headset/heads/cmo
	shoes = /obj/item/clothing/shoes/laceup
	gloves = /obj/item/clothing/gloves/color/black
	glasses = /obj/item/clothing/glasses/science
	l_pocket = /obj/item/assembly/flash/handheld
	r_pocket = /obj/item/laser_pointer
	l_hand = /obj/item/clipboard

	backpack = /obj/item/storage/backpack/science
	satchel = /obj/item/storage/backpack/satchel/science
	duffelbag = /obj/item/storage/backpack/duffelbag/science

	box = /obj/item/storage/box/survival/medical
	chameleon_extras = list(
		/obj/item/gun/syringe,
		/obj/item/stamp/md,
		)
	skillchips = list(/obj/item/skillchip/job/science_director)
