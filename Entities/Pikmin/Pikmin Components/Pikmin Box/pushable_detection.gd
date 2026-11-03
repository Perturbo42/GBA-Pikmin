class_name PushableDetection extends Area2D
@export_category("External Properties")
@export var pikmin: Pikmin
@export var state_machine: StateMachine
@export var idle_state: PikminState
@export var push_state: PikminState
@export var targetting_component: TargettingComponent

func check_for_push():
	if !pikmin or !pikmin.alive:
		return false
	if state_machine.curr_state != idle_state:
		return false
	
	var nearest_push: Area2D = null
	var nearest_distance: float = INF
	
	for area in get_overlapping_areas():
		if area is PushableArea:
			if area.has_empty_slots():
				var dist = pikmin.global_position.distance_to(area.global_position)
				if nearest_distance > dist:
					nearest_distance = dist
					nearest_push = area
	
	if !is_instance_valid(nearest_push):
		return true
	
	## Subject to change due to the nature of needing to go to a specific slot.
	targetting_component.target = targetting_component.Targets.PUSH
	targetting_component.target_node = nearest_push.owner
	state_machine.change_state(push_state.name)
	return false
