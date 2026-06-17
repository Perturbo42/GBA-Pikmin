class_name Pikmin extends CharacterBody2D
@export var state_machine: StateMachine
@export var speed : float

enum PikminType{
	RED,
	YELLOW,
	BLUE
}

var pikmin_type: PikminType
