class_name PelletPosy extends Enemy
@onready var alive_sprite: Sprite2D = $AliveSprite
@onready var dead_sprite: Sprite2D = $DeadSprite
var color : int
var dir: int

func ready_self() -> void:
	if color:
		alive_sprite.frame = color
	if dir:
		alive_sprite.scale.x *= dir
		dead_sprite.scale.x *= dir
