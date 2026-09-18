class_name PikminIdle extends PikminState
@export var carry_detection: CarryingDetection
@export var attack_detection: AttackingDetection

func enter():
	pikmin.velocity = Vector2.ZERO

	pass

func update(_delta: float):
	carry_detection.check_for_carry()
	attack_detection.check_for_enemy()
	pass

func physics_update(_delta: float):
	pass

func exit():
	pass
