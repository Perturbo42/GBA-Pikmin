class_name PushableArea extends Area2D
@export_group("External Properties")
@export var entity: Node2D
@export var slot: Node2D
@export var group: PikminGroup
@export var weight_display: WeightDisplay

var detectable: bool = true
var slots: Array[Marker2D] = []
var pikmin_dict: Dictionary

func _ready() -> void:
	for child in slot.get_children():
		if child is Marker2D:
			slots.append(child)

func sort_pikmin():
	clean_dict()
	var num = 0
	for pikmin in group.pikmin_arr:
		if num >= entity.weight:
			entity.start_moving()
			return
		pikmin_dict[pikmin] = slots[num]
		num += 1
	
	clean_dict()
	if num < entity.weight:
		pass
	else:
		entity.start_moving()
		pass
	
	weight_display.update(num)

func clean_dict():
	for pikmin in pikmin_dict.duplicate():
		if !is_instance_valid(pikmin) or !group.has_pikmin(pikmin):
			pikmin_dict.erase(pikmin)

func has_empty_slots():
	return group.pikmin_arr.size() < entity.weight

func has_pikmin(pikmin: Pikmin) -> bool:
	return pikmin_dict.has(pikmin)

func return_position(pikmin: Pikmin) -> Vector2:
	return pikmin_dict[pikmin].global_position
