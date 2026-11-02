class_name HealthBar extends Node2D
@export var entity: Node2D
@export var group: PikminGroup
@onready var sprite: Sprite2D = $Sprite2D
@onready var timer: Timer = $Timer

var max_health: int

func _ready() -> void:
	if entity:
		max_health = entity.health
	if timer:
		timer.timeout.connect(timeout)
	if group:
		group.arr_is_empty.connect(start_timer)
	self.visible = false

func _process(_delta: float) -> void:
	if group.num_of_pikmin() != 0:
		self.visible = true
		update_health_bar()

func update_health_bar():
	var health_percent : float = float(entity.health) / float(max_health) * 10
	if health_percent <= 0:
		health_percent = 0
	var frame: int = ceili(health_percent)
	sprite.frame = 10 - frame

func start_timer():
	if !timer.is_stopped():
		timer.stop()
	timer.start()

func timeout():
	if self.visible and group.num_of_pikmin() == 0:
		self.visible = false
