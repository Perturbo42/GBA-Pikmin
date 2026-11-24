class_name Pellet extends Enemy
@export_group("External Properties")
@export var corpse_area: CorpseArea
@export var corpse_comp: CorpseComponent
@export var corpse_moving_comp: CarryableMoving
@export var sprite: Sprite2D

@export_group("Internal Properties")
@export var small: int
@export var big: int

var color : int
func _ready() -> void:
	corpse_comp.activate()

func _physics_process(_delta: float) -> void:
	if corpse_moving_comp.is_moving:
		if corpse_area.destination == color:
			corpse_comp.seeds = big
		else:
			corpse_comp.seeds = small
		corpse_moving_comp.move_to_destination()

func ready_self() -> void:
	if color:
		sprite.frame = color
