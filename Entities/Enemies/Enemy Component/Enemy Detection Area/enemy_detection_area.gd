class_name EnemyDetectionArea extends Area2D

@export var enemy: Enemy
@export var state_machine: StateMachine
@export var detect_state: State
@export var stop_detecting_state: State

func _on_body_entered(body: Node2D) -> void:
	if state_machine.curr_state.can_detect:
		if body is Pikmin or body is Olimar:
			state_machine.change_state(detect_state.name)
			enemy.target = body
	enemy.enemies_in_range.append(body)


func _on_body_exited(body: Node2D) -> void:
	if state_machine.curr_state.can_stop_detecting:
		if body == enemy.target:
			var new_body: Node2D = null
			if get_overlapping_bodies():
				new_body = get_overlapping_bodies()[0]
				enemy.target = new_body
			if new_body == null:
				state_machine.change_state(stop_detecting_state.name)
	enemy.enemies_in_range.erase(body)
