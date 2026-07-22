class_name BulborbChase extends BulborbState

func enter():
	
	pass

func update(_delta: float):
	pass

func physics_update(_delta: float):
	if !bulborb.chase_target:
		return
	var bulb_pos: Vector2 = bulborb.global_position
	var targ_pos: Vector2 = bulborb.chase_target.global_position
	
	var dir: Vector2 = bulb_pos.direction_to(targ_pos)
	bulborb.velocity = bulborb.speed * dir
	
	if bulb_pos.distance_to(targ_pos) <= 20:
		finished.emit(BITE)
	bulborb.move_and_slide()
	pass

func exit():
	
	pass
