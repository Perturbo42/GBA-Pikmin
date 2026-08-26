class_name Pikmin extends CharacterBody2D
@export_category("External Properties")
@export var state_machine: StateMachine

@export_category("Stats")
@export var damage: int
@export var speed: float
@export var throw_angle: float

@warning_ignore("unused_signal")
signal pikmin_dead(Pikmin)

var target_ship: Vector2
var target_onion: Vector2
var target_throw: Vector2

const sprite_default_position: Vector2 = Vector2(0, -14)
