class_name PelletPosyDefinition extends EnemyDefinition
enum PelletColor {
	RED,
	YELLOW,
	BLUE
}
enum Direction{
	LEFT,
	RIGHT
}

@export var color : PelletColor
@export var dir : Direction

func handle_enemy(_entity: Node):
	_entity.color = color
	_entity.dir = 1 if dir == Direction.LEFT else -1
	_entity.ready_self()
	pass
