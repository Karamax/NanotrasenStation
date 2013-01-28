
// Ass, masturbate and other stuff a-la D2K5

/obj/item/weapon/reagent_containers/food/snacks/human/ass //yes, this is the same as meat. I might do something different in future
	name = "ass"
	desc = "A human ass. Its made of meat."
	icon = 'icons/nanotrasen/ass_stuff.dmi'
	icon_state = "ass"
	New()
		..()
		reagents.add_reagent("nutriment", 3)
		src.bitesize = 3

/obj/item/weapon/reagent_containers/food/snacks/human/assburger
	name = "-assburger"
	desc = "A bloody assburger."
	icon = 'icons/nanotrasen/ass_stuff.dmi'
	icon_state = "assburger"
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


/mob/var/masturbating = 0
/mob/living/carbon/human/verb/masturbate()
	set name = "Masturbate Onto"
	set category = "Fun"
	set hidden = 1

	if (!src)
		world.log << "DEBUG: The VOID tried to masturbate!"
		return

	if (!ticker)
		src << "You canot masturbate before the game starts!"
		return

	if (!src.loc)
		src << "You are located nowhere. You cannot masturbate."
		return

	if (masturbating)
		src << "You're already masturbating! Be patient!"
		return

	var/list/dest = list() //List of possible targets(mobs)
	var/target = null	   //Chosen target.

	for(var/mob/living/M in view(src.loc))
		dest += M

	if (dest.len<1)
		src << "Nobody to masturbate here" //Not happens - you can always masturbate to yourself!
		return

	target = input("Please, select a target!", "Masturbate onto", null, null) as null|anything in dest

	if (!target)//Make sure we actually have a target
		return
	else
		//var/mob/D = dest[target] //Destination mob - FIX NOTWORKS
		//var/mob/A = src			 //Source mob
		// You're masturbating onto D - undef
		//TODO
		src << "\red You're masturbating onto [target]"
