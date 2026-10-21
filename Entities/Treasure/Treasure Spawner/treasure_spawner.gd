class_name TreasureSpawner extends Marker2D

@export var treasure_definition: TreasureDefinition

var treasure_scene: PackedScene
var has_spawned_once: bool = false

func _ready() -> void:
	if treasure_definition == null:
		print("Enemy definition not found")
		return
	
	treasure_scene = treasure_definition.scene
	
	if treasure_scene == null:
		print("Enemy definition does not have a scene attached")
	
	_deferred_spawn()


func _deferred_spawn():
	SpawnHandler.spawn_treasure(treasure_scene, global_position)
