class_name CorpseArea extends Area2D
@export var enemy: Enemy
@export var corpse_component: CorpseComponent
@export var group: PikminGroup
@export var slots1: Node2D
@export var slots2: Node2D
var can_be_detected: bool = false
var slots: Array[Marker2D] = []
var num_of_slots_filled : int = 0
var pikmin_dict: Dictionary

func _ready() -> void:
	for child in slots1.get_children():
		if child is Marker2D:
			slots.append(child)
	
	for child in slots2.get_children():
		if child is Marker2D:
			slots.append(child)
	
	num_of_slots_filled = 0


func sort_pikmin():
	var num = 0
	for pikmin in group.pikmin_arr:
		if num >= corpse_component.max_weight:
			return
		pikmin_dict[pikmin] = slots[num]
		num += 1
	num_of_slots_filled = num

func has_empty_slots() -> bool:
	return group.pikmin_arr.size() < corpse_component.max_weight

func has_pikmin(pikmin: Pikmin) -> bool:
	return pikmin_dict.has(pikmin)


func return_position(pikmin: Pikmin) -> Vector2:
	return pikmin_dict[pikmin].global_position
