class_name PikminGroup extends Node

var pikmin_arr: Array[Pikmin] = []

func add_pikmin(p: Pikmin):
	pikmin_arr.append(p)

func remove_pikmin(p: Pikmin):
	pikmin_arr.erase(p)
