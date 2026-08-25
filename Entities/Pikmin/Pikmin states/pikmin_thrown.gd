class_name PikminThrown extends PikminState
@onready var hitbox: Area2D = %"Pikmin Hitbox"
@onready var collider_box: CollisionShape2D = %"Collider Box"
@onready var hurtbox: Area2D = %PikminHurtbox
@onready var whistle_detection: Area2D = %WhistleDetection


var throw_duration := 0.6
var arc_height := 48.0

var elapsed := 0.0

var start_pos: Vector2
var end_pos: Vector2

func enter():
	elapsed = 0.0

	start_pos = pikmin.global_position
	end_pos = pikmin.target_throw

	var distance = start_pos.distance_to(end_pos)
	arc_height = clamp(distance * 0.3, 24.0, 96.0)
	
	collider_box.set_deferred("disabled", true)
	hitbox.monitoring = true
	hurtbox.monitoring = false
	whistle_detection.monitorable = false

func update(delta: float):
	elapsed += delta

	var t = min(elapsed / throw_duration, 1.0)

	pikmin.global_position = start_pos.lerp(end_pos, t)

	var z = 4.0 * arc_height * t * (1.0 - t)
	pikmin.sprite.position.y = pikmin.sprite_default_position.y - z
	hitbox.position.y = pikmin.sprite.position.y

	if t >= 1.0:
		pikmin.global_position = end_pos
		pikmin.sprite.position.y = pikmin.sprite_default_position.y
		hitbox.position.y = pikmin.sprite.position.y
		finished.emit(IDLE)

func physics_update(_delta: float):
	pass

func exit():
	collider_box.set_deferred("disabled", false)
	hitbox.set_deferred("monitoring", false)
	hurtbox.set_deferred("monitoring", true)
	whistle_detection.set_deferred("monitorable", true)
