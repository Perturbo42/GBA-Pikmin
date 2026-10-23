class_name TreasureEatingArea extends Area2D
@onready var ship: Node2D = $".."

func _on_area_entered(area: Area2D) -> void:
	if area is CarryArea and area is not CorpseArea:
		area.destroy_self()
	pass # Replace with function body.
