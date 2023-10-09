extends PlayerState


func enter(_msg := {}) -> void:
	print("enter air")


func physics_update(delta: float) -> void:
	default_movement(delta)
	player.move_and_slide()
	# if player.is_on_floor():
	# 	if is_input_zero():
	# 		state_machine.transition_to("Idle")
	# 	else:
	# 		state_machine.transition_to("Run")
	default_transitions(["Idle", "Dash", "Run"])
