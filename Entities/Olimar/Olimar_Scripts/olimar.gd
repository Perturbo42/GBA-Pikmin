class_name Olimar extends CharacterBody2D
@onready var marker: Marker2D = $"Pikmin Gather"

@export var speed := 500.0
var dir: Vector2

func _ready() -> void:
	Global.olimar = self
	dir = Vector2.DOWN

func _process(_delta: float) -> void:
	marker.position = Vector2.ZERO - dir * 25
