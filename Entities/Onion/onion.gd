class_name Onion extends Node2D

@onready var area: InteractiveArea = $Area2D
@export var onion_color: int 
@export var pikmin_to_handle: PackedScene
## 1: Red 2: Yellow 3: Blue
var onion_panel_open: bool
var pikmin_count: int


@onready var spawn_1: Marker2D = $"Pikmin Spawn Points/Spawn1"
@onready var spawn_2: Marker2D = $"Pikmin Spawn Points/Spawn2"
@onready var spawn_3: Marker2D = $"Pikmin Spawn Points/Spawn3"
var pikmin_spawn_points: Array[Marker2D]

signal menu_requested(onion)

func _ready() -> void:
	pikmin_spawn_points = [spawn_1, spawn_2, spawn_3]
	
	onion_panel_open = false
	area.interacted.connect(onion_panel)

func onion_panel():
	if onion_panel_open == false:
		onion_panel_open = true
		menu_requested.emit(self)
		pass
	
	else: ## onion_panel_open == true
		onion_panel_open = false
		pass
	

func change_pikmin_count(num: int):
	pikmin_count += num
	
	if num < 0:
		var p : int = 0
		while num < 0:
			var mark: Marker2D = pikmin_spawn_points[p]
			SpawnHandler.spawn_pikmin(pikmin_to_handle, mark.global_position)
			num += 1
			p = (p+1) % 3
			
