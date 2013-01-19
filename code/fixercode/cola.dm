/obj/item/weapon/reagent_containers/food/drinks/bottle/realcola
	name = "Cola"
	desc = "Cola. Traditional."
	icon_state = "colar"

	New()
		..()
		reagents.add_reagent("cola", 30)
		src.pixel_x = rand(-10.0, 10)
		src.pixel_y = rand(-10.0, 10)



/obj/item/weapon/reagent_containers/food/snacks/mentos
	name = "Mentos"
	desc = "Space Mentos."
	icon_state = "mentos"

	New()
		..()
		reagents.add_reagent("nutriment", 6)


/obj/item/weapon/reagent_containers/food/drinks/bottle/realcola/attackby(obj/item/W as obj, mob/user as mob)
	..()
	var/datum/reagents/R = src.reagents
	if(istype(W,/obj/item/weapon/reagent_containers/food/snacks/mentos))
		if(R && R.total_volume)
			new /obj/effect/decal/cleanable/cola (src.loc)
			explosion( src.loc, -1, -1, 1, 2)
			view() << "\red[usr] puts one mentos to cola. Bottle explodes throwing its contents outside."
			var/datum/effect/effect/system/steam_spread/steam = new /datum/effect/effect/system/steam_spread()
			steam.set_up(10, 0, get_turf(src))
			steam.attach(src)
			steam.start()
			del(src)
		else
			view() << "[usr] puts one mentos to empty cola bottle. Nothing happens."


/obj/effect/decal/cleanable/cola
	name = "Cola"
	desc = "Leap cola."
	gender = PLURAL
	density = 0
	anchored = 1
	layer = 2
	icon = 'blood.dmi'
	icon_state = "cola"
	random_icon_states = list("cola")

