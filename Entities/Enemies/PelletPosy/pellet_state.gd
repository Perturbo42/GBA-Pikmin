class_name PelletState extends State
const YES = "YesPellet"
const NO = "NoPellet"

var pelletPosy: PelletPosy

func _ready() -> void:
	await owner.ready
	pelletPosy = owner
