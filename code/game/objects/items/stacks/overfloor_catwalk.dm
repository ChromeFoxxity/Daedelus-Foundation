//Catwalk Tiles
/obj/item/stack/tile/catwalk_tile //This is our base type, sprited to look maintenance-styled
	name = "catwalk plating"
	singular_name = "catwalk plating tile"
	desc = "Flooring that shows its contents underneath. Engineers love it!"
	icon_state = "maint_catwalk"
	inhand_icon_state = "tile-catwalk"
	mats_per_unit = list(/datum/material/iron=100)
	turf_type = /turf/open/floor/catwalk_floor
	merge_type = /obj/item/stack/tile/catwalk_tile //Just to be cleaner, these all stack with each other
	tile_reskin_types = list(
		/obj/item/stack/tile/catwalk_tile,
		/obj/item/stack/tile/catwalk_tile/iron,
		/obj/item/stack/tile/catwalk_tile/iron_white,
		/obj/item/stack/tile/catwalk_tile/iron_dark,
		/obj/item/stack/tile/catwalk_tile/titanium,
		/obj/item/stack/tile/catwalk_tile/iron_smooth, //this is the original greenish one
	)

/obj/item/stack/tile/catwalk_tile/sixty
	amount = 60

/obj/item/stack/tile/catwalk_tile/iron
	name = "iron catwalk floor"
	singular_name = "iron catwalk floor tile"
	icon_state = "iron_catwalk"
	turf_type = /turf/open/floor/catwalk_floor/iron

/obj/item/stack/tile/catwalk_tile/iron_white
	name = "white catwalk floor"
	singular_name = "white catwalk floor tile"
	icon_state = "whiteiron_catwalk"
	turf_type = /turf/open/floor/catwalk_floor/iron_white

/obj/item/stack/tile/catwalk_tile/iron_dark
	name = "dark catwalk floor"
	singular_name = "dark catwalk floor tile"
	icon_state = "darkiron_catwalk"
	turf_type = /turf/open/floor/catwalk_floor/iron_dark

/obj/item/stack/tile/catwalk_tile/titanium
	name = "titanium catwalk floor"
	singular_name = "titanium catwalk floor tile"
	icon_state = "titanium_catwalk"
	turf_type = /turf/open/floor/catwalk_floor/titanium

/obj/item/stack/tile/catwalk_tile/iron_smooth //this is the greenish one
	name = "smooth iron catwalk floor"
	singular_name = "smooth iron catwalk floor tile"
	icon_state = "smoothiron_catwalk"
	turf_type = /turf/open/floor/catwalk_floor/iron_smooth
