class_name BulborbReturn extends BulborbState
@export var return_home_component: Node
@export var dir_comp: DirectionComponent
func enter():
	pass

func update(_delta: float):
	pass

func physics_update(delta: float):
	return_home_component.return_home(delta)
	dir_comp.check_dir()
	pass

func exit():
	pass
