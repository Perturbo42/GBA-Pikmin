extends Node

var all_pikmin : Array[Pikmin] 
var memberships: Dictionary = {}

func register_pikmin(pikmin: Pikmin):
	pikmin.pikmin_dead.connect(pikmin_dies)
	all_pikmin.append(pikmin)
	memberships[pikmin] = []

func add_pikmin_to_group(pikmin: Pikmin, group: Node):
	if !pikmin:
		return
	if group in memberships[pikmin]:
		return
	
	memberships[pikmin].append(group)
	

func remove_pikmin_from_group(pikmin: Pikmin, group: Node):
	if !pikmin:
		return
	if group in memberships[pikmin]:
		memberships[pikmin].remove(group)

func pikmin_dies(pikmin: Pikmin):
	## go through each group in memberships[pikmin] 
	## and tell it to remove this pikmin
	memberships.erase(pikmin)
	all_pikmin.erase(pikmin)
	
