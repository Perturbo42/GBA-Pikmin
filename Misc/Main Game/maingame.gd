class_name MainGame extends Node2D

const OLIMAR_SCENE_UID: String = "uid://c250jyb5pv22s"
@export var LEVEL_1: PackedScene

var player: Olimar = null
var current_level : BaseLevel = null

## Handlers
@onready var onion_handler: Node2D = %OnionHandler
@onready var spawn_handler: Node2D = %SpawnHandler


## World Roots
@onready var level_root: Node2D = $World/LevelRoot
@onready var entity_root: Node2D = $World/EntityRoot

## UI Roots
@onready var hud_layer: CanvasLayer = $HudLayer
@onready var pause_layer: CanvasLayer = $PauseLayer
@onready var transition_layer: CanvasLayer = $TransitionLayer

func _ready() -> void:
	init_player()
	load_level(LEVEL_1)

func init_player():
	var player_scene: PackedScene = ResourceLoader.load(OLIMAR_SCENE_UID) as PackedScene
	
	if player_scene == null:
		push_error("Could not load player scene" + OLIMAR_SCENE_UID)
		return
	
	player = player_scene.instantiate() as Olimar
	
	if player == null:
		push_error("Loaded player scene does not extend player or DNE: " + OLIMAR_SCENE_UID)
		return
	
	entity_root.add_child(player)

func load_level(level: PackedScene):
	deferred_load_level.call_deferred(level)

func deferred_load_level(level: PackedScene):
	if current_level != null:
		current_level.queue_free()
		current_level = null
	await get_tree().process_frame
	
	current_level = level.instantiate() as BaseLevel
	if current_level == null:
		push_error("Loaded level is not of type Level or does not exist")
		return
		# FUTURE (main menu): Should have a fall back scene

	level_root.add_child(current_level)

	# Allow level to fully process before accessing it
	await get_tree().process_frame
	
	# Handlers handle the level being updated
	handler_register(current_level)
	
	player.global_position = current_level.get_default_player_spawn()

func handler_register(level: BaseLevel):
	onion_handler.register_level(level)
	
