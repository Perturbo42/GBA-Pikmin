class_name PelletState extends State
const YES = "YesPellet"
const NO = "NoPellet"

var pellet: PelletPosy

func _ready() -> void:
	await owner.ready
	pellet = owner
