class_name ShakeComponent extends Node

@export_group("External Properties")
@export var enemy: Enemy
@export var group: PikminGroup

@export_group("Internal Categories")
@export var force: float

func shake():
	for pikmin in group.pikmin_arr.duplicate():
		##code for knockback
		var dir = enemy.global_position.direction_to(pikmin.global_position)
		pikmin.apply_knockback(dir, force, enemy)
