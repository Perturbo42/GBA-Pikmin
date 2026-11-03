class_name PushableArea extends Area2D
@export_group("External Properties")
@export var entity: Node2D
@export var group: PikminGroup


func has_empty_slots():
	return group.pikmin_arr.size() < entity.weight
