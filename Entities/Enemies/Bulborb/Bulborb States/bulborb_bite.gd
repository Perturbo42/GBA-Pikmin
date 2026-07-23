class_name BulborbBite extends BulborbState
@onready var timer: Timer = $Timer
@onready var bite_area: Area2D = $"../../BiteArea"
@onready var detection_area: Area2D = $"../../DetectionArea"
var attacking: bool = false

func enter():
	attacking = false
	timer.timeout.connect(attack)
	timer.start(0.2)
	pass

func update(_delta: float):
	pass

func physics_update(_delta: float):
	if !bulborb.chase_target or attacking == true:
		return
	var bulb_pos: Vector2 = bulborb.global_position
	var targ_pos: Vector2 = bulborb.chase_target.global_position
	
	var dir: Vector2 = bulb_pos.direction_to(targ_pos)
	
	if bulb_pos.distance_to(targ_pos) >= 20:
		bulborb.velocity = bulborb.speed * dir
	bulborb.move_and_slide()
	pass

func exit():
	attacking = false
	pass

func attack():
	attacking = true
	
	for body in bite_area.get_overlapping_bodies():
		if body == bulborb.chase_target:
			if body is Pikmin:
				body.take_damage()
			elif body is Olimar:
				body.take_damage(bulborb.damage)
	
	if detection_area.get_overlapping_bodies():
		var new_body = detection_area.get_overlapping_bodies()[0]
		bulborb.chase_target = new_body
	else:
		finished.emit(RETURN)
		return
	
	attacking = false
	timer.start(3.0)
	pass
