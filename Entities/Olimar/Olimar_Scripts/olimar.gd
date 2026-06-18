class_name Olimar extends CharacterBody2D
@onready var marker: Marker2D = $"Pikmin Gather"

@export var state_machine: StateMachine
@export var speed: float
var dir: Vector2
var pikmin_types = [
	RedPikmin,
	YellowPikmin,
	BluePikmin
]
var curr_type_index: int = 0
var curr_type = pikmin_types[curr_type_index]
var following_pikmin := {
	RedPikmin: [],
	YellowPikmin: [],
	BluePikmin: []
}

func _ready() -> void:
	Global.olimar = self
	dir = Vector2.DOWN

func _process(_delta: float) -> void:
	marker.position = Vector2.ZERO - dir * 25
	
	if !following_pikmin[curr_type].is_empty():
		if Input.is_action_just_pressed("MouseUp"):
			next_type()
			while following_pikmin[curr_type].is_empty():
				next_type()
		elif Input.is_action_just_pressed("MouseDown"):
			prev_type()
			while following_pikmin[curr_type].is_empty():
				prev_type()

func next_type():
	curr_type_index = (curr_type_index + 1) % pikmin_types.size()
	curr_type = pikmin_types[curr_type_index]
	print(curr_type)

func prev_type():
	curr_type_index = (curr_type_index - 1 + pikmin_types.size()) % pikmin_types.size()
	curr_type = pikmin_types[curr_type_index]
