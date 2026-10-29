class_name PikminDead extends PikminState
@export var alive_sprite: Sprite2D
@export var dead_sprite: Sprite2D
@export var whistle_detect: Area2D

func enter():
	pikmin.velocity = Vector2.ZERO
	pikmin.alive = false
	whistle_detect.can_be_detected = false
	alive_sprite.visible = false
	dead_sprite.visible = true
	pikmin.pikmin_dead.emit(pikmin)
	pass

func update(_delta: float):
	pass

func physics_update(_delta: float):
	pass

func exit():
	pass
