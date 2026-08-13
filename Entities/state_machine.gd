class_name StateMachine extends Node2D
var curr_state: State

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	await owner.ready
	for states in get_children():
		states.finished.connect(change_state)
	var initial_state = get_child(0)
	curr_state = initial_state
	curr_state.enter()
	pass # Replace with function body.

func _unhandled_input(event: InputEvent) -> void:
	curr_state.handle_input(event)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	curr_state.update(delta)

func _physics_process(delta: float) -> void:
	curr_state.physics_update(delta)

func change_state(next_state: String):
	curr_state.exit()
	curr_state = get_node(next_state)
	curr_state.enter()
