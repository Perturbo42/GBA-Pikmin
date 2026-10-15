class_name CorpseComponent extends Carryable

@export_group("External Properties")
@export var collision_box: CollisionShape2D
@export var hurtbox: EnemyHurtbox
@export var alive_sprite: Sprite2D
@export var dead_sprite: Sprite2D

@export_group("Internal Properties")
@export var seeds: int


func activate():
	call_deferred("_activate")


func _activate():
	if collision_box:
		collision_box.disabled = true
	if hurtbox:
		hurtbox.monitorable = false
	if alive_sprite:
		alive_sprite.visible = false
	if dead_sprite:
		dead_sprite.visible = true
	if carry_area:
		carry_area.is_dead = true
	super.activate()
