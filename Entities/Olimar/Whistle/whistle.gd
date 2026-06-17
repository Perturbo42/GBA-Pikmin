class_name Whistle extends Node2D
@onready var cursor: Sprite2D = $Cursor
@onready var whistle_area_2d: WhistleArea2D = $"Whistle Area/Whistle Area2D"
@onready var whistle_area_sprite: Sprite2D = $"Whistle Area/Whistle Area Sprite"


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	global_position = get_global_mouse_position()
	
	var dir = Global.olimar.global_position.direction_to(self.global_position)
	cursor.rotation = dir.angle() - Vector2.DOWN.angle()
	
	if Input.is_action_pressed("MouseR"):
		whistle_area_sprite.visible = true
		whistle_area_2d.activate()
	elif Input.is_action_just_released("MouseR"):
		whistle_area_sprite.visible = false
		whistle_area_2d.deactivate()
	pass
