class_name CarryArea extends Area2D
enum Onion_Color{Red, Yellow, Blue, None}
@onready var slots1: Node2D = $PikminSlots1
@onready var slots2: Node2D = $PikminSlots2

@export var obj: Node2D
@export var carry: Carryable
@export var moving_comp: CarryableMoving
@export var weight_display: WeightDisplay
@export var group: PikminGroup

var can_be_detected: bool = false
var slots: Array[Marker2D] = []
var pikmin_dict: Dictionary
var destination: Onion_Color

func _ready() -> void:
	for child in slots1.get_children():
		if child is Marker2D:
			slots.append(child)
	
	for child in slots2.get_children():
		if child is Marker2D:
			slots.append(child)

func sort_pikmin():
	clean_dict()
	var num = 0
	for pikmin in group.pikmin_arr:
		## print("SORT:", pikmin)
		if num >= carry.max_weight:
			moving_comp.start_moving()
			return
		pikmin_dict[pikmin] = slots[num]
		num += 1
	
	clean_dict()
	if num < carry.weight:
		moving_comp.stop_moving()
	else:
		moving_comp.start_moving()
	
	weight_display.update(num)

func find_destination() -> Waypoint:
	destination = Onion_Color.None
	return WaypointHandler.ship

func calculate_speed() -> float:
	clean_dict()
	var sum: float = 0.0
	for pikmin in pikmin_dict:
		sum += pikmin.pikmin_carry_speed()
	var velocity = (sum - carry.weight + 1) / carry.max_weight + 1
	return velocity

func clean_dict():
	for pikmin in pikmin_dict.duplicate():
		if !is_instance_valid(pikmin):
			pikmin_dict.erase(pikmin)

func has_empty_slots() -> bool:
	return group.pikmin_arr.size() < carry.max_weight

func has_pikmin(pikmin: Pikmin) -> bool:
	return pikmin_dict.has(pikmin)

func return_position(pikmin: Pikmin) -> Vector2:
	return pikmin_dict[pikmin].global_position

func destroy_self():
	PikminRegistry.remove_all_from_group(group)
	obj.free_self()
