class_name BulborbBite extends BulborbState
@onready var windup: Timer = $Windup
@onready var cooldown: Timer = $Cooldown

@onready var hitbox: Area2D = $"../../Hitbox"
var knockback_strength: float

func _ready() -> void:
	super._ready()
	windup.timeout.connect(attack)
	cooldown.timeout.connect(choose_state)
	knockback_strength = 400

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
	
	for area in hitbox.get_overlapping_areas():
		var body = area.owner
		if body == bulborb.chase_target:
			if body is Pikmin:
				body.take_damage()
				print("Pikmin eaten")
			elif body is Olimar:
				var direction = bulborb.global_position.direction_to(body.global_position)
				var explosion_force = direction * knockback_strength
				body.knockback = explosion_force
				print("Olimar take damage")
				body.take_damage(bulborb.damage)
			cleanup_targets()
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
	print(closest.name)
	return closest

func choose_state():
	if bulborb.enemies_in_range.is_empty():
		finished.emit(RETURN)
	else:
		bulborb.chase_target = get_closest_target()
		finished.emit(CHASE)

func cleanup_targets():
	bulborb.enemies_in_range = bulborb.enemies_in_range.filter(is_instance_valid)
