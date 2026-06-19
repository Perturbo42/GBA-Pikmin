class_name OlimarState extends State
const IDLE = "Idle"
const MOVING = "Moving"

var olimar: Olimar

func _ready() -> void:
	await owner.ready
	olimar = owner
