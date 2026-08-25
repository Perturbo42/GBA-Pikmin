class_name Olimar extends CharacterBody2D

@onready var marker_gather: Marker2D = $"Pikmin Gather"
@onready var marker_throw: Marker2D = $"Pikmin Throw"

@onready var whistle: Whistle = $Whistle

@export_category("External Properties")
@export var state_machine: StateMachine
@export_group("Following Pikmin")
@export var red: PikminGroup
@export var yellow: PikminGroup
@export var blue: PikminGroup

@export_category("Stats")
@export var speed: float

var dir: Vector2
var knockback: Vector2
var pikmin_types = [
	RedPikmin,
	YellowPikmin,
	BluePikmin
]
var curr_type_index: int = 0
var curr_type = pikmin_types[curr_type_index]
var following_pikmin : Dictionary

func _ready() -> void:
	Global.olimar = self
	dir = Vector2.DOWN
	following_pikmin = {
		RedPikmin: red,
		YellowPikmin: yellow,
		BluePikmin: blue
	}

func _input(event: InputEvent) -> void:
	if not following_pikmin[curr_type].pikmin_arr.is_empty():
		if event.is_action_pressed("MouseUp"):
			next_type()
			while following_pikmin[curr_type].pikmin_arr.is_empty():
				next_type()
		elif event.is_action_pressed("MouseDown"):
			prev_type()
			while following_pikmin[curr_type].pikmin_arr.is_empty():
				prev_type()
	if event.is_action_pressed("MouseR"):
		whistle.activate()
	elif event.is_action_released("MouseR"):
		whistle.deactivate()
	elif event.is_action_pressed("MouseL"):
		throw()

func _process(_delta: float) -> void:
	marker_gather.position = Vector2.ZERO - dir * 25


func throw():
	if following_pikmin[curr_type].pikmin_arr.is_empty():
		#error noise plays
		return
	
	var pikmin_to_throw = null
	for pikmin in following_pikmin[curr_type].pikmin_arr:
		if global_position.distance_to(pikmin.global_position) < 75:
			pikmin_to_throw = pikmin
			PikminRegistry.remove_pikmin_from_group(pikmin_to_throw, following_pikmin[curr_type])
			break
	if pikmin_to_throw == null:
		return
	
	pikmin_to_throw.global_position = marker_throw.global_position
	pikmin_to_throw.target_throw = whistle.global_position
	pikmin_to_throw.state_machine.change_state("Thrown")

func next_type():
	curr_type_index = (curr_type_index + 1) % pikmin_types.size()
	curr_type = pikmin_types[curr_type_index]
	print(curr_type)

func prev_type():
	curr_type_index = (curr_type_index - 1 + pikmin_types.size()) % pikmin_types.size()
	curr_type = pikmin_types[curr_type_index]

func remove_pikmin_from_following(num: int, color: int):
	if num <= 0:
		return 0

	var type = pikmin_types[color - 1]
	var pikmin_group: PikminGroup = following_pikmin[type]

	var remove_count: int = min(num, pikmin_group.pikmin_arr.size())

	for i in remove_count:
		var pikmin = pikmin_group.pikmin_arr.front()
		if is_instance_valid(pikmin):
			PikminRegistry.remove_pikmin_from_group(pikmin, pikmin_group)
			pikmin.pikmin_dead.emit(pikmin)
