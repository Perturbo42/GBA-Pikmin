class_name PikminHitbox extends Area2D
@export_category("External Properties")
@export var pikmin: Pikmin
@export var state_machine: StateMachine
@export var thrown_state: State
@export var attached_state: State

func _ready() -> void:
	set_deferred("monitoring", false)

func _on_area_entered(area: Area2D) -> void:
	if state_machine.curr_state != thrown_state:
		return
	
	if area is EnemyHurtbox:
		pikmin.attached_hurtbox = area
		PikminRegistry.add_pikmin_to_group(pikmin, area.group)
		state_machine.change_state(attached_state.name)
	pass # Replace with function body.
