// -- Datums -- //

/datum/shuttle_destination/excursion/virgo2orbit
	name = "Virgo 2 Orbit"
	my_area = /area/shuttle/excursion/space
	preferred_interim_area = /area/shuttle/excursion/space_moving
	skip_me = TRUE

	routes_to_make = list(
		/datum/shuttle_destination/excursion/bluespace = 30 SECONDS,
		/datum/shuttle_destination/excursion/virgo2orbit = 30 SECONDS
	)

/datum/shuttle_destination/excursion/aerostat
	name = "Remmi Autostat"
	my_area = /area/shuttle/excursion/away_aerostat
	//preferred_interim_area = /area/shuttle/excursion/virgo2_sky
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

//Atmosphere properties
#define VIRGO2_ONE_ATMOSPHERE	312.1 //kPa
#define VIRGO2_AVG_TEMP			612 //kelvin

#define VIRGO2_PER_N2		0.10 //percent
#define VIRGO2_PER_O2		0.03
#define VIRGO2_PER_N2O		0.00 //Currently no capacity to 'start' a turf with this. See turf.dm
#define VIRGO2_PER_CO2		0.87
#define VIRGO2_PER_PHORON	0.00

//Math only beyond this point
#define VIRGO2_MOL_PER_TURF		(VIRGO2_ONE_ATMOSPHERE*CELL_VOLUME/(VIRGO2_AVG_TEMP*R_IDEAL_GAS_EQUATION))
#define VIRGO2_MOL_N2			(VIRGO2_MOL_PER_TURF * VIRGO2_PER_N2)
#define VIRGO2_MOL_O2			(VIRGO2_MOL_PER_TURF * VIRGO2_PER_O2)
#define VIRGO2_MOL_N2O			(VIRGO2_MOL_PER_TURF * VIRGO2_PER_N2O)
#define VIRGO2_MOL_CO2			(VIRGO2_MOL_PER_TURF * VIRGO2_PER_CO2)
#define VIRGO2_MOL_PHORON		(VIRGO2_MOL_PER_TURF * VIRGO2_PER_PHORON)

//Turfmakers
#define VIRGO2_SET_ATMOS	nitrogen=VIRGO2_MOL_N2;oxygen=VIRGO2_MOL_O2;carbon_dioxide=VIRGO2_MOL_CO2;phoron=VIRGO2_MOL_PHORON;temperature=VIRGO2_AVG_TEMP
#define VIRGO2_TURF_CREATE(x)	x/virgo2/nitrogen=VIRGO2_MOL_N2;x/virgo2/oxygen=VIRGO2_MOL_O2;x/virgo2/carbon_dioxide=VIRGO2_MOL_CO2;x/virgo2/phoron=VIRGO2_MOL_PHORON;x/virgo2/temperature=VIRGO2_AVG_TEMP

VIRGO2_TURF_CREATE(/turf/simulated/sky/moving/south)
/turf/simulated/sky/moving/south/virgo2
	color = "#eaed9c"
/*
VIRGO2_TURF_CREATE()
VIRGO2_TURF_CREATE()
VIRGO2_TURF_CREATE()
VIRGO2_TURF_CREATE()
VIRGO2_TURF_CREATE()
*/

// -- Areas -- //

/area/shuttle/excursion/away_aerostat
	name = "\improper Excursion Shuttle - Aerostat"

// The aerostat shuttle
/area/shuttle/aerostat/docked
	name = "\improper Aerostat Shuttle - Dock"
	base_turf = /turf/simulated/floor/reinforced

/area/shuttle/aerostat/landed
	name = "\improper Aerostat Shuttle - Surface"
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
