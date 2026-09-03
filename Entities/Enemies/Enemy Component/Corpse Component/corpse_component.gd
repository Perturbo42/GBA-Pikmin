class_name CorpseComponent extends Carryable

@export_category("External Properties")
@export var collision_box: CollisionShape2D
@export var hurtbox: EnemyHurtbox
@export var alive_sprite: Sprite2D
@export var dead_sprite: Sprite2D


func activate():
	super.activate()
	if collision_box:
		collision_box.set_deferred("disabled", true)
	if hurtbox:
		hurtbox.set_deferred("monitorable", false)
	if alive_sprite:
		alive_sprite.visible = false
	if dead_sprite:
		dead_sprite.visible = true
