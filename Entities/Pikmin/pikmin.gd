class_name Pikmin extends CharacterBody2D
@export var state_machine: StateMachine
@export var speed: float
@export var throw_angle: float

var target_ship: Vector2
var target_onion: Vector2
var target_throw: Vector2

const sprite_default_position: Vector2 = Vector2(0, -14)

func take_damage():
	## check if pikmin type is immune to said damage
	die()

func die():
	## play death animation
	## remove self from lists
	queue_free()
