class_name OlimarDamaged extends OlimarState
@onready var hurtbox: OlimarHurtbox = %Hurtbox

@onready var invin_timer: Timer = $"Invincibility Timer"
@onready var inactivity_timer: Timer = $"Inactivity Timer"
var inactive: bool

func _ready() -> void:
	super._ready()
	invin_timer.timeout.connect(on_timer_timeout)
	inactivity_timer.timeout.connect(on_inactive_timeout)

func enter():
	hurtbox.invincible = true
	inactive = true
	invin_timer.start(3.0)
	inactivity_timer.start(1.0)
	pass

func handle_input(_event: InputEvent):
	pass

func update(_delta: float):
	pass

func physics_update(_delta: float):
	if inactive == false:
		finished.emit(IDLE)
	olimar.velocity = olimar.knockback
	olimar.move_and_slide()
	olimar.knockback = lerp(olimar.knockback, Vector2.ZERO, 0.1)
	pass

func exit():
	pass

func on_timer_timeout():
	hurtbox.invincible = false

func on_inactive_timeout():
	inactive = false
