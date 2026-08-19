class_name AttackComponent extends Node
@export var attached_state: State
@export var enemy: Enemy
@export var stop_detecting_state: State
@export var hitbox: Hitbox
@export var knockback_strength: float
@export var single_hit: bool
@export var max_enemies_hit: int

var num_of_enemies_hit: int

func attack():
	if !is_instance_valid(enemy.target):
		attached_state.finished.emit(stop_detecting_state.name)
		return
	num_of_enemies_hit = 0
	
	for area in hitbox.get_overlapping_areas():
		var body = area.owner
		
		if body == enemy.target:
			deal_damage(body)
			if single_hit:
				break
			else:
				continue
		else:
			if num_of_enemies_hit < max_enemies_hit:
				deal_damage(body)
				

func deal_damage(body: CharacterBody2D):
	if body is Pikmin:
		body.take_damage()
		print("Pikmin eaten")
	elif body is Olimar:
		var direction = enemy.global_position.direction_to(body.global_position)
		var explosion_force = direction * knockback_strength
		body.knockback = explosion_force
		print("Olimar take damage")
		body.take_damage(enemy.damage)
	
	num_of_enemies_hit += 1
