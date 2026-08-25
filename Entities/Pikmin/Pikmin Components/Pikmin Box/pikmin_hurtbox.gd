class_name PikminHurtbox extends Area2D
@export_category("External Properties")
@export var pikmin: Pikmin

func take_damage():
	## check if pikmin type is immune to said damage
	die()

func die():
	## play death animation
	## remove self from lists
	pikmin.pikmin_dead.emit(pikmin)
