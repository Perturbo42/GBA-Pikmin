class_name DirectionComponent extends Node
@export_category("External Property")
@export var body: CharacterBody2D
@export var sprite: Sprite2D

var move_dir: Vector2
var vertical_dir: int = 1
var horizontal_dir: int = 1


func check_dir():
	if body.velocity != Vector2.ZERO:
		move_dir = body.velocity.normalized()
		
		horizontal_dir = 1 if move_dir.x >= 0 else -1
		vertical_dir = 1 if move_dir.y >= 0 else -1
		
		sprite_dir()

func sprite_dir():
	sprite.flip_h = false if horizontal_dir == 1 else true
