class_name BulborbReturn extends BulborbState
@export var close_to_home: int = 40

func enter():
	pass

func update(_delta: float):
	pass

func physics_update(_delta: float):
	var dist_to_home: float = bulborb.global_position.distance_to(bulborb.home_location)
	if dist_to_home <= close_to_home:
		finished.emit(IDLE)
	else:
		var dir = bulborb.global_position.direction_to(bulborb.home_location)
		bulborb.velocity = dir * bulborb.speed
	
	bulborb.move_and_slide()
	pass

func exit():
	pass
