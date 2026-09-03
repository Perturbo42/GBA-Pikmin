class_name CarryArea extends Area2D
@export var carry: Carryable
@export var moving_comp: CarryableMoving
@export var group: PikminGroup
@export var slots1: Node2D
@export var slots2: Node2D
var can_be_detected: bool = false
var slots: Array[Marker2D] = []
var pikmin_dict: Dictionary

func _ready() -> void:
	for child in slots1.get_children():
		if child is Marker2D:
			slots.append(child)
	
	for child in slots2.get_children():
		if child is Marker2D:
			slots.append(child)

func sort_pikmin():
	var num = 0
	for pikmin in group.pikmin_arr:
		if num >= carry.max_weight:
			moving_comp.start_moving()
			return
		pikmin_dict[pikmin] = slots[num]
		num += 1
	
	if num < carry.max_weight:
		moving_comp.stop_moving()
	else:
		moving_comp.start_moving()

func find_destination() -> Waypoint:
	return WaypointHandler.ship

func calculate_speed() -> float:
	var sum: float = 0.0
	for pikmin in pikmin_dict:
		sum += pikmin.pikmin_carry_speed()
	var velocity = (sum - carry.weight + 1) / carry.max_weight + 1
	return velocity

func has_empty_slots() -> bool:
	return group.pikmin_arr.size() < carry.max_weight

func has_pikmin(pikmin: Pikmin) -> bool:
	return pikmin_dict.has(pikmin)

func return_position(pikmin: Pikmin) -> Vector2:
	return pikmin_dict[pikmin].global_position
