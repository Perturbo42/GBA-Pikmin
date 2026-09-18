class_name AttackingDetection extends Area2D
@export_category("External Properties")
@export var pikmin: Pikmin
@export var state_machine: StateMachine
@export var moving_state: State
@export var targetting_component: TargettingComponent

func check_for_enemy():
	if !pikmin:
		return
	var nearest_enemy: Area2D = null
	var nearest_distance: float = INF
	
	for area in get_overlapping_areas():
		if area.is_in_group("Enemy"):
			var dist = pikmin.global_position.distance_to(area.global_position)
			if nearest_distance > dist:
				nearest_distance = dist
				nearest_enemy = area
	if not is_instance_valid(nearest_enemy):
		return
	print(nearest_enemy)
	
	targetting_component.target = targetting_component.Targets.CORPSE
	targetting_component.target_location = nearest_enemy.global_position
	state_machine.change_state(moving_state.name)
