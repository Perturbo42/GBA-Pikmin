class_name EnemyClosestTargetComponent extends Node
@export_group("External Properties")
@export var enemy: Enemy

func get_closest_target() -> Node2D:
	var closest: Node2D = null
	var closest_dist := INF
	for body in enemy.enemies_in_range:
		if !is_instance_valid(body):
			continue
		var d = enemy.global_position.distance_squared_to(body.global_position)
		if d < closest_dist:
			closest = body
			closest_dist = d
	print(closest.name)
	return closest
