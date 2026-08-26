class_name BulborbDead extends BulborbState
@export var corpse_comp: CorpseComponent
@export var carrying_group: PikminGroup

func enter():
	bulborb.velocity = Vector2.ZERO
	corpse_comp.activate()
	pass

func update(_delta: float):
	pass

func physics_update(_delta: float):
	pass

func exit():
	pass
