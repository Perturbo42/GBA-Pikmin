class_name PikminAttacking extends PikminState
const ATK_RANGE = 20
@onready var attack_timer: Timer = $"Attack Timer"
@export var target_comp: TargettingComponent
var target

func _ready() -> void:
	super._ready()
	attack_timer.timeout.connect(damage)

func enter():
	target = target_comp.target_node
	attack_timer.start()
	pass

func update(_delta: float):
	if pikmin.global_position.distance_to(target.global_position) > ATK_RANGE:
		finished.emit(IDLE)
	pass

func physics_update(_delta: float):
	pass

func exit():
	attack_timer.stop()
	pass

func damage():
	if target.hurtbox:
		if target.hurtbox.health <= 0:
			finished.emit(IDLE)
			return
		target.hurtbox.take_damage(pikmin.damage)
	pass
