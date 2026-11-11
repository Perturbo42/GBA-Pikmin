class_name OlimarHealthUI extends InLevelUI
@onready var health_bar: TextureRect = $HBoxContainer/HealthBar

func level_loaded():
	GameState.took_damage.connect(update_health)
	update_health(GameState.health)

func update_health(health: int):
	var frame = 10 - health
	var atlas := health_bar.texture as AtlasTexture
	var region := atlas.region
	
	region.position.x = frame * region.size.x
	atlas.region = region
