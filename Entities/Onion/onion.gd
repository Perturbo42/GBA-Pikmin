class_name Onion extends Node2D
@onready var area: InteractiveArea = $Area2D
@export var onion_color: int 
## 1: Red 2: Yellow 3: Blue
var onion_panel_open: bool
var pikmin_count: int


signal menu_requested(onion)

func _ready() -> void:
	onion_panel_open = false
	area.interacted.connect(onion_panel)

func onion_panel():
	if onion_panel_open == false:
		onion_panel_open = true
		menu_requested.emit(self)
		pass
	
	else: ## onion_panel_open == true
		onion_panel_open = false
		pass
	
