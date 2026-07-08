class_name Onion extends Node2D
@onready var area: InteractiveArea = $Area2D
var onion_panel_open: bool

func _ready() -> void:
	onion_panel_open = false
	area.interacted.connect(onion_panel)

func onion_panel():
	if onion_panel_open == false:
		onion_panel_open = true
		pass
	
	else: ## onion_panel_open == true
		onion_panel_open = false
		pass
	
