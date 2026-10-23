class_name WeightDisplay extends Node2D
@export_group("External Properties")
@export var carry_area: Area2D
@export var carryable: Node2D

@onready var box: VBoxContainer = $VBoxContainer
@onready var top_number: Label = $VBoxContainer/TopNumber/Label
@onready var bot_number: Label = $VBoxContainer/BottomNumber/Label

var display: bool = false:
	set(new):
		if new:
			box.visible = true
		else:
			box.visible = false
		

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	display = false
	box.visible = false
	top_number.text = str(carryable.weight)
	pass # Replace with function body.

func update(num: int):
	if !display and num > 0:
		display = true
	else:
		display = false
	
	bot_number.text = str(num)
