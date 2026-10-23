class_name Treasure extends CharacterBody2D
@export_group("External Properties")
@export var carry_area: CarryArea
@export var carry_comp: Carryable
@export var carry_moving_comp: CarryableMoving

func _ready() -> void:
	carry_comp.activate()

func _physics_process(_delta: float) -> void:
	if carry_moving_comp.is_moving:
		carry_moving_comp.move_to_destination()

func free_self():
	queue_free()
