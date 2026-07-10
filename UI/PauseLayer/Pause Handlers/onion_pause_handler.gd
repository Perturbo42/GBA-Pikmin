class_name OnionPauseHandler extends Control
@onready var onion_handler: OnionHandler = %OnionHandler
@onready var pause_root: Control = %PauseRoot
@export var red_onion_menu: PackedScene
@export var yellow_onion_menu: PackedScene
@export var blue_onion_menu: PackedScene
var current_menu: Control

func open_menu(onion: Onion):
	if current_menu:
		current_menu.queue_free()
		current_menu = null
	
	var menu = identify_onion(onion.onion_color)
	current_menu = menu.instantiate()
	current_menu.onion = onion
	current_menu.panel_close.connect(close_menu)
	pause_root.add_child(current_menu)
	
	get_tree().paused = true

func close_menu(num: int, onion: Onion):
	if current_menu:
		current_menu.queue_free()
		current_menu = null
	get_tree().paused = false
	onion_handler.onion_update(num, onion)


func identify_onion(num: int)-> PackedScene:
	if num == 1:
		return red_onion_menu
	elif num == 2:
		return yellow_onion_menu
	elif num == 3:
		return blue_onion_menu
	else:
		return null
