class_name PikminCarry extends PikminState
@export var carrying_component: CarryingComponent

func enter():
	carrying_component.attach_to_current_thing()
	pass

func update(_delta: float):
	pass

func physics_update(_delta: float):
	pikmin.global_position = carrying_component.pikmin_position()
	pass

func exit():
	carrying_component.detach_from_current_thing()
	pass
