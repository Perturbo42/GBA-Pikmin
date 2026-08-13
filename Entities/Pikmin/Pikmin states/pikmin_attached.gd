class_name PikminAttached extends PikminState
@onready var attack_timer: Timer = $"Attack Timer"
var attach_offset: Vector2 = Vector2.ZERO

func _ready() -> void:
	super._ready()
	attack_timer.timeout.connect(damage)

func enter():
	pikmin.velocity = Vector2.ZERO
	pikmin.z_index = 1
	attach_offset = pikmin.global_position - pikmin.attached_body.global_position
	attack_timer.start()
	pass

func update(_delta: float):
	pass

func physics_update(_delta: float):
	pikmin.global_position = pikmin.attached_body.global_position + attach_offset
	pikmin.move_and_slide()
	pass

func exit():
	pikmin.z_index = 0
	pikmin.attached_body.attached_pikmin_arr.erase(pikmin)
	pikmin.attached_body = null
	attach_offset = Vector2.ZERO
	pass

func damage():
	if pikmin.attached_body:
		pikmin.attached_body.take_damage(pikmin.damage)
	pass
