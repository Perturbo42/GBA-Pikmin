class_name HealthBar extends Node2D
@export var entity: Node2D
@onready var sprite: Sprite2D = $Sprite2D

var max_health: int

func _ready() -> void:
	if entity:
		max_health = entity.health

func _process(_delta: float) -> void:
	update_health_bar()

func update_health_bar():
	var health_percent : float = float(entity.health) / float(max_health) * 10
	if health_percent <= 0:
		health_percent = 0
	var frame: int = ceili(health_percent)
	sprite.frame = 10 - frame
	
