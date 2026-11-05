class_name Pikmin extends CharacterBody2D
enum stage{LEAF, BUD, FLOWER}

@export_category("External Properties")
@export var state_machine: StateMachine
@export var velocity_comp: PikminVelocityComponent
@export var targetting_comp: TargettingComponent
@export var collider_box: CollisionShape2D
@export var hurtbox: PikminHurtbox
@export var whistle_detection: Area2D

@export_category("Stats")
@export var damage: int
@export var speed: float
@export var throw_angle: float

@warning_ignore("unused_signal")
signal pikmin_dead(Pikmin)

var alive: bool = true
var target_throw: Vector2
var curr_stage: stage
var gather_offset: Vector2

const sprite_default_position: Vector2 = Vector2(0, -14)

func pikmin_carry_speed() -> float:
	if curr_stage == stage.LEAF:
		return 1.0
	elif curr_stage == stage.BUD:
		return 1.5
	else:
		return 2.0

func apply_knockback(dir: Vector2, force: float, source: CharacterBody2D):
	velocity_comp.apply_knockback(dir, force)
	state_machine.change_state(PikminState.KNOCKBACK)
	targetting_comp.target = targetting_comp.Targets.ENEMY
	targetting_comp.target_node = source

func drop(pos: Vector2):
	state_machine.change_state(PikminState.IDLE)
	global_position = pos

func assign_gather_offset(radius: float = 30.0) -> void:
	var angle = randf() * TAU
	var distance = sqrt(randf()) * radius
	gather_offset = Vector2.RIGHT.rotated(angle) * distance

func uninterruptable():
	collider_box.set_deferred("disabled", true)
	hurtbox.set_deferred("monitoring", false)
	whistle_detection.can_be_detected = false

func interruptable():
	collider_box.set_deferred("disabled", false)
	hurtbox.set_deferred("monitoring", true)
	whistle_detection.can_be_detected = true
