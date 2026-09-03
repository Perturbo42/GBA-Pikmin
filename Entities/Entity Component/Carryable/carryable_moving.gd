class_name CarryableMoving extends Node2D
@export var obj: Node2D
@export var carry_area: Area2D
var destination: Vector2
var speed: float = 0.0
var is_moving = false
var path: PackedVector2Array
var path_num: int = 0

func start_moving():
	var dest_waypoint = WaypointHandler.get_nearest_waypoint(obj.global_position)
	destination = dest_waypoint.global_position
	path = WaypointHandler.get_waypoint_path(dest_waypoint, carry_area.find_destination())
	path_num = 0
	speed = carry_area.calculate_speed() * 100
	is_moving = true

func move_to_destination():
	if !is_moving:
		obj.velocity = Vector2.ZERO
		return
	
	var obj_pos: Vector2 = obj.global_position
	var targ_pos: Vector2 = destination
	
	var dir: Vector2 = obj_pos.direction_to(targ_pos)
	obj.velocity = speed * dir
	
	if obj_pos.distance_squared_to(targ_pos) <= 3:
		path_num += 1
		if path.size() <= path_num:
			is_moving = false
		else:
			destination = path[path_num]
	obj.move_and_slide()

func stop_moving():
	is_moving = false
	speed = 0.0
	
