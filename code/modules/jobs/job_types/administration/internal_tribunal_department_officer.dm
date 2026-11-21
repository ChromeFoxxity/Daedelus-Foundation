/datum/job/internal_tribunal_department_officer
	title = JOB_INTERNAL_TRIBUNAL_DEPARTMENT_OFFICER
	description = "As an officer of the Internal Tribunal Department, your duty is to enforce \
	and advise on the site regulations and standard operating procedure and ensure that they are not ignored. \
	Use the Tribunal Console to file cases, conduct hearings, and render verdicts with appropriate sanctions."
	auto_deadmin_role_flags = DEADMIN_POSITION_HEAD|DEADMIN_POSITION_SECURITY
	department_head = list(JOB_SITE_DIRECTOR)
	faction = FACTION_STATION
	total_positions = 1
	spawn_positions = 1
	supervisors = "the Site Director, Internal Security Department, and Internal Tribunal Department"
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
			SPECIES_HUMAN = /datum/outfit/job/internal_tribunal_department_officer,
		),
	)

	departments_list = list(
		/datum/job_department/command,
	)

	liver_traits = list(TRAIT_ROYAL_METABOLISM)

	paycheck = PAYCHECK_HARD
	paycheck_department = ACCOUNT_CMD

	family_heirlooms = list(/obj/item/gavelhammer, /obj/item/book/manual/wiki/security_space_law)
	rpg_title = "Judge"
	job_flags = JOB_ANNOUNCE_ARRIVAL | JOB_CREW_MANIFEST | JOB_EQUIP_RANK | JOB_CREW_MEMBER | JOB_NEW_PLAYER_JOINABLE | JOB_REOPEN_ON_ROUNDSTART_LOSS | JOB_ASSIGN_QUIRKS | JOB_CAN_BE_INTERN

	voice_of_god_power = 1.4 //Command staff has authority

/datum/outfit/job/internal_tribunal_department_officer
	name = JOB_INTERNAL_TRIBUNAL_DEPARTMENT_OFFICER
	jobtype = /datum/job/internal_tribunal_department_officer
	allow_jumpskirt = FALSE

	id = /obj/item/card/id/advanced/black_blank
	id_trim = /datum/id_trim/job/internal_tribunal_department_officer
	uniform = /obj/item/clothing/under/suit/charcoal
	backpack_contents = list(
		/obj/item/assembly/flash/handheld = 1
	)
	belt = /obj/item/modular_computer/tablet/pda/foundation_tribunal
	ears = /obj/item/radio/headset/heads/captain
	glasses = /obj/item/clothing/glasses/sunglasses
	gloves = /obj/item/clothing/gloves/color/white
	shoes = /obj/item/clothing/shoes/laceup

	backpack = /obj/item/storage/backpack
	satchel = /obj/item/storage/backpack/satchel/cap
	duffelbag = /obj/item/storage/backpack/duffelbag/captain

	chameleon_extras = list(
		/obj/item/gun/energy/e_gun,
		/obj/item/stamp/sid,
		)
	implants = list(/obj/item/implant/mindshield)
	skillchips = list(/obj/item/skillchip/disk_verifier)

/datum/outfit/job/internal_tribunal_department_officer/mod
	name = "Internal Tribunal Department Officer (MODsuit)"

	suit_store = /obj/item/tank/internals/oxygen
	back = /obj/item/mod/control/pre_equipped/magnate
	suit = null
	head = null
	mask = /obj/item/clothing/mask/gas/atmos/captain
	internals_slot = ITEM_SLOT_SUITSTORE
	backpack_contents = null
	box = null

/datum/outfit/job/internal_tribunal_department_officer/mod/post_equip(mob/living/carbon/human/equipped, visualsOnly)
	. = ..()
	if(visualsOnly)
		return

	var/obj/item/mod/control/modsuit = equipped.back
	var/obj/item/mod/module/pathfinder/module = locate() in modsuit.modules
	module.implant.implant(equipped, silent = TRUE)
