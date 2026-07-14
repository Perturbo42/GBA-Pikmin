class_name Bulborb extends Enemy


func _on_detection_area_body_entered(body: Node2D) -> void:
	if state_machine.curr_state == BulborbIdle:
		state_machine.change_state("Chase")
	pass # Replace with function body.
