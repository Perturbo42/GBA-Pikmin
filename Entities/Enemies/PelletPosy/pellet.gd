class_name Pellet extends Enemy
@export var corpse_comp: CorpseComponent
@export var corpse_moving_comp: CarryableMoving
@export var sprite: Sprite2D
var color : int

func _ready() -> void:
	corpse_comp.activate()

func _physics_process(_delta: float) -> void:
	if corpse_moving_comp.is_moving:
		corpse_moving_comp.move_to_destination()

func ready_self() -> void:
	if color:
		sprite.frame = color
