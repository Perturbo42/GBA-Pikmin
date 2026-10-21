@tool extends Sprite2D

var previous_texture: Texture2D = null
var previous_offset: Vector2 = Vector2.ZERO
@onready var timer: Timer = $Timer


func _ready() -> void:
	if not Engine.is_editor_hint():
		queue_free()
		return
	timer.timeout.connect(on_refresh_timeout)
	timer.start(0.25)
	on_refresh_timeout()

func on_refresh_timeout():
	var spawner: TreasureSpawner = get_parent() as TreasureSpawner
	if spawner == null:
		return
	
	var definition: TreasureDefinition = spawner.treasure_definition
	
	var new_texture: Texture2D =\
	definition.preview_texture if (definition and definition.preview_texture) else null
	var new_offset: Vector2 = definition.preview_offset
	
	if new_texture != previous_texture:
		previous_texture = new_texture
		texture = new_texture
	
	if new_offset != previous_offset:
		previous_offset = new_offset
		offset = new_offset
