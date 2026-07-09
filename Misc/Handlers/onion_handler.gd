class_name OnionHandler extends Node2D
var pause_layer: CanvasLayer
var current_level : BaseLevel = null
var connected_onions: Array[Onion] = []

func initialize(p_pause_layer: CanvasLayer):
	pause_layer = p_pause_layer

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
	if pause_layer:
		pause_layer.open_onion_menu(onion)
