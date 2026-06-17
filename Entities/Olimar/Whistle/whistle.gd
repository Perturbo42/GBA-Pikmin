class_name Whistle extends Node2D
@onready var cursor: Sprite2D = $Cursor

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	global_position = get_global_mouse_position()
	
	var dir = Global.olimar.global_position.direction_to(self.global_position)
	cursor.rotation = dir.angle() - Vector2.DOWN.angle()
	pass
