class_name PelletPosyDefinition extends EnemyDefinition
enum PelletColor {
	RED,
	YELLOW,
	BLUE
}

@export var color : PelletColor

func handle_enemy(_entity: Node):
	_entity.color = color
	_entity.ready_self()
	pass
