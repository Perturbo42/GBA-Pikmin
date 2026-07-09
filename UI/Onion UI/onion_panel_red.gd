class_name OnionPanelRed extends CenterContainer
signal panel_close
@onready var pikmin_in_onion: Label = $"PanelContainer/VBoxContainer/Pikmin in Onion/Pikmin in Onion"
@onready var pikmin_being_moved: Label = $"PanelContainer/VBoxContainer/Pikmin Being Moved/Pikmin Being Moved"
@onready var pikmin_with_olimar: Label = $"PanelContainer/VBoxContainer/Pikmin with Olimar/Pikmin with Olimar"

var onion: Onion

var onion_num: int:
	set(value):
		onion_num = max(value, 0)
		pikmin_in_onion.text = str(onion_num)
var moved_num: int:
	set(value):
		moved_num = value
		pikmin_being_moved.text = str(abs(moved_num))
var olimar_num: int:
	set(value):
		olimar_num = max(value, 0)
		pikmin_with_olimar.text = str(olimar_num)

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	onion_num = onion.pikmin_count
	moved_num = 0
	olimar_num = Global.olimar.following_pikmin[RedPikmin].size()
	pass # Replace with function body.

func _unhandled_input(_event: InputEvent) -> void:
	if Input.is_action_pressed("Up"):
		if olimar_num > 0:
			onion_num += 1
			moved_num += 1
			olimar_num -= 1
	elif Input.is_action_pressed("Down"):
		if onion_num > 0:
			onion_num -= 1
			moved_num -= 1
			olimar_num += 1
	elif Input.is_action_just_pressed("Space"):
		panel_close.emit()
