class_name BulborbChase extends BulborbState
@onready var sprite: Sprite2D = $"../../Sprite2D"
@onready var chase_component: ChaseComponent = $"Chase Component"

func enter():
	
	pass

func update(_delta: float):
	pass

func physics_update(_delta: float):
	chase_component.chasing()
	pass

func exit():
	
	pass
