class_name Olimar extends CharacterBody2D
@onready var marker: Marker2D = $"Pikmin Gather"

@export var state_machine: StateMachine
@export var speed: float
var dir: Vector2
var following_pikmin: Array[Pikmin] = []

func _ready() -> void:
	Global.olimar = self
	dir = Vector2.DOWN

func _process(_delta: float) -> void:
	marker.position = Vector2.ZERO - dir * 25
