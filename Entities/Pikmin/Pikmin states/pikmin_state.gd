class_name PikminState extends State
const IDLE = "Idle"
const FOLLOW = "Follow"
const MOVING = "Moving"
const CARRY = "Carry"
const THROWN = "Thrown"
const ATTACHED = "Attached"

var pikmin = Pikmin

func _ready() -> void:
	await owner.ready
	pikmin = owner
