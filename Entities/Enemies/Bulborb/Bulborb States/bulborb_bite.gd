class_name BulborbBite extends BulborbState
@onready var windup: Timer = $Windup
@onready var cooldown: Timer = $Cooldown
@onready var hitbox: Area2D = $"../../Hitbox"
@export var attack_component: Node

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
	attack_component.attack()
	cooldown.start()

func get_closest_target() -> Node2D:
	var closest: Node2D = null
	var closest_dist := INF
	for body in bulborb.enemies_in_range:
		if !is_instance_valid(body):
			continue
		var d = bulborb.global_position.distance_squared_to(body.global_position)
		if d < closest_dist:
			closest = body
			closest_dist = d
	print(closest.name)
	return closest

func choose_state():
	if bulborb.enemies_in_range.is_empty():
		finished.emit(RETURN)
	else:
		bulborb.target = get_closest_target()
		finished.emit(CHASE)

func cleanup_targets():
	bulborb.enemies_in_range = bulborb.enemies_in_range.filter(is_instance_valid)
