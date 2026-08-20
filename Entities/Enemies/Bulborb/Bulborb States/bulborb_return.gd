class_name BulborbReturn extends BulborbState
@export var return_home_component: Node

func enter():
	pass

func update(_delta: float):
	pass

func physics_update(_delta: float):
	return_home_component.return_home()
	pass

func exit():
	pass
