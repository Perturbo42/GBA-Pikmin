extends Label

var olimar: Olimar

func level_ready():
	olimar = Global.olimar

func _process(_delta: float) -> void:
	if olimar:
		self.text = str(olimar.following_pikmin[olimar.curr_type].num_of_pikmin())
