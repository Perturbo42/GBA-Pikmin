class_name Onion extends Node2D

@onready var interactive_area: InteractiveArea = $InteractiveArea
@export var onion_color: int 
@export var pikmin_to_handle: PackedScene
## 1: Red 2: Yellow 3: Blue
var onion_panel_open: bool
@export var pikmin_count: int


@onready var spawn_1: Marker2D = $"Pikmin Spawn Points/Spawn1"
@onready var spawn_2: Marker2D = $"Pikmin Spawn Points/Spawn2"
@onready var spawn_3: Marker2D = $"Pikmin Spawn Points/Spawn3"
var pikmin_spawn_points: Array[Marker2D]
const RAD = 10
signal menu_requested(onion)

func _ready() -> void:
	pikmin_spawn_points = [spawn_1, spawn_2, spawn_3]
	
	onion_panel_open = false
	interactive_area.interacted.connect(onion_panel)

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
		spawn_pikmin(-num)

func spawn_pikmin(num: int):
	var p : int = 0
	while num > 0:
		var mark: Marker2D = pikmin_spawn_points[p]
		var pos = random_position_around(mark.global_position, RAD)
		SpawnHandler.spawn_pikmin(pikmin_to_handle, pos)
		num -= 1
		p = (p+1) % 3

func spawn_sprouts(num: int):
	while num > 0:
		var pos = get_random_point_in_oval(interactive_area.global_position, 35, 11)
		SpawnHandler.spawn_sprout(pos, onion_color)
		num -= 1
	

func random_position_around(point: Vector2, radius: float) -> Vector2:
	return point + Vector2.from_angle(randf() * TAU) * sqrt(randf()) * radius

func get_random_point_in_oval(center: Vector2, radius_x: float, radius_y: float) -> Vector2:
	# Pick a random angle in radians (0 to 2*PI)
	var angle = randf() * TAU
	
	# Use sqrt() for uniform area distribution (avoids center clustering)
	var distance = 1.0
	
	# Calculate the offset and scale by the oval's X and Y radii
	var offset = Vector2(
		cos(angle) * distance * radius_x,
		sin(angle) * distance * radius_y
	)
	
	return center + offset
