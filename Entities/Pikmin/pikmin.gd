class_name Pikmin extends CharacterBody2D
@export var state_machine: StateMachine
@export var speed: float
@export var throw_angle: float

var target_ship: Vector2
var target_onion: Vector2
var target_throw: Vector2

const sprite_default_position: Vector2 = Vector2(0, -14)
