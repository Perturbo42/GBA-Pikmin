class_name PikminIdle extends PikminState
@export var carry_detection: CarryingDetection
@export var attack_detection: AttackingDetection
@export var velocity_comp: PikminVelocityComponent
var checking: bool = true

func enter():
	pikmin.velocity = Vector2.ZERO
	checking = true

	pass

func update(_delta: float):
	if checking:
		checking = carry_detection.check_for_carry()
	if checking:
		checking = attack_detection.check_for_enemy()
	pass

func physics_update(delta: float):
	velocity_comp.move_with_separation(delta)
	pass

func exit():
	pass
