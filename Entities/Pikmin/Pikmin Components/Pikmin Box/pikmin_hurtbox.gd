class_name PikminHurtbox extends Area2D
@export_category("External Properties")
@export var pikmin: Pikmin
@export var alive_sprite: Sprite2D
@export var dead_sprite: Sprite2D
@export var whistle_detect: Area2D


func take_damage():
	if !pikmin.alive:
		return
	## check if pikmin type is immune to said damage
	die()

func die():
	## play death animation
	pikmin.alive = false
	whistle_detect.can_be_detected = false
	alive_sprite.visible = false
	dead_sprite.visible = true
	## remove self from lists
	pikmin.pikmin_dead.emit(pikmin)
