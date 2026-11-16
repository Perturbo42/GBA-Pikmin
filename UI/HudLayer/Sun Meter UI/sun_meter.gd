class_name SunMeterUI extends InLevelUI
const START_POS_X: float = 0.0
const END_POS_X: float = 300.0

@onready var sun: TextureRect = $Sun
var day_handler: DayHandler

func level_loaded():
	sun.position = Vector2(START_POS_X,0)

func _process(_delta: float) -> void:
	if day_handler.timer_active:
		move_sun()

func move_sun():
	var curr_pos_x : float = day_handler.time / day_handler.DAYTIME
	sun.position.x = curr_pos_x * END_POS_X
