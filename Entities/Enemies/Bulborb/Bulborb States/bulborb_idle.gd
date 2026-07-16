class_name BulborbIdle extends BulborbState

func enter():
	bulborb.velocity = Vector2.ZERO
	bulborb.chase_target = null
	pass

func update(_delta: float):
	pass

func physics_update(_delta: float):
	pass

func exit():
	pass
