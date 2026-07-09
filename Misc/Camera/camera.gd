extends Camera2D
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	self.global_position = Global.olimar.global_position
