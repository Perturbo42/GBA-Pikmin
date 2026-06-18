class_name PikminFollow extends PikminState

func enter():
	pass

func update(_delta: float):
	pass

func physics_update(_delta: float):
	var target = Global.olimar.marker_gather.global_position
	
	if pikmin.global_position.distance_to(target) > 5:
		var dir = pikmin.global_position.direction_to(target)
		pikmin.velocity = dir * pikmin.speed
	else:
		pikmin.velocity = Vector2.ZERO
	
	pikmin.move_and_slide()
	pass

func exit():
	pass
