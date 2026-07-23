class_name Enemy extends CharacterBody2D
@onready var detection_area: Area2D = $DetectionArea
@export var health: int 
@export var speed: float
@export var damage: int
@export var home_location: Vector2
@export var state_machine: StateMachine
