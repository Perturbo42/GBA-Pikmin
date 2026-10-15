class_name DropComponent extends Node
@export_group("External Properties")
@export var group: PikminGroup
@export var drop_target: Marker2D

@export_group("Internal Properties")
@export var drop_range: float

func drop():
	for pikmin in group.pikmin_arr.duplicate():
		var x_pos = randf_range(-drop_range, drop_range)
		var y_pos = randf_range(-drop_range, drop_range)
		var drop_pos := drop_target.global_position + Vector2(x_pos, y_pos)
		pikmin.drop(drop_pos)
