class_name EnemyHurtbox extends Area2D

@export_category("External Categories")
@export var enemy: Enemy
@export var state_machine: StateMachine
@export var dead_state: State
@export var group: Node

@export_category("Internal Categories")
@export var health: int

func _ready() -> void:
	health = enemy.health

func take_damage(health_loss: int):
	if health > 0:
		health -= health_loss
		if health <= 0:
			state_machine.change_state(dead_state.name)
			pass
		print(health)
