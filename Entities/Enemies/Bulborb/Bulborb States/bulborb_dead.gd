class_name BulborbDead extends BulborbState
@export var corpse_comp: CorpseComponent
@export var corpse_moving_comp: CorpseMovingComponent
@export var carrying_group: PikminGroup
var is_being_carried: bool = false

func enter():
	bulborb.velocity = Vector2.ZERO
	is_being_carried = false
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
