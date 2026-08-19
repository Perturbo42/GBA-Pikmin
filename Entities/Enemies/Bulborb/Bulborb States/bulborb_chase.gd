class_name BulborbChase extends BulborbState
@onready var sprite: Sprite2D = $"../../Sprite2D"
@export var chase_component: Node

func enter():
	
	pass

func update(_delta: float):
	pass

func physics_update(_delta: float):
	chase_component.chasing()
	pass

func exit():
	
	pass
