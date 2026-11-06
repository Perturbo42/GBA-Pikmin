extends Node
signal took_damage(damage: int)
var health: int:
	set(value):
		health = clamp(value, 0, 10)
		emit_signal("took_damage", health)

func take_damage(damage: int):
	health -= damage
