//
// New method of handling pipe construction.  Instead of numeric constants and a giant switch statement of doom
// 	every pipe type has a datum instance which describes its name, placement rules and construction method, dispensing etc.
// The advantages are obvious, mostly in simplifying the code of the dispenser, and the ability to add new pipes without hassle.
//

// Abstract pipe type declaration
/datum/pipe_construction
	name = "Abstract Pipe (fixme)"
	var/pipe_id = -1  // The legacy pipe id defined in construction.dm  (Is this needed? We'll see)
	
	var/obj/item/pipe/pipe_type // This is the type PATH to the type of pipe we will construct
	
	var/connect_type // TODO - Do we need this? Can't we read it off of the actual pipe type?
	
	// Things that control construtcion
	var/normalize_dir = FALSE
	

	
/obj/item/pipe/New(var/loc, var/pipe_type as num, var/dir as num, var/obj/machinery/atmospherics/make_from = null)
	// Such
	

	