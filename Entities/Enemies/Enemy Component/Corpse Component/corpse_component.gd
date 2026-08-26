class_name CorpseComponent extends Node

@export_category("External Properties")
@export var enemy: Enemy
@export var collision_box: CollisionShape2D
@export var hurtbox: EnemyHurtbox
@export var alive_sprite: Sprite2D
@export var dead_sprite: Sprite2D
@export var attached_group: PikminGroup

@export_category("Internal Properties")
@export var weight: int

var max_weight: int

func activate():
	collision_box.set_deferred("disabled", true)
	hurtbox.set_deferred("monitorable", false)
	alive_sprite.visible = false
	dead_sprite.visible = true
	PikminRegistry.remove_all_from_group(attached_group)
	
	max_weight = min(weight * 2, 100)
	
