class_name PikminVelocityComponent extends Node
@export_group("External Categories")
@export var pikmin: Pikmin
@export var dir_comp: DirectionComponent

@export_group("Internal Categories")
@export var accel_speed: float
@export var decel_speed: float

func move_to_target(delta: float, target: Vector2, min_dist_to_target: float):
	if check_dist_to_target(target, min_dist_to_target):
		var dir = pikmin.global_position.direction_to(target)
		pikmin.velocity = pikmin.velocity.move_toward(dir * pikmin.speed, accel_speed * delta)
	else:
		pikmin.velocity = pikmin.velocity.move_toward(Vector2.ZERO, decel_speed * delta)
	
	pikmin.move_and_slide()
	dir_comp.check_dir()

func check_dist_to_target(target: Vector2, min_dist_to_target: float) -> bool:
	if pikmin.global_position.distance_to(target) > min_dist_to_target:
		return true
	else:
		return false
	
