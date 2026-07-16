class_name BulborbChase extends BulborbState

func enter():
	
	pass

func update(_delta: float):
	pass

func physics_update(_delta: float):
	if bulborb.chase_target != null:
		var dir = bulborb.global_position.direction_to(bulborb.chase_target.global_position)
		bulborb.velocity = bulborb.speed * dir
	
	bulborb.move_and_slide()
	pass

func exit():
	
	pass
