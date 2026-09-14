class_name PikminKnockback extends PikminState
@export var velocity_comp: PikminVelocityComponent
const DECEL: float = 500

func enter():
	pikmin.velocity = velocity_comp.knockback_velocity
	pass

func update(_delta: float):
	pass

func physics_update(delta: float):
	pikmin.velocity = pikmin.velocity.move_toward(
		Vector2.ZERO,
		DECEL * delta
	)
	pikmin.move_and_slide()
	
	if pikmin.velocity.length_squared() < 1.0:
		finished.emit(IDLE)
	pass

func exit():
	pass
