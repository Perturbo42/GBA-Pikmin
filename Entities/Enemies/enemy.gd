class_name Enemy extends CharacterBody2D
@export_category("External Properties")
@export var state_machine: StateMachine
@export var detection_area: Area2D

@export_category("Stats")
@export var health: int 
@export var speed: float
@export var damage: int

var home_location: Vector2
var target: CharacterBody2D
var enemies_in_range: Array[CharacterBody2D]
var attached_pikmin_arr: Array[Pikmin] = []

func take_damage(health_loss: int):
	if health > 0:
		health -= health_loss
		if health <= 0:
			state_machine.change_state("Dead")
			pass
