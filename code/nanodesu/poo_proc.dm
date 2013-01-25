
//История запомнит меня как человека, добавившего фекалии в Space Station. О-ху-еть.

/mob/living/carbon/human/proc/poo()
	if(!lastshit &&  (nutrition > 401))
		lastshit = 1
		src << "<spawn class='warning'>You feel like you wanna shit..."
		spawn(150)	//15 seconds until second warning
			src << "<spawn class='warning'>You feel like you are about to shit!"
			spawn(100)	//and you have 10 more for mad dash to the bucket
				Stun(1)

				src.visible_message("<spawn class='warning'>[src] shits up!","<spawn class='warning'>You shit!")
				playsound(loc, 'sound/effects/splat.ogg', 50, 1)

				var/turf/location = loc
				if (istype(location, /turf/simulated))
					location.add_poo_floor(src, 1)

				nutrition -= 25
				adjustToxLoss(-3)
				spawn(350)	//wait 35 seconds before next volley
					lastshit = 0
