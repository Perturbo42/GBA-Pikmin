class_name BulborbState extends State
const IDLE = "Idle"
const CHASE = "Chase"
const BITE = "Bite"
const SHAKE = "Shake"

var bulborb

func _ready() -> void:
	await owner.ready
	bulborb = owner
