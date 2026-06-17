class_name WhistleArea2D extends Area2D
var is_active: bool = false

func _process(_delta: float) -> void:
	if is_active:
		for body in get_overlapping_bodies():
			if body is Pikmin and body.state_machine.curr_state is not PikminFollow:
				if body is RedPikmin:
					if body not in Global.olimar.following_pikmin[RedPikmin]:
						Global.olimar.following_pikmin[RedPikmin].append(body)
						body.state_machine.change_state("Follow")

func activate():
	is_active = true

func deactivate():
	is_active = false
