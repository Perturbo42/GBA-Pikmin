class_name PauseLayer extends CanvasLayer

## Handlers
@onready var onion_pause_handler: Control = $PauseHandlers/OnionPauseHandler

@onready var pause_root: Control = $PauseRoot

func _ready() -> void:
	handlers_init()

func handlers_init():
	pass

func open_onion_menu(onion: Onion):
	onion_pause_handler.open_menu(onion)
