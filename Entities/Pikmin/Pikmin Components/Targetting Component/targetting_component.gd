class_name TargettingComponent extends Node
enum Targets {CORPSE, TREASURE, SHIP, ONION}
@export var moving_state: State
@export var carry_state: State
@export var idle_state: State

var target: Targets
var target_location: Vector2
var next_state: Dictionary

func _ready() -> void:
	next_state = {
	Targets.CORPSE : carry_state,
	Targets.TREASURE : carry_state,
	Targets.SHIP : idle_state,
	Targets.ONION : idle_state
}

func get_next_state() -> String:
	return next_state[target].name
