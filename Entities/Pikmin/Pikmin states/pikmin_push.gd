class_name PikminPush extends PikminState
@export var pushing_component: PushingComponent

func enter():
	pikmin.velocity = Vector2.ZERO
	pushing_component.attach_to_current_thing()
	if !pushing_component.is_attached_to_thing():
		finished.emit(IDLE)
	pass

func update(_delta: float):
	pass

func physics_update(_delta: float):
	if pushing_component.is_attached_to_thing():
		pikmin.global_position = pushing_component.pikmin_position()
	else:
		finished.emit(IDLE)
	pass

func exit():
	pushing_component.detach_from_current_thing()
	pass
