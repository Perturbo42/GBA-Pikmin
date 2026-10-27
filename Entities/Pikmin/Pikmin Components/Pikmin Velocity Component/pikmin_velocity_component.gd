class_name PikminVelocityComponent extends Node
@export_group("External Categories")
@export var pikmin: Pikmin
@export var dir_comp: DirectionComponent

@export_group("Internal Categories")
@export var accel_speed: float
@export var decel_speed: float
@export var separation_radius := 12.0
@export var separation_weight := 1.5
var knockback_velocity: Vector2

func move_to_target(delta: float, target: Vector2, min_dist_to_target: float):
	if check_dist_to_target(target, min_dist_to_target):
		var dir = pikmin.global_position.direction_to(target)
		var separation = get_separation()
		dir = (dir + separation * separation_weight).normalized()
		
		pikmin.velocity = pikmin.velocity.move_toward(
			dir * pikmin.speed,
			accel_speed * delta
		)
	else:
		pikmin.velocity = pikmin.velocity.move_toward(
			Vector2.ZERO,
			decel_speed * delta
		)
	
	pikmin.move_and_slide()
	dir_comp.check_dir()

func check_dist_to_target(target: Vector2, min_dist_to_target: float) -> bool:
	if pikmin.global_position.distance_to(target) > min_dist_to_target:
		return true
	else:
		return false

func apply_knockback(dir: Vector2, force: float):
	knockback_velocity = dir.normalized() * force

func move_with_separation(delta: float) -> void:
	var separation = get_separation()
	var target_velocity = separation * pikmin.speed
	pikmin.velocity = pikmin.velocity.move_toward(
		target_velocity,
		(separation_weight if separation != Vector2.ZERO else decel_speed) * delta
	)
	
	pikmin.move_and_slide()
	dir_comp.check_dir()

func get_separation() -> Vector2:
	var separation := Vector2.ZERO
	
	for other in PikminRegistry.all_pikmin:
		if not is_instance_valid(other) or other == pikmin:
			continue
		
		var offset = pikmin.global_position - other.global_position
		var distance = offset.length()
		
		if distance > 0.0 and distance < separation_radius:
			var strength = 1.0 - distance / separation_radius
			separation += offset.normalized() * strength
	
	return separation.normalized()
