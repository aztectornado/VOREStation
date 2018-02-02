// -- Datums -- //

/datum/shuttle_destination/excursion/virgo2orbit
	name = "Virgo 2 Orbit"
	my_area = /area/shuttle/excursion/space
	preferred_interim_area = /area/shuttle/excursion/space_moving
	skip_me = TRUE

	routes_to_make = list(
		/datum/shuttle_destination/excursion/bluespace = 30 SECONDS
		/datum/shuttle_destination/excursion/virgo2orbit = 30 SECONDS
	)

/datum/shuttle_destination/excursion/aerostat
	name = "Remmi Autostat"
	my_area = /area/shuttle/excursion/away_aerostat
	preferred_interim_area = /area/shuttle/excursion/virgo2_sky
	skip_me = TRUE

	routes_to_make = list(
		/datum/shuttle_destination/excursion/virgo4orbit = 30 SECONDS
	)

// -- Objs -- //

/obj/shuttle_connector/beach
	name = "shuttle connector - aerostat"
	shuttle_name = "Excursion Shuttle"
	destinations = list(/datum/shuttle_destination/excursion/virgo2orbit, /datum/shuttle_destination/excursion/aerostat)

// -- Turfs -- //

// -- Areas -- //

/area/shuttle/excursion/away_aerostat
	name = "\improper Excursion Shuttle - Aerostat"

// The aerostat shuttle
/area/shuttle/aerostat/docked
	name = "\improper Aerostat Shuttle - Dock"
	base_turf = /turf/simulated/floor/reinforced

/area/shuttle/aerostat/landed
	name = "\improper Aerostat Shuttle - Dock"
	base_turf = /turf/simulated/floor/reinforced

//The aerostat itself
/area/tether_away/aerostat
	name = "\improper Away Mission - Aerostat"
	icon_state = "away"
	base_turf = /turf/simulated/floor/plating
	requires_power = 0



/area/tether_away/cave
	flags = RAD_SHIELDED
	ambience = list('sound/ambience/ambimine.ogg', 'sound/ambience/song_game.ogg')

/area/tether_away/cave/explored/normal
	name = "Tunnels"
	icon_state = "explored"

/area/tether_away/cave/unexplored/normal
	name = "Tunnels"
	icon_state = "unexplored"

/area/tether_away/cave/explored/deep
	name = "Depths"
	icon_state = "explored_deep"

/area/tether_away/cave/unexplored/deep
	name = "Depths"
	icon_state = "unexplored_deep"
