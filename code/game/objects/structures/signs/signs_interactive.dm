/obj/structure/sign/clock
	name = "wall clock"
	desc = "It's your run-of-the-mill wall clock showing the Alaska Standard Time. Perfect for staring at instead of working."
	icon_state = "clock"

MAPPING_DIRECTIONAL_HELPERS(/obj/structure/sign/clock, 32)

/obj/structure/sign/clock/examine(mob/user)
	. = ..()
	. += span_info("The current time is: [station_time()].")
	if(user.is_literate())
		. += span_info("That means it is currently [stationtime2text()] into the shift.")

/obj/structure/sign/calendar
	name = "wall calendar"
	desc = "It's an old-school wall calendar. Sure, it might be obsolete with modern technology, but it's still hard to imagine an office without one."
	icon_state = "calendar"

MAPPING_DIRECTIONAL_HELPERS(/obj/structure/sign/calendar, 32)

/obj/structure/sign/calendar/examine(mob/user)
	. = ..()
	. += span_info("The current date is: [stationdate2text(world.realtime, "DDD, MMM DD", world.timezone)], [CURRENT_STATION_YEAR].")
