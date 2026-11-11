class_name PikminNumberUI extends InLevelUI
@onready var pikmin_with_you: Label = $HBoxContainer/Squad/PikminWithYou
@onready var pikmin_overworld: Label = $HBoxContainer/Field/PikminOverworld

func level_loaded():
	pikmin_with_you.level_ready()
	pass
