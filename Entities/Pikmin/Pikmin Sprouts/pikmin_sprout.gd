class_name PikminSprout extends Node2D
@onready var sprite: Sprite2D = $Sprite2D
var pikmin_to_handle: PackedScene
var color: int = 0
var state: int = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	sprite.frame_coords = Vector2i(color, state)
	pass # Replace with function body.


func _on_interactive_area_interacted() -> void:
	SpawnHandler.spawn_pikmin(pikmin_to_handle, global_position)
	queue_free()
	pass # Replace with function body.
