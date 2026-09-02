class_name CorpseMovingComponent extends Node
@export var enemy: Enemy
@export var corpse_area: CorpseArea
var destination: Vector2
var speed: float
var is_moving = false
var path: PackedVector2Array
var path_num: int = 0

func start_moving():
	var dest_waypoint = WaypointHandler.get_nearest_waypoint(enemy.global_position)
	destination = dest_waypoint.global_position
	path = WaypointHandler.get_waypoint_path(dest_waypoint, corpse_area.find_destination())
	path_num = 0
	is_moving = true

func move_to_destination():
	
	var enem_pos: Vector2 = enemy.global_position
	var targ_pos: Vector2 = destination
	
	var dir: Vector2 = enem_pos.direction_to(targ_pos)
	calculate_speed()
	enemy.velocity = speed * dir
	
	if enem_pos.distance_to(targ_pos) <= 1:
		path_num += 1
		if path.size() <= path_num:
			is_moving = false
		else:
			destination = path[path_num]
	
	enemy.move_and_slide()

func calculate_speed():
	
	pass
