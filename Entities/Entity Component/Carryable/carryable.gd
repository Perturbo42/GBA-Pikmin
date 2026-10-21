class_name Carryable extends Node2D
@export_group("External Properties")
@export var obj: Node2D
@export var carry_area: Area2D 
##Area that pikmin detect when trying to attach


@export_group("Internal Properties")
@export var weight: int

var max_weight: int

func activate():
	if !obj:
		return
	if carry_area:
		carry_area.can_be_detected = true
	
	max_weight = min(weight * 2, 100)
