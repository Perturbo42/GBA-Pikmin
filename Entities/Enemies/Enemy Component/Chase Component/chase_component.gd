class_name ChaseComponent extends Node
@export var attached_state: State 
##The state that this script is attached to
@export var enemy: Enemy
@export var hurtbox: EnemyHurtbox
@export var attacking_range: float
@export var stop_detecting_state: State
@export var attacking_state: State

func chasing():
	if !enemy.target:
		attached_state.finished.emit(stop_detecting_state.name)
		return
	if enemy.target is Pikmin:
		if enemy.target in hurtbox.group.pikmin_arr:
			attached_state.finished.emit(attacking_state.name)
			return
	
	var enem_pos: Vector2 = enemy.global_position
	var targ_pos: Vector2 = enemy.target.global_position
	
	var dir: Vector2 = enem_pos.direction_to(targ_pos)
	enemy.velocity = enemy.speed * dir
	
	if enem_pos.distance_to(targ_pos) <= attacking_range:
		attached_state.finished.emit(attacking_state.name)
	enemy.move_and_slide()
