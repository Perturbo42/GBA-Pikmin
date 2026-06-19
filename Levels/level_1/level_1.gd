class_name Level1 extends BaseLevel
@onready var default_spawn: Marker2D = $"Spawns/Default Spawn"

func get_default_player_spawn() -> Vector2:
	return default_spawn.global_position
