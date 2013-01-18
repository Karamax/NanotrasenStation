/obj/item/weapon/gun/energy/laser/particlemagnum
	icon_state = "ronnonrevolver"
	desc = "The particle magnum is the standard sidearm of the Travelers. One is also carried by Ronon Dex. It is an energy weapon with settings for stun, kill, and incinerate."
	name ="Particle Magnum"
	force = 20
	origin_tech = null
	var/charge_tick = 0


	New()
		..()
		processing_objects.Add(src)


	Del()
		processing_objects.Remove(src)
		..()


	process()
		charge_tick++
		if(charge_tick < 4) return 0
		charge_tick = 0
		if(!power_supply) return 0
		power_supply.give(100)
		update_icon()
		return 1