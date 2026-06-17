class_name OlimarMoving extends OlimarState

func enter():
	pass

func handle_input(_event: InputEvent):
	pass

func update(_delta: float):
	pass

func physics_update(_delta: float):
	var input_direction_x := Input.get_axis("Left", "Right")
	var input_direction_y := Input.get_axis("Up", "Down")
	var direction := Vector2(input_direction_x, input_direction_y).normalized()
	olimar.velocity = direction * olimar.speed
	olimar.move_and_slide()
	
	if olimar.velocity.is_zero_approx():
		finished.emit(IDLE)
	else:
		olimar.dir = direction
	pass

func exit():
	pass
