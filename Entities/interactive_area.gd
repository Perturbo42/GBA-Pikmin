class_name InteractiveArea extends Area2D

signal interacted
signal interaction_abled
signal interaction_disabled

var interaction_input = "Space"

func _ready() -> void:
	set_process_unhandled_input(false)

func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed(interaction_input):
		interacted.emit()
		get_viewport().set_input_as_handled()

func _on_area_entered(_area: Area2D) -> void:
	set_process_unhandled_input(true)
	interaction_abled.emit()


func _on_area_exited(_area: Area2D) -> void:
	set_process_unhandled_input(false)
	interaction_disabled.emit()
