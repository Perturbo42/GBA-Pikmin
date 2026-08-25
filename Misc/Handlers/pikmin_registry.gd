extends Node

var all_pikmin : Array[Pikmin] 
var memberships: Dictionary = {}

func register_pikmin(pikmin: Pikmin):
	pikmin.pikmin_dead.connect(pikmin_dies)
	all_pikmin.append(pikmin)
	memberships[pikmin] = []

func add_pikmin_to_group(pikmin: Pikmin, group: PikminGroup):
	if !pikmin:
		print("Pikmin is invalid")
		return
	if group in memberships[pikmin]:
		print("Pikmin already in Group")
		return
	
	memberships[pikmin].append(group)
	group.pikmin_arr.append(pikmin)
	print("Added pikmin to group")

func remove_pikmin_from_group(pikmin: Pikmin, group: PikminGroup):
	if !pikmin:
		return
	if group in memberships[pikmin]:
		memberships[pikmin].erase(group)
		group.pikmin_arr.erase(pikmin)

func pikmin_dies(pikmin: Pikmin):
	## go through each group in memberships[pikmin] 
	## and tell it to remove this pikmin
	for group in memberships[pikmin]:
		remove_pikmin_from_group(pikmin, group)
	memberships.erase(pikmin)
	all_pikmin.erase(pikmin)
	pikmin.queue_free()
	
