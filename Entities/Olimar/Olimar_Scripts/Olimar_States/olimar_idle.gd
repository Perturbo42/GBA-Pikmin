class_name OlimarIdle extends OlimarState

func enter():
	olimar.velocity = Vector2.ZERO
	pass

func handle_input(_event: InputEvent):
	pass

func update(_delta: float):
	pass

func physics_update(_delta: float):
	olimar.move_and_slide()
	
	if Input.is_action_pressed("Left") or Input.is_action_pressed("Right") or Input.is_action_pressed("Up") or Input.is_action_pressed("Down"):
		finished.emit(MOVING)
	pass

func exit():
	pass
