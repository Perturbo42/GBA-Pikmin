extends CanvasLayer
const OLIMAR_HEALTH_SCENE_UID: String = "uid://b4v6p8h1khrpg"
const PIKMIN_NUMBER_SCENE_UID: String = "uid://bpo35qlmnr50s"
const SUN_METER_SCENE_UID: String = "uid://bl7udqury0wx"

##In Level Huds
@onready var in_level_root: Control = $HudRoot/InLevelRoot
@onready var day_handler: DayHandler = %DayHandler

var health_scene: PackedScene
var number_scene: PackedScene
var sunbar_scene: PackedScene

var olimar_health: OlimarHealthUI
var pikmin_number: PikminNumberUI
var sun_meter: SunMeterUI

func _ready() -> void:
	health_scene = ResourceLoader.load(OLIMAR_HEALTH_SCENE_UID) as PackedScene
	number_scene = ResourceLoader.load(PIKMIN_NUMBER_SCENE_UID) as PackedScene
	sunbar_scene = ResourceLoader.load(SUN_METER_SCENE_UID) as PackedScene

func level_loaded():
	in_level_root.visible = true
	
	olimar_health = health_scene.instantiate() as OlimarHealthUI
	in_level_root.add_child(olimar_health)
	olimar_health.level_loaded()
	
	pikmin_number = number_scene.instantiate() as PikminNumberUI
	in_level_root.add_child(pikmin_number)
	pikmin_number.level_loaded()
	
	sun_meter = sunbar_scene.instantiate() as SunMeterUI
	in_level_root.add_child(sun_meter)
	sun_meter.day_handler = day_handler
	sun_meter.level_loaded()
	

func level_unloaded():
	in_level_root.visible = false
