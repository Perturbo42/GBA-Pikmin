class_name PikminAttached extends PikminState
@onready var attack_timer: Timer = $"Attack Timer"

func _ready() -> void:
	attack_timer.timeout.connect(damage)

func enter():
	pikmin.velocity = Vector2.ZERO
	attack_timer.start()
	pass

func update(_delta: float):
	pass

func physics_update(_delta: float):
	pass

func exit():
	pikmin.attached_body.attached_pikmin_arr.erase(pikmin)
	pikmin.attached_body = null
	
	pass

func damage():
	pikmin.attached_body.take_damage(pikmin.damage)
	pass
