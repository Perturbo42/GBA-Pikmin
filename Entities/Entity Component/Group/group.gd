class_name PikminGroup extends Node
signal arr_is_empty
var pikmin_arr: Array[Pikmin] = []

func add_pikmin(p: Pikmin):
	pikmin_arr.append(p)

func remove_pikmin(p: Pikmin):
	pikmin_arr.erase(p)
	if num_of_pikmin() == 0:
		arr_is_empty.emit()

func num_of_pikmin():
	return pikmin_arr.size()
