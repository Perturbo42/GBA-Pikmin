class_name PikminThrown extends PikminState
@onready var hitbox: Area2D = $"../../Hitbox"


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
	
	hitbox.monitoring = true

func update(delta: float):
	elapsed += delta

	var t = min(elapsed / throw_duration, 1.0)

	pikmin.global_position = start_pos.lerp(end_pos, t)

	var z = 4.0 * arc_height * t * (1.0 - t)
	pikmin.sprite.position.y = pikmin.sprite_default_position.y - z

	if t >= 1.0:
		pikmin.global_position = end_pos
		pikmin.sprite.position.y = pikmin.sprite_default_position.y
		finished.emit(IDLE)

func physics_update(_delta: float):
	pass

func exit():
	hitbox.set_deferred("monitoring", false)
	pikmin.sprite.position.y = pikmin.sprite_default_position.y

func _on_hitbox_area_entered(area: Area2D) -> void:
	var body = area.owner
	if body is Enemy:
		pikmin.attached_body = body
		body.attached_pikmin_arr.append(pikmin)
		finished.emit(ATTACHED)
	pass # Replace with function body.
