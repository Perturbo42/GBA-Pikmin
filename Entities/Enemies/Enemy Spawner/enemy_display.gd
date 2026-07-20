@tool extends Sprite2D

var previous_texture: Texture2D = null
@onready var timer: Timer = $Timer

func _ready() -> void:
	if not Engine.is_editor_hint():
		queue_free()
		return
	timer.timeout.connect(on_refresh_timeout)
	timer.start(0.25)
	on_refresh_timeout()

func on_refresh_timeout():
	var spawner: EnemySpawner = get_parent() as EnemySpawner
	if spawner == null:
		return
	
	var definition: EnemyDefinition = spawner.enemy_definition
	
	var new_texture: Texture2D =\
	definition.preview_texture if (definition and definition.preview_texture) else null
	
	if new_texture == previous_texture:
		return
	
	previous_texture = new_texture
	texture = new_texture
