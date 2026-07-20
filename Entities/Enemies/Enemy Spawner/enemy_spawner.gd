class_name EnemySpawner extends Marker2D

enum SpawnMode{
	ON_READY,
	ON_SCREEN
}

@export var enemy_definition: EnemyDefinition

var enemy_scene: PackedScene
var _spawn_mode: SpawnMode
var has_spawned_once: bool = false

func _ready() -> void:
	if enemy_definition == null:
		print("Enemy definition not found")
		return
	
	enemy_scene = enemy_definition.scene
	
	if enemy_scene == null:
		print("Enemy definition does not have a scene attached")
	
	apply_spawn_definition(enemy_definition)
	
	if _spawn_mode == SpawnMode.ON_READY:
		_deferred_spawn()

func apply_spawn_definition(definition: EnemyDefinition):
	
	_spawn_mode = definition.spawn_mode

func _deferred_spawn():
	SpawnHandler.spawn_enemy(enemy_scene, global_position)
