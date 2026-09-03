class_name Carryable extends Node2D
@export_category("External Properties")
@export var obj: Node2D
@export var carry_area: Area2D 
##Area that pikmin detect when trying to attach
@export var attached_group: PikminGroup

@export_category("Internal Properties")
@export var weight: int

var max_weight: int

func activate():
	if !obj:
		return
	
	if carry_area:
		carry_area.can_be_detected = true
	if attached_group:
		PikminRegistry.remove_all_from_group(attached_group)
	
	max_weight = min(weight * 2, 100)
