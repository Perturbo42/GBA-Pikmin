class_name BulborbBite extends BulborbState
@onready var windup: Timer = $Windup
@onready var cooldown: Timer = $Cooldown

@onready var bite_area: Area2D = $"../../BiteArea"
var knockback_strength: float

func _ready() -> void:
	super._ready()
	windup.timeout.connect(attack)
	cooldown.timeout.connect(choose_state)
	knockback_strength = 200

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

func attack():
	if !is_instance_valid(bulborb.chase_target):
		finished.emit(RETURN)
		return
	cleanup_targets()
	for body in bite_area.get_overlapping_bodies():
		if body == bulborb.chase_target:
			if body is Pikmin:
				body.take_damage()
			elif body is Olimar:
				var direction = bulborb.global_position.direction_to(body.global_position)
				var explosion_force = direction * knockback_strength
				body.knockback = explosion_force
				body.take_damage(bulborb.damage)
	
	if !bulborb.enemies_in_range.is_empty():
		bulborb.chase_target = get_closest_target()
	else:
		finished.emit(RETURN)
		return
	
	cooldown.start()
	pass

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
	return closest

func choose_state():
	if bulborb.enemies_in_range.is_empty():
		finished.emit(RETURN)
	else:
		finished.emit(CHASE)

func cleanup_targets():
	bulborb.enemies_in_range = bulborb.enemies_in_range.filter(is_instance_valid)
