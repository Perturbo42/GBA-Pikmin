class_name PikminHurtbox extends Area2D
@export_category("External Properties")
@export var pikmin: Pikmin



func take_damage():
	if !pikmin.alive:
		return
	## check if pikmin type is immune to said damage
	pikmin.state_machine.change_state("Dead")
