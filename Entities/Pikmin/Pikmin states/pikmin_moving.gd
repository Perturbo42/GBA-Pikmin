class_name PikminMoving extends PikminState
@export var targetting_component: TargettingComponent
@export var velocity_component: PikminVelocityComponent
var target: Vector2 

func enter():
	target = targetting_component.target_location
	pass

func update(_delta: float):
	pass

func physics_update(delta: float):
	velocity_component.move_to_target(delta, target, 5)
	
	if !velocity_component.check_dist_to_target(target, 5):
		finished.emit(targetting_component.get_next_state())
	pass

func exit():
	pass
