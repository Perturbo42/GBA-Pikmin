class_name ShakeComponent extends Node

@export_category("External Properties")
@export var attached_state: State
@export var enemy: Enemy
@export var group: PikminGroup

@export_category("Internal Categories")
@export var force: float

func shake():
	for pikmin in group.pikmin_arr.duplicate():
		##code for knockback
		var dir = enemy.global_position.direction_to(pikmin.global_position)
		pikmin.apply_knockback(dir, force)
