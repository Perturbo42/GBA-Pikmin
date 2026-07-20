class_name SpawnHandler extends Node2D

static var instance: SpawnHandler
@onready var entity_root: Node2D = %EntityRoot

func _ready():
	instance = self

static func spawn(scene: PackedScene, spawn_position: Vector2) -> Node:
	return instance._spawn(scene, spawn_position)

func _spawn(scene: PackedScene, spawn_position: Vector2) -> Node:
	var entity = scene.instantiate()
	entity_root.add_child(entity)
	entity.global_position = spawn_position
	return entity

static func spawn_pikmin(scene: PackedScene, spawn_position: Vector2) -> Node:
	return instance._spawn_pikmin(scene, spawn_position)

func _spawn_pikmin(scene: PackedScene, spawn_position: Vector2) -> Node:
	var entity = scene.instantiate()
	entity_root.add_child(entity)
	entity.global_position = spawn_position
	return entity

static func spawn_enemy(scene: PackedScene, spawn_position: Vector2) -> Node:
	return instance._spawn_enemy(scene, spawn_position)

func _spawn_enemy(scene:PackedScene, spawn_position: Vector2) -> Node:
	var entity = scene.instantiate()
	entity_root.add_child(entity)
	entity.global_position = spawn_position
	entity.home_location = spawn_position
	return entity
