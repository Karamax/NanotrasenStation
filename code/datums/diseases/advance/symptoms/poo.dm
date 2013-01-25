/*
//////////////////////////////////////

Vomiting

	Very Very Noticable.
	Decreases resistance.
	Doesn't increase stage speed.
	Little transmittable.
	Medium Level.

Bonus
	Forces the affected mob to vomit!
	Meaning your disease can spread via
	people walking on vomit.
	Makes the affected mob lose nutrition and
	heal toxin damage.

//////////////////////////////////////
*/

/datum/symptom/poo

	name = "Poo"
	stealth = -2
	resistance = -1
	stage_speed = 0
	transmittable = 1
	level = 3

/datum/symptom/poo/Activate(var/datum/disease/advance/A)
	..()
	if(prob(SYMPTOM_ACTIVATION_PROB / 2))
		var/mob/living/M = A.affected_mob
		switch(A.stage)
			if(1, 2, 3, 4)
				M << "<span class='notice'>[pick("You feel like you wanna shit.", "You feel like you're going to shit up!")]</span>"
			else
				poo(M)

	return

/datum/symptom/poo/proc/poo(var/mob/living/M)

	M.visible_message("<B>[M]</B> shits on the floor!")

	M.nutrition -= 25
	M.adjustToxLoss(-3)

	var/turf/pos = get_turf(M)
	pos.add_poo_floor(M)
	playsound(pos, 'sound/effects/splat.ogg', 50, 1)