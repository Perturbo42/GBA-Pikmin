class_name BulborbBite extends BulborbState
@export var closest_target: Node

@onready var windup: Timer = $Windup
@onready var cooldown: Timer = $Cooldown
@onready var hitbox: Area2D = %"Enemy Hitbox"


func _ready() -> void:
	super._ready()
	windup.timeout.connect(bite)
	cooldown.timeout.connect(choose_state)

func enter():
	windup.start()
	bulborb.velocity = Vector2.ZERO
	pass

func update(_delta: float):
	pass

func physics_update(_delta: float):
	pass

func exit():
	windup.stop()
	cooldown.stop()
	pass

func bite():
	cleanup_targets()
	hitbox.attack()
	cooldown.start()


func choose_state():
	if bulborb.enemies_in_range.is_empty():
		finished.emit(RETURN)
	else:
		bulborb.target = closest_target.get_closest_target()
		finished.emit(CHASE)

func cleanup_targets():
	bulborb.enemies_in_range = bulborb.enemies_in_range.filter(is_instance_valid)
