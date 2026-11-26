class_name Overworld extends Node2D
@onready var level_1: OverworldLevelNode = %Level1
@onready var level_2: OverworldLevelNode = %Level2
@onready var level_3: OverworldLevelNode = %Level3
@onready var level_4: OverworldLevelNode = %Level4
@onready var ship: ShipOverworld = %"Ship-Overworld"

var level_arr: Array[OverworldLevelNode] = [level_1, level_2, level_3, level_4]

var curr_node: OverworldLevelNode

func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("Up"):
		if curr_node.up.is_active and curr_node.up != curr_node:
			move_to(curr_node.up)
	elif event.is_action_pressed("Down"):
		if curr_node.down.is_active and curr_node.down != curr_node:
			move_to(curr_node.down)
	elif event.is_action_pressed("Left"):
		if curr_node.left.is_active and curr_node.left != curr_node:
			move_to(curr_node.left)
	elif event.is_action_pressed("Right"):
		if curr_node.right.is_active and curr_node.right != curr_node:
			move_to(curr_node.right)
		

func move_to(dest_node: OverworldLevelNode):
	
	pass
