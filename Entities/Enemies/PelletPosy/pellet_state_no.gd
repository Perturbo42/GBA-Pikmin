class_name PelletStateNo extends PelletState
@export var corpse_comp: CorpseComponent
@export var drop_comp: DropComponent

func enter():
	drop_comp.drop()
	corpse_comp.activate()
	pass

func update(_delta: float):
	pass

func physics_update(_delta: float):
	pass

func exit():
	pass
