extends Camera2D
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	if is_instance_valid(Global.olimar):
		self.global_position = Global.olimar.global_position + Vector2(0,-30)
