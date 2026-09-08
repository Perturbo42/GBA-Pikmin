class_name ShakeComponent extends Node

@export_category("External Properties")
@export var attached_state: State
@export var enemy: Enemy
@export var group: PikminGroup

func shake():
	for pikmin in group.pikmin_arr:
		##code for knockback
		pass
	pass
