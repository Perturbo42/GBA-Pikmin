class_name BulborbChase extends BulborbState
@onready var sprite: Sprite2D = $"../../Sprite2D"
@onready var timer: Timer = $"Find New Chase Target"

@export var chase_component: Node
@export var closest_target: Node

func _ready() -> void:
	super._ready()
	timer.timeout.connect(find_new_target)

func enter():
	timer.start()
	pass

func update(_delta: float):
	pass

func physics_update(_delta: float):
	chase_component.chasing()
	pass

func exit():
	timer.stop()
	pass

func find_new_target():
	bulborb.target = closest_target.get_closest_target()
	pass
