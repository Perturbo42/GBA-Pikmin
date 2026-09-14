class_name Pikmin extends CharacterBody2D
enum stage{LEAF, BUD, FLOWER}

@export_category("External Properties")
@export var state_machine: StateMachine
@export var velocity_comp: PikminVelocityComponent

@export_category("Stats")
@export var damage: int
@export var speed: float
@export var throw_angle: float

@warning_ignore("unused_signal")
signal pikmin_dead(Pikmin)

var target_throw: Vector2
var curr_stage: stage

const sprite_default_position: Vector2 = Vector2(0, -14)

func pikmin_carry_speed() -> float:
	if curr_stage == stage.LEAF:
		return 1.0
	elif curr_stage == stage.BUD:
		return 1.5
	else:
		return 2.0

func apply_knockback(dir: Vector2, force: float):
	velocity_comp.apply_knockback(dir, force)
	state_machine.change_state(PikminState.KNOCKBACK)
