class_name EnemyDefinition extends Resource

@export var scene: PackedScene
@export var preview_texture: Texture2D
@export var preview_offset: Vector2 = Vector2.ZERO
@export var spawn_mode: EnemySpawner.SpawnMode

func handle_enemy(_entity: Node):
	pass
