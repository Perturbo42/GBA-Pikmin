class_name TargettingComponent extends Node
enum Targets {CORPSE, TREASURE, ENEMY}
@export var moving_state: State
@export var carry_state: State
@export var attach_state: State

var target: Targets
var target_location: Vector2
var next_state: Dictionary

func _ready() -> void:
	next_state = {
	Targets.CORPSE : carry_state,
	Targets.TREASURE : carry_state,
	Targets.ENEMY : attach_state
}

func get_next_state() -> String:
	return next_state[target].name
