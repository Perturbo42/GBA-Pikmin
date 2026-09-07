class_name BulborbChase extends BulborbState
@onready var timer: Timer = $"Find New Chase Target"

@export_category("External Properties")
@export var chase_component: Node
@export var closest_target: Node
@export var dir_comp: DirectionComponent
@export var group: PikminGroup

var shake_timer: float = 0.0
const NUM_OF_PIKMIN_TO_SHAKE: int = 5
const SHAKE_TIMER_END: float = 3.0

func _ready() -> void:
	super._ready()
	timer.timeout.connect(find_new_target)

func enter():
	timer.start()
	pass

func update(delta: float):
	if group.num_of_pikmin() >= NUM_OF_PIKMIN_TO_SHAKE:
		shake_timer += delta
		if shake_timer >= SHAKE_TIMER_END:
			shake_timer = 0.0
			finished.emit(SHAKE)
	pass

func physics_update(_delta: float):
	chase_component.chasing()
	dir_comp.check_dir()
	pass

func exit():
	timer.stop()
	pass

func find_new_target():
	bulborb.target = closest_target.get_closest_target()
	pass
