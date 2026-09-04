class_name CorpseEatingArea extends Area2D
@onready var onion: Onion = $".."

func _on_area_entered(area: Area2D) -> void:
	if area is CorpseArea:
		var seeds = area.return_seeds()
		onion.spawn_pikmin(seeds)
		area.destroy_self()
