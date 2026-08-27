class_name WhistleArea2D extends Area2D
var is_active: bool = false

func _process(_delta: float) -> void:
	if is_active:
		for area in get_overlapping_areas():
			if !area.can_be_detected:
				continue
			var body = area.owner
			if body is Pikmin and body.state_machine.curr_state is not PikminFollow:
				if body is RedPikmin:
					PikminRegistry.add_pikmin_to_group(body, Global.olimar.following_pikmin[RedPikmin])
					body.state_machine.change_state("Follow")
