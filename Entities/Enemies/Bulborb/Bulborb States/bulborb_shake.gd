class_name BulborbShake extends BulborbState
@onready var shake_timer: Timer = $ShakeTimer
@onready var state_timer: Timer = $StateTimer
@onready var shake_component: ShakeComponent = $"Shake Component"


func _ready() -> void:
	super._ready()
	shake_timer.timeout.connect(shake)
	state_timer.timeout.connect(finished_shaking)

func enter():
	bulborb.velocity = Vector2.ZERO
	shake_timer.start()
	state_timer.start()
	pass

func update(_delta: float):
	pass

func physics_update(_delta: float):
	pass

func exit():
	shake_timer.stop()
	state_timer.stop()
	pass

func shake():
	if bulborb.state_machine.curr_state == self:
		print("Bulborb: start shaking")
		shake_component.shake()
	pass

func finished_shaking():
	print("Bulborb: finished shaking")
	finished.emit(CHASE)
	pass
