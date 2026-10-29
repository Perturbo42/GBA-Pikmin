class_name EnemyHurtbox extends Area2D

@export_group("External Categories")
@export var enemy: Enemy
@export var state_machine: StateMachine
@export var dead_state: State
@export var group: Node

@export_group("Internal Categories")
@export var attachable: bool
@export var detectable: bool

func take_damage(health_loss: int):
	if enemy.health > 0:
		enemy.health -= health_loss
		if enemy.health <= 0:
			state_machine.change_state(dead_state.name)
			pass
		print(enemy.health)
