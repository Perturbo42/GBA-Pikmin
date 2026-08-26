class_name PikminAttached extends PikminState
@onready var attack_timer: Timer = $"Attack Timer"
@onready var collider_box: CollisionShape2D = %"Collider Box"
@onready var hitbox: Area2D = %"Pikmin Hitbox"

var attach_offset: Vector2 = Vector2.ZERO
var attached_group: PikminGroup

func _ready() -> void:
	super._ready()
	attack_timer.timeout.connect(damage)

func enter():
	collider_box.set_deferred("disabled", true)
	pikmin.velocity = Vector2.ZERO
	pikmin.z_index = 1
	attach_offset = pikmin.global_position - hitbox.attached_hurtbox.global_position
	attached_group = hitbox.attached_hurtbox.group
	attack_timer.start()
	pass

func update(_delta: float):
	if not PikminRegistry.does_group_contain_pikmin(pikmin, attached_group):
		finished.emit(IDLE)
	pass

func physics_update(_delta: float):
	pikmin.global_position = hitbox.attached_hurtbox.global_position + attach_offset
	pikmin.move_and_slide()
	pass

func exit():
	collider_box.set_deferred("disabled", false)
	pikmin.z_index = 0
	PikminRegistry.remove_pikmin_from_group(pikmin, hitbox.attached_hurtbox.group)
	hitbox.attached_hurtbox = null
	attach_offset = Vector2.ZERO
	pikmin.sprite.position.y = pikmin.sprite_default_position.y
	hitbox.position.y = pikmin.sprite.position.y
	pass

func damage():
	if hitbox.attached_hurtbox:
		print("Pikmin dealt damage")
		hitbox.attached_hurtbox.take_damage(pikmin.damage)
	pass
