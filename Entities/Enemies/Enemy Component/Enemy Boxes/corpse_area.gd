class_name CorpseArea extends CarryArea

func find_destination() -> Waypoint:
	var red_count: int = 0
	var yellow_count: int = 0
	var blue_count: int = 0
	for pikmin in pikmin_dict:
		if pikmin is RedPikmin:
			red_count += 1
		elif pikmin is YellowPikmin:
			yellow_count += 1
		elif pikmin is BluePikmin:
			blue_count += 1
	
	var max_count = max(red_count, yellow_count, blue_count)
	
	if red_count == max_count:
		return WaypointHandler.red_onion
	elif yellow_count == max_count:
		return WaypointHandler.yellow_onion
	elif blue_count == max_count:
		return WaypointHandler.blue_onion
	else:
		return WaypointHandler.ship

func return_seeds():
	return carry.seeds

func destroy_self():
	PikminRegistry.remove_all_from_group(group)
	obj.free_self()
