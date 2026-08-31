extends Node

var waypoint_list: Array[Waypoint] = []
var astar := AStar2D.new()
var current_level: BaseLevel = null

func register_level(level: BaseLevel):
	disconnect_current_level()
	current_level = level
	register_waypoints(current_level)
	build_astar()

func register_waypoints(level: Node) -> void:
	var waypoints := level.find_child("Waypoints", false, true)
	
	for point in waypoints.get_children():
		if point is Waypoint:
			waypoint_list.append(point)

func disconnect_current_level() -> void:
	waypoint_list.clear()
	astar.clear()
	current_level = null

func get_nearest_waypoint(position: Vector2) -> Waypoint:
	var closest: Waypoint = null
	var closest_distance := INF
	
	for waypoint in waypoint_list:
		var distance := position.distance_squared_to(waypoint.global_position)
		
		if distance < closest_distance:
			closest_distance = distance
			closest = waypoint
	
	return closest

func build_astar() -> void:
	astar.clear()
	
	for i in waypoint_list.size():
		var waypoint = waypoint_list[i]
		astar.add_point(i, waypoint.global_position)
	
	for i in waypoint_list.size():
		var waypoint = waypoint_list[i]
		for connection in waypoint.connections:
			var connection_id = waypoint_list.find(connection)
			if connection_id != -1:
				astar.connect_points(i, connection_id, false)

func get_waypoint_path(start: Waypoint, destination: Waypoint) -> PackedVector2Array:
	var start_id = waypoint_list.find(start)
	var destination_id = waypoint_list.find(destination)
	
	if start_id == -1 or destination_id == -1:
		return PackedVector2Array()
		
	return astar.get_point_path(start_id, destination_id)
