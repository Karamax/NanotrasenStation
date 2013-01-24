
// Ass, masturbate and other stuff a-la D2K5

/obj/item/weapon/reagent_containers/food/snacks/human/ass //yes, this is the same as meat. I might do something different in future
	name = "ass"
	desc = "A human ass. Its made of meat."
	icon = 'icons/obj/ass_stuff.dmi'
	icon_state = "ass"
	New()
		..()
		reagents.add_reagent("nutriment", 3)
		src.bitesize = 3

/obj/item/weapon/reagent_containers/food/snacks/human/assburger
	name = "-assburger"
	desc = "A bloody assburger."
	icon_state = "hburger"
	New()
		..()
		reagents.add_reagent("nutriment", 6)
		bitesize = 2

/datum/recipe/human/assburger
	reagents = list("flour" = 5)
	items = list(
		/obj/item/weapon/reagent_containers/food/snacks/human/ass
	)
	result = /obj/item/weapon/reagent_containers/food/snacks/human/assburger
