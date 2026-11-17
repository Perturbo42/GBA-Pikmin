class_name PikminSprout extends Node2D
@onready var sprite: Sprite2D = $Sprite2D

var color: int = 0
var state: int = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	sprite.frame_coords = Vector2i(color, state)
	pass # Replace with function body.
