class_name Enemy extends CharacterBody2D
@onready var detection_area: Area2D = $DetectionArea
@export var health: int 
@export var speed: float
@export var damage: int
@export var home_location: Vector2
@export var state_machine: StateMachine
var attached_pikmin_arr: Array[Pikmin]

func take_damage(health_loss: int):
	if health > 0:
		health -= health_loss
		if health <= 0:
			##dies 
			pass
