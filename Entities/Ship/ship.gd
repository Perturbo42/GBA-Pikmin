class_name Ship extends Node2D
@onready var interactive_area: InteractiveArea = $InteractiveArea

func _ready() -> void:
	interactive_area.interacted.connect(ship_panel)
	

func ship_panel():
	print("ship panel open")
