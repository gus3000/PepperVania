extends PlayerState


func enter(_msg := {}) -> void:
	print("enter idle")
	player.velocity = Vector3.ZERO

	animator["parameters/conditions/idle"] = true


func update(_delta: float) -> void:
	# if Input.is_action_just_pressed("jump"):
	# 	state_machine.transition_to("Air", {do_jump = true})
	# elif not player.is_on_floor():
	# 	state_machine.transition_to("Air")
	# elif not input_vector_raw.is_zero_approx():
	# 	state_machine.transition_to("Run")
	default_transitions(["Air", "Dash", "Run"])


func exit() -> void:
	animator["parameters/conditions/idle"] = false
