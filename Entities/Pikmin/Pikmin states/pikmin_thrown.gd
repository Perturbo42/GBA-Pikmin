class_name PikminThrown extends PikminState
var dir: Vector2
var dist: float

var initial_pos: Vector2
var initial_speed: float
const gravity: float = 9.8
var time: float = 0.0

var z_axis: float = 0.0

func enter():
	pikmin.velocity = Vector2.ZERO
	initial_pos = pikmin.global_position
	dir = initial_pos.direction_to(pikmin.target_throw)
	dist = initial_pos.distance_to(pikmin.target_throw)
	initial_speed = pow(dist * gravity / sin(2 * deg_to_rad(pikmin.throw_angle)), 0.5)
	
	time = 0.0
	z_axis = 0.0
	pass

func update(delta: float):
	time += delta * pikmin.throw_speed
	z_axis = initial_speed * sin(deg_to_rad(pikmin.throw_angle)) * time - 0.5 * gravity * pow(time, 2)
	
	if z_axis > 0:
		var x_axis: float = initial_speed * cos(deg_to_rad(pikmin.throw_angle)) * time
		pikmin.global_position = initial_pos + dir * x_axis
		pikmin.global_position.y -= z_axis
	else:
		pikmin.global_position = pikmin.target_throw
		finished.emit(IDLE)
	pass

func physics_update(_delta: float):
	pass

func exit():
	pass
