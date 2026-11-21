/obj/machinery/id_card_printer
	name = "Foundation ID Card Printer"
	desc = "A machine used to print and modify Foundation keycards with appropriate access levels."
	icon = 'icons/obj/machines/nuke.dmi'
	icon_state = "nuclearbomb_base"
	density = TRUE
	anchored = TRUE
	use_power = IDLE_POWER_USE
	idle_power_usage = 20
	circuit = /obj/item/circuitboard/machine/id_card_printer

/obj/machinery/id_card_printer/attack_hand(mob/user)
	if(!ishuman(user))
		return
	ui_interact(user)

/obj/machinery/id_card_printer/ui_interact(mob/user, datum/tgui/ui)
	. = ..()
	ui = SStgui.try_update_ui(user, src, ui)
	if(!ui)
		ui = new(user, src, "FoundationIDPrinter", name)
		ui.open()

/obj/machinery/id_card_printer/ui_data(mob/user)
	var/list/data = list()
	var/mob/living/carbon/human/H = user
	var/obj/item/card/id/id_card = H?.get_idcard(TRUE)
	if(!id_card)
		data["has_card"] = FALSE
		return data

	data["has_card"] = TRUE
	data["card_name"] = id_card.registered_name
	data["card_rank"] = id_card.assignment
	data["card_access"] = list()
	data["available_access"] = list()

	var/list/all_access = list(
		"Security" = list(ACCESS_SECURITY_LVL1, ACCESS_SECURITY_LVL2, ACCESS_SECURITY_LVL3, ACCESS_SECURITY_LVL4, ACCESS_SECURITY_LVL5),
		"Command" = list(ACCESS_ADMIN_LVL1, ACCESS_ADMIN_LVL2, ACCESS_ADMIN_LVL3, ACCESS_ADMIN_LVL4, ACCESS_ADMIN_LVL5),
		"Science" = list(ACCESS_SCIENCE_LVL1, ACCESS_SCIENCE_LVL2, ACCESS_SCIENCE_LVL3, ACCESS_SCIENCE_LVL4, ACCESS_SCIENCE_LVL5),
		"Medical" = list(ACCESS_MEDICAL_LVL1, ACCESS_MEDICAL_LVL2, ACCESS_MEDICAL_LVL3, ACCESS_MEDICAL_LVL4, ACCESS_MEDICAL_LVL5),
		"Engineering" = list(ACCESS_ENGINEERING_LVL1, ACCESS_ENGINEERING_LVL2, ACCESS_ENGINEERING_LVL3, ACCESS_ENGINEERING_LVL4, ACCESS_ENGINEERING_LVL5),
		"Logistics" = list(ACCESS_LOGISTICS_LVL1, ACCESS_LOGISTICS_LVL2, ACCESS_LOGISTICS_LVL3, ACCESS_LOGISTICS_LVL4),
		"Service" = list(ACCESS_SERVICE_LVL1, ACCESS_SERVICE_LVL2, ACCESS_SERVICE_LVL3, ACCESS_SERVICE_LVL4, ACCESS_SERVICE_LVL5),
		"D-Class" = list(ACCESS_DCLASS, ACCESS_DCLASS_MINING, ACCESS_DCLASS_BOTANY, ACCESS_DCLASS_JANITORIAL, ACCESS_DCLASS_KITCHEN),
		"Central" = list(ACCESS_MTF, ACCESS_MTF_LEADER, ACCESS_CENTRAL, ACCESS_CENTRAL_HR, ACCESS_ISD, ACCESS_O5),
	)

	for(var/category in all_access)
		var/list/cat_access = all_access[category]
		var/list/cat_data = list()
		cat_data["category"] = category
		cat_data["entries"] = list()
		for(var/acc in cat_access)
			cat_data["entries"] += list(list(
				"access" = acc,
				"name" = get_access_name(acc),
				"granted" = (acc in id_card.access),
			))
		data["available_access"] += list(cat_data)

	return data

/obj/machinery/id_card_printer/proc/get_access_name(access_num)
	switch(access_num)
		if(ACCESS_SECURITY_LVL1)
			return "Security Level 1"
		if(ACCESS_SECURITY_LVL2)
			return "Security Level 2"
		if(ACCESS_SECURITY_LVL3)
			return "Security Level 3"
		if(ACCESS_SECURITY_LVL4)
			return "Security Level 4"
		if(ACCESS_SECURITY_LVL5)
			return "Security Level 5"
		if(ACCESS_ADMIN_LVL1)
			return "Admin Level 1"
		if(ACCESS_ADMIN_LVL2)
			return "Admin Level 2"
		if(ACCESS_ADMIN_LVL3)
			return "Admin Level 3"
		if(ACCESS_ADMIN_LVL4)
			return "Admin Level 4"
		if(ACCESS_ADMIN_LVL5)
			return "Admin Level 5"
		if(ACCESS_SCIENCE_LVL1)
			return "Science Level 1"
		if(ACCESS_SCIENCE_LVL2)
			return "Science Level 2"
		if(ACCESS_SCIENCE_LVL3)
			return "Science Level 3"
		if(ACCESS_SCIENCE_LVL4)
			return "Science Level 4"
		if(ACCESS_SCIENCE_LVL5)
			return "Science Level 5"
		if(ACCESS_MEDICAL_LVL1)
			return "Medical Level 1"
		if(ACCESS_MEDICAL_LVL2)
			return "Medical Level 2"
		if(ACCESS_MEDICAL_LVL3)
			return "Medical Level 3"
		if(ACCESS_MEDICAL_LVL4)
			return "Medical Level 4"
		if(ACCESS_MEDICAL_LVL5)
			return "Medical Level 5"
		if(ACCESS_ENGINEERING_LVL1)
			return "Engineering Level 1"
		if(ACCESS_ENGINEERING_LVL2)
			return "Engineering Level 2"
		if(ACCESS_ENGINEERING_LVL3)
			return "Engineering Level 3"
		if(ACCESS_ENGINEERING_LVL4)
			return "Engineering Level 4"
		if(ACCESS_ENGINEERING_LVL5)
			return "Engineering Level 5"
		if(ACCESS_LOGISTICS_LVL1)
			return "Logistics Level 1"
		if(ACCESS_LOGISTICS_LVL2)
			return "Logistics Level 2"
		if(ACCESS_LOGISTICS_LVL3)
			return "Logistics Level 3"
		if(ACCESS_LOGISTICS_LVL4)
			return "Logistics Level 4"
		if(ACCESS_SERVICE_LVL1)
			return "Service Level 1"
		if(ACCESS_SERVICE_LVL2)
			return "Service Level 2"
		if(ACCESS_SERVICE_LVL3)
			return "Service Level 3"
		if(ACCESS_SERVICE_LVL4)
			return "Service Level 4"
		if(ACCESS_SERVICE_LVL5)
			return "Service Level 5"
		if(ACCESS_DCLASS)
			return "D-Class"
		if(ACCESS_DCLASS_MINING)
			return "D-Class Mining"
		if(ACCESS_DCLASS_BOTANY)
			return "D-Class Botany"
		if(ACCESS_DCLASS_JANITORIAL)
			return "D-Class Janitorial"
		if(ACCESS_DCLASS_KITCHEN)
			return "D-Class Kitchen"
		if(ACCESS_MTF)
			return "MTF"
		if(ACCESS_MTF_LEADER)
			return "MTF Leader"
		if(ACCESS_CENTRAL)
			return "Central Office"
		if(ACCESS_CENTRAL_HR)
			return "Central Admin"
		if(ACCESS_ISD)
			return "Internal Security"
		if(ACCESS_O5)
			return "REDACTED"
		else
			return "Clearance #[access_num]"

/obj/machinery/id_card_printer/ui_act(action, params, datum/tgui/ui, datum/ui_state/state)
	. = ..()
	if(.)
		return

	var/mob/living/carbon/human/H = ui.user
	var/obj/item/card/id/id_card = H.get_idcard(TRUE)
	if(!id_card)
		return

	var/obj/item/card/id/admin_card = H.get_idcard(TRUE)
	if(!(ACCESS_ADMIN_LVL1 in admin_card.access))
		to_chat(H, span_warning("You need Administrator access to modify cards."))
		return

	switch(action)
		if("grant_access")
			var/access_num = text2num(params["access"])
			if(access_num && !(access_num in id_card.access))
				id_card.access += access_num
				id_card.update_label()
				playsound(src, 'sound/machines/ping.ogg', 30, TRUE)
		if("revoke_access")
			var/access_num = text2num(params["access"])
			if(access_num && (access_num in id_card.access))
				id_card.access -= access_num
				id_card.update_label()
				playsound(src, 'sound/machines/ping.ogg', 30, TRUE)
		if("set_rank")
			var/new_rank = params["rank"]
			if(new_rank)
				id_card.assignment = new_rank
				id_card.update_label()
		if("print_new")
			var/obj/item/card/id/advanced/new_card = new(get_turf(src))
			new_card.registered_name = id_card.registered_name
			new_card.assignment = "Unassigned"
			H.put_in_hands(new_card)
			playsound(src, 'sound/machines/ping.ogg', 50, TRUE)
