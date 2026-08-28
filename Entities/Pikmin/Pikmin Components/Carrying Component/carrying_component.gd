class_name CarryingComponent extends Node
enum Thing{CORPSE, TREASURE}
@export var pikmin: Pikmin
var current_thing: Thing
var current_area: Area2D

func attach_to_current_thing():
	PikminRegistry.add_pikmin_to_group(pikmin, current_area.group)
	current_area.sort_pikmin()

func detach_from_current_thing():
	PikminRegistry.remove_pikmin_from_group(pikmin, current_area.group)
	current_area.sort_pikmin()

func pikmin_position() -> Vector2:
	return current_area.return_position(pikmin)
