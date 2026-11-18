class_name SpawnHandler extends Node2D
const SPROUT_UID: String = "uid://bnn62wegx0xdo"
static var instance: SpawnHandler
@onready var entity_root: Node2D = %EntityRoot
var sprout_scene: PackedScene
func _ready():
	instance = self
	sprout_scene = ResourceLoader.load(SPROUT_UID) as PackedScene

static func spawn(scene: PackedScene, spawn_position: Vector2) -> Node:
	return instance._spawn(scene, spawn_position)

func _spawn(scene: PackedScene, spawn_position: Vector2) -> Node:
	var entity = scene.instantiate()
	entity_root.add_child(entity)
	entity.global_position = spawn_position
	return entity

static func spawn_pikmin(scene: PackedScene, spawn_position: Vector2):
	instance.call_deferred("_spawn_pikmin", scene, spawn_position)

func _spawn_pikmin(scene: PackedScene, spawn_position: Vector2) -> Node:
	var entity = scene.instantiate()
	entity_root.add_child(entity)
	entity.global_position = spawn_position
	PikminRegistry.register_pikmin(entity)
	return entity

static func spawn_enemy(scene: PackedScene, spawn_position: Vector2) -> Node:
	return instance._spawn_enemy(scene, spawn_position)

func _spawn_enemy(scene:PackedScene, spawn_position: Vector2) -> Node:
	var entity = scene.instantiate()
	entity_root.add_child(entity)
	entity.global_position = spawn_position
	entity.home_location = spawn_position
	return entity

static func spawn_treasure(scene: PackedScene, spawn_position: Vector2) -> Node:
	return instance._spawn_treasure(scene, spawn_position)

func _spawn_treasure(scene: PackedScene, spawn_position: Vector2) -> Node:
	var entity = scene.instantiate()
	entity_root.add_child(entity)
	entity.global_position = spawn_position
	return entity

static func spawn_sprout(spawn_position: Vector2, color: int) -> Node:
	return instance._spawn_sprout(spawn_position, color)

func _spawn_sprout(spawn_position: Vector2, color: int) -> Node:
	var entity = sprout_scene.instantiate()
	entity_root.add_child(entity)
	entity.global_position = spawn_position
	entity.color = color
	return entity
