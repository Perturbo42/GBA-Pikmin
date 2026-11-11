extends Label

func _process(_delta: float) -> void:
	self.text = str(PikminRegistry.all_pikmin.size())
