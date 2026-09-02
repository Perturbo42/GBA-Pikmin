class_name CorpseArea extends Area2D
@export var enemy: Enemy
@export var corpse_component: CorpseComponent
@export var corpse_moving_comp: CorpseMovingComponent
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
		if num >= corpse_component.max_weight:
			corpse_moving_comp.start_moving()
			return
		pikmin_dict[pikmin] = slots[num]
		num += 1
	
	if num < corpse_component.max_weight:
		corpse_moving_comp.stop_moving()
	else:
		corpse_moving_comp.start_moving()

func find_destination() -> Waypoint:
	var red_count: int = 0
	var yellow_count: int = 0
	var blue_count: int = 0
	for pikmin in pikmin_dict:
		if pikmin is RedPikmin:
			red_count += 1
		elif pikmin is YellowPikmin:
			yellow_count += 1
		elif pikmin is BluePikmin:
			blue_count += 1
	
	var max_count = max(red_count, yellow_count, blue_count)
	
	if red_count == max_count:
		return WaypointHandler.red_onion
	elif yellow_count == max_count:
		return WaypointHandler.yellow_onion
	elif blue_count == max_count:
		return WaypointHandler.blue_onion
	else:
		return WaypointHandler.ship

func calculate_speed() -> float:
	var sum: float = 0.0
	for pikmin in pikmin_dict:
		sum += pikmin.pikmin_carry_speed()
	var velocity = (sum - corpse_component.weight + 1) / corpse_component.max_weight + 1
	return velocity

func has_empty_slots() -> bool:
	return group.pikmin_arr.size() < corpse_component.max_weight

func has_pikmin(pikmin: Pikmin) -> bool:
	return pikmin_dict.has(pikmin)

func return_position(pikmin: Pikmin) -> Vector2:
	return pikmin_dict[pikmin].global_position
