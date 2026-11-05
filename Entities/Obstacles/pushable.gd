class_name Pushable extends CharacterBody2D
@export_group("External Properties")
@export var slots: Node2D
@export var target_marker: Marker2D
@export var group: PikminGroup
@export var area: PushableArea

@export_group("Internal Properties")
@export var weight: int
@export var speed: float

var moving: bool = false
var targ_pos: Vector2

func _ready() -> void:
	targ_pos = target_marker.global_position

func _physics_process(_delta: float) -> void:
	if !moving:
		velocity = Vector2.ZERO
	else:
		if global_position.distance_to(targ_pos) <= 1:
			stop_moving()
		else:
			move_and_slide()

func start_moving():
	moving = true
	var dir = self.global_position.direction_to(targ_pos)
	self.velocity = dir * speed
	
	for pikmin in group.pikmin_arr:
		pikmin.uninterruptable()
	pass

func stop_moving():
	moving = false
	velocity = Vector2.ZERO
	area.detectable = false
	PikminRegistry.remove_all_from_group(group)
	area.clean_dict()
