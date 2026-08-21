class_name OlimarHurtbox extends Area2D

@export_category("External Properties")
@export var state_machine: StateMachine
@export var damaged_state: State

@export_category("Internal Properties")
var invincible: bool

func _ready() -> void:
	invincible = false

func take_damage(damage: int):
	if invincible:
		return
	GameState.health -= damage
	if GameState.health > 0:
		state_machine.change_state(damaged_state.name)
	else:
		##insert olimar dying logic here
		pass
	pass
