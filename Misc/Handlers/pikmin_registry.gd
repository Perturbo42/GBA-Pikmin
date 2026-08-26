extends Node

var all_pikmin : Array[Pikmin] 
var memberships: Dictionary = {}

func register_pikmin(pikmin: Pikmin):
	if pikmin in all_pikmin:
		return
	pikmin.pikmin_dead.connect(pikmin_dies)
	all_pikmin.append(pikmin)
	memberships[pikmin] = []

func add_pikmin_to_group(pikmin: Pikmin, group: PikminGroup):
	if not is_instance_valid(pikmin):
		return
	if not is_instance_valid(group):
		return
	
	if group in memberships[pikmin]:
		return
	
	memberships[pikmin].append(group)
	group.add_pikmin(pikmin)

func remove_pikmin_from_group(pikmin: Pikmin, group: PikminGroup):
	if not is_instance_valid(pikmin):
		return
	if not is_instance_valid(group):
		return
	
	if group in memberships[pikmin]:
		memberships[pikmin].erase(group)
		group.remove_pikmin(pikmin)

func pikmin_dies(pikmin: Pikmin):
	## go through each group in memberships[pikmin] 
	## and tell it to remove this pikmin
	for group in memberships[pikmin].duplicate():
		remove_pikmin_from_group(pikmin, group)
	memberships.erase(pikmin)
	all_pikmin.erase(pikmin)
	pikmin.queue_free()

func remove_all_from_group(group: PikminGroup):
	if not is_instance_valid(group):
		return
	
	for pikmin in group.pikmin_arr.duplicate():
		remove_pikmin_from_group(pikmin, group)

func does_group_contain_pikmin(pikmin: Pikmin, group: PikminGroup) -> bool:
	if not is_instance_valid(pikmin):
		return false
	if not is_instance_valid(group):
		return false
	
	return group.pikmin_arr.has(pikmin)
