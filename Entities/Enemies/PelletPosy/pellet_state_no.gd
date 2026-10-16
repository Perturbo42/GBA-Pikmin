class_name PelletStateNo extends PelletState
@export var corpse_comp: CorpseComponent
@export var drop_comp: DropComponent
@export var pellet: PackedScene

func enter():
	drop_comp.drop()
	corpse_comp.activate()
	var child = SpawnHandler.spawn(pellet, drop_comp.drop_target.global_position)
	child.color = pelletPosy.color
	child.ready_self()
	pass

func update(_delta: float):
	pass

func physics_update(_delta: float):
	pass

func exit():
	pass
