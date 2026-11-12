class_name OlimarHealthUI extends InLevelUI
@onready var health_bar: TextureRect = $HBoxContainer/HealthBar
var atlas : AtlasTexture
var region

func level_loaded():
	GameState.took_damage.connect(update_health)
	atlas = health_bar.texture
	region = atlas.region
	update_health(GameState.health)

func update_health(health: int):
	var frame = 10 - health
	region.position.x = frame * region.size.x
	atlas.region = region
