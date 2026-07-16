class_name Bulborb extends Enemy
@onready var idle: BulborbIdle = $"Bulborb State Machine/Idle"
@onready var chase: BulborbChase = $"Bulborb State Machine/Chase"

@export var chase_target = CharacterBody2D

func _on_detection_area_body_entered(body: Node2D) -> void:
	if state_machine.curr_state == idle:
		if body is Pikmin or body is Olimar:
			state_machine.change_state("Chase")
			chase_target = body
	pass # Replace with function body.


func _on_detection_area_body_exited(body: Node2D) -> void:
	if state_machine.curr_state == chase:
		if body == chase_target:
			var new_body: Node2D = null
			if detection_area.get_overlapping_bodies():
				new_body = detection_area.get_overlapping_bodies()[0]
				chase_target = new_body
			if new_body == null:
				state_machine.change_state("Return")
	pass # Replace with function body.
