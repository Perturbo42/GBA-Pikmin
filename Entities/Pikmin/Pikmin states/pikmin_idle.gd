class_name PikminIdle extends PikminState
@export var corpse_detection: CorpseDetection

func enter():
	pikmin.velocity = Vector2.ZERO
	pass

func update(_delta: float):
	corpse_detection.check_for_corpses()
	pass

func physics_update(_delta: float):
	pass

func exit():
	pass
