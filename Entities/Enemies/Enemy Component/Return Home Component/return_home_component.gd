class_name ReturnHomeComponent extends Node
@export_group("External Properties")
@export var enemy: Enemy
@export var state_machine: StateMachine
@export var idle_state: State

@export_group("Internal Properties")
@export var close_to_home: float

func return_home():
	var dist_to_home: float = enemy.global_position.distance_to(enemy.home_location)
	if dist_to_home <= close_to_home:
		state_machine.change_state(idle_state.name)
	else:
		var dir = enemy.global_position.direction_to(enemy.home_location)
		enemy.velocity = dir * enemy.speed
	
	enemy.move_and_slide()
	pass
