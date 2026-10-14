class_name PelletPosy extends Enemy
@onready var alive_sprite: Sprite2D = $AliveSprite
var color : int

func ready_self() -> void:
	if color:
		alive_sprite.frame = color
