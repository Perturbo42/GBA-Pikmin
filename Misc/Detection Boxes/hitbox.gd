class_name Hitbox extends Area2D
@export var is_pikmin: bool 
@export var is_enemy: bool

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if is_pikmin:
		set_deferred("monitoring", false)
		
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass
