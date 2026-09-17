class_name PikminIdle extends PikminState
@export var carry_detection: CarryingDetection

func enter():
	pikmin.velocity = Vector2.ZERO

	pass

func update(_delta: float):
	
	carry_detection.check_for_carry()
	pass

func physics_update(_delta: float):
	pass

func exit():
	pass
