class_name PikminFollow extends PikminState
@export var velocity_comp: PikminVelocityComponent

func enter():
	pikmin.assign_gather_offset()
	pass

func update(_delta: float):
	pass

func physics_update(delta: float):
	var target = Global.olimar.marker_gather.global_position + pikmin.gather_offset
	
	velocity_comp.move_to_target(delta, target, 5)
	pass

func exit():
	pass
