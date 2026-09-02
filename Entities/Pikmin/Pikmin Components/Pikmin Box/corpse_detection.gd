class_name CorpseDetection extends Area2D
@export_category("External Properties")
@export var pikmin: Pikmin
@export var state_machine: StateMachine
@export var moving_state: State
@export var targetting_component: TargettingComponent
@export var carrying_component: CarryingComponent

func check_for_corpses():
	if !pikmin:
		return
	var nearest_corpse: Area2D = null
	var nearest_distance: float = INF
	
	for area in get_overlapping_areas():
		if area.can_be_detected:
			if area.has_empty_slots():
				var dist = pikmin.global_position.distance_to(area.global_position)
				if nearest_distance > dist:
					nearest_distance = dist
					nearest_corpse = area
	
	if not is_instance_valid(nearest_corpse):
		return
	
	carrying_component.current_thing = carrying_component.Thing.CORPSE
	carrying_component.current_area = nearest_corpse
	targetting_component.target = targetting_component.Targets.CORPSE
	targetting_component.target_location = nearest_corpse.global_position
	state_machine.change_state(moving_state.name)
