class_name OnionHandler extends Node2D
@onready var onion_pause_handler: OnionPauseHandler = %OnionPauseHandler

var current_level : BaseLevel = null
var connected_onions: Array[Onion] = []


func register_level(level: BaseLevel):
	disconnect_current_level()
	current_level = level
	connect_onions(current_level)

func connect_onions(level: Node) -> void:
	var onions := level.find_children("*", "Onion", true, false)
	
	for onion in onions:
		if not onion.menu_requested.is_connected(on_onion_menu_requested):
			onion.menu_requested.connect(on_onion_menu_requested)
			connected_onions.append(onion)

func disconnect_current_level() -> void:
	for onion in connected_onions:
		if is_instance_valid(onion) and onion.menu_requested.is_connected(on_onion_menu_requested):
			onion.menu_requested.disconnect(on_onion_menu_requested)
	
	connected_onions.clear()
	current_level = null

func on_onion_menu_requested(onion: Onion) -> void:
	if onion_pause_handler:
		onion_pause_handler.open_menu(onion)

func onion_update(num: int, curr_onion: Onion):
	for onion in connected_onions:
		if is_instance_valid(onion) and onion == curr_onion:
			onion.change_pikmin_count(num)
	
	if num > 0:
		Global.olimar.remove_pikmin_from_following(num, curr_onion.onion_color)
	
	pass
