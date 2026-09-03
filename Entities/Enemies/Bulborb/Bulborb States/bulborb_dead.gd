class_name BulborbDead extends BulborbState
@export var corpse_comp: CorpseComponent
@export var corpse_moving_comp: CarryableMoving


func enter():
	bulborb.velocity = Vector2.ZERO
	corpse_comp.activate()
	pass

func update(_delta: float):
	pass

func physics_update(_delta: float):
	if corpse_moving_comp.is_moving:
		corpse_moving_comp.move_to_destination()
	pass

func exit():
	pass
