class_name PikminState extends State
const IDLE = "Idle"
const FOLLOW = "Follow"
const CARRY = "Carry"
const THROWN = "Thrown"

var pikmin = Pikmin

func _ready() -> void:
	await owner.ready
	pikmin = owner
