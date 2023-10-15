class_name StateMachine
extends Node

signal transitioned(state_name)

@export var subject: Node
@export var state: MachineState


func _ready() -> void:
	for child in get_children():
		assert(is_instance_of(child, MachineState))
		child.state_machine = self


func _unhandled_input(event):
	state.handle_input(event)


func _process(delta: float) -> void:
	state.update(delta)


func _physics_process(delta) -> void:
	state.physics_update(delta)


func transition_to(target_state_name: String, msg: Dictionary = {}) -> void:
	assert(
		has_node(target_state_name), 'tried to transition to unknown state "%s"' % target_state_name
	)
	if state.name == target_state_name:
		push_error("Trying to transition to same state %s" % target_state_name)
		return
	state.exit()
	state = get_node(target_state_name)
	state.enter(msg)
	emit_signal("transitioned", target_state_name)


func _on_pepper_character_ready():
	state.enter()
