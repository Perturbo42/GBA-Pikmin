class_name BulborbState extends State
const IDLE = "Idle"
const CHASE = "Chase"
const BITE = "Bite"
const SHAKE = "Shake"
const RETURN = "Return"
const DEAD = "Dead"

var bulborb: Bulborb
@export var can_detect: bool
@export var can_stop_detecting: bool

func _ready() -> void:
	await owner.ready
	bulborb = owner
