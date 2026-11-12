extends TextureRect

var olimar: Olimar
var atlas := self.texture as AtlasTexture
var region := atlas.region

func level_ready():
	olimar = Global.olimar
	olimar.curr_pikmin_type.connect(update)
	update(olimar.curr_type)

func update(pikmin_script: GDScript):
	var arr: Array = olimar.following_pikmin[pikmin_script].pikmin_arr
	
	if arr.is_empty():
		region.position.x = 0
	elif pikmin_script == RedPikmin:
		region.position.x = 1 * region.size.x
	elif pikmin_script == YellowPikmin:
		region.position.x = 2 * region.size.x
	elif pikmin_script == BluePikmin:
		region.position.x = 3 * region.size.x
	
	atlas.region = region
	pass
