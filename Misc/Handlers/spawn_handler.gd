class_name SpawnHandler extends Node2D
const SPROUT_UID: String = "uid://bnn62wegx0xdo"
const RED_UID: String = "uid://kbjiailqfskx"
const YELLOW_UID: String = "uid://dwhsgkfnkn4ab"
const BLUE_UID: String = "uid://chi03177fw6cf"

static var instance: SpawnHandler
@onready var entity_root: Node2D = %EntityRoot
var sprout_scene: PackedScene
var red_pikmin_scene: PackedScene
var yellow_pikmin_scene: PackedScene
var blue_pikmin_scene: PackedScene

func _ready():
	instance = self
	sprout_scene = ResourceLoader.load(SPROUT_UID) as PackedScene
	red_pikmin_scene = ResourceLoader.load(RED_UID) as PackedScene
	yellow_pikmin_scene = ResourceLoader.load(YELLOW_UID) as PackedScene
	blue_pikmin_scene = ResourceLoader.load(BLUE_UID) as PackedScene

static func spawn(scene: PackedScene, spawn_position: Vector2) -> Node:
	return instance._spawn(scene, spawn_position)

func _spawn(scene: PackedScene, spawn_position: Vector2) -> Node:
	var entity = scene.instantiate()
	entity_root.add_child(entity)
	entity.global_position = spawn_position
	return entity

static func spawn_pikmin(color: int, spawn_position: Vector2):
	instance.call_deferred("_spawn_pikmin", color, spawn_position)

func _spawn_pikmin(color: int, spawn_position: Vector2) -> Node:
	var entity
	if color == 0:
		entity = red_pikmin_scene.instantiate()
	elif color == 1:
		entity = yellow_pikmin_scene.instantiate()
	elif color == 2:
		entity = blue_pikmin_scene.instantiate()
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
	return instance.call_deferred("_spawn_sprout", spawn_position, color)

func _spawn_sprout(spawn_position: Vector2, color: int) -> Node:
	var entity = sprout_scene.instantiate()
	entity_root.add_child(entity)
	entity.global_position = spawn_position
	entity.color = color
	return entity
