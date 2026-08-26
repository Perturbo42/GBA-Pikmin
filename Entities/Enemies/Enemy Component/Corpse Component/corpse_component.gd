class_name CorpseComponent extends Node

@export_category("External Properties")
@export var enemy: Enemy
@export var collision_box: CollisionShape2D
@export var hurtbox: EnemyHurtbox
@export var corpse_area: CorpseArea
@export var alive_sprite: Sprite2D
@export var dead_sprite: Sprite2D
@export var attached_group: PikminGroup

@export_category("Internal Properties")
@export var weight: int

var max_weight: int

func activate():
	if !enemy:
		return
	
	if collision_box:
		collision_box.set_deferred("disabled", true)
	if hurtbox:
		hurtbox.set_deferred("monitorable", false)
	if corpse_area:
		corpse_area.set_deferred("monitorable", true)
	if alive_sprite:
		alive_sprite.visible = false
	if dead_sprite:
		dead_sprite.visible = true
	if attached_group:
		PikminRegistry.remove_all_from_group(attached_group)
	
	
	max_weight = min(weight * 2, 100)
	
