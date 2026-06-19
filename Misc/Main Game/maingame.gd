class_name MainGame extends Node

const OLIMAR: String = "uid://c250jyb5pv22s"
const LEVEL_1: String = "uid://dgstc0a5b01to"

var player: Olimar = null
var current_level : BaseLevel = null

@onready var level_root: Node2D = $World/LevelRoot
@onready var entity_root: Node2D = $World/EntityRoot

@onready var hud_layer: CanvasLayer = $HudLayer
@onready var pause_layer: CanvasLayer = $PauseLayer
@onready var transition_layer: CanvasLayer = $TransitionLayer

func _ready() -> void:
	init_player()
	load_level(LEVEL_1)

func init_player():
	var player_scene: PackedScene = ResourceLoader.load(OLIMAR) as PackedScene
	
	if player_scene == null:
		push_error("Could not load player scene" + OLIMAR)
		return
	
	player = player_scene.instantiate() as Olimar
	
	if player == null:
		push_error("Loaded player scene does not extend player or DNE: " + OLIMAR)
		return
	
	entity_root.add_child(player)

func load_level(level_scene: String):
	deferred_load_level.call_deferred(level_scene)

func deferred_load_level(level_scene_uid: String):
	if current_level != null:
		current_level.queue_free()
		current_level = null
	await get_tree().process_frame
	
	var new_level_packed : PackedScene =\
		ResourceLoader.load(level_scene_uid, "PackedScene") as PackedScene
	if new_level_packed == null:
		push_error("Could not load level as a packed scene: " + level_scene_uid)
		return

	current_level = new_level_packed.instantiate() as BaseLevel
	if current_level == null:
		push_error("Loaded level is not of type Level or does not exist")
		return
		# FUTURE (main menu): Should have a fall back scene

	level_root.add_child(current_level)

	# Allow level to fully process before accessing it
	await get_tree().process_frame
	player.global_position = current_level.get_default_player_spawn()
