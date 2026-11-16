class_name DayHandler extends Node2D
const DAYTIME: float = 780.0

var time: float = 0.0
var timer_active: bool = false

func start_level():
	timer_active = true

func _process(delta: float) -> void:
	if !timer_active:
		return
	
	time += delta
	
	if time >= DAYTIME:
		timer_active = false
		end_day()

func end_day():
	pass
