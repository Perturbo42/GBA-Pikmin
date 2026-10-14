class_name PelletStateNo extends PelletState
@export var corpse_comp: CorpseComponent

func enter():
	corpse_comp.activate()
	pass

func update(_delta: float):
	pass

func physics_update(_delta: float):
	pass

func exit():
	pass
