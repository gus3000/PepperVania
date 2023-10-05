extends PlayerState


func enter(_msg := {}) -> void:
	print("enter idle")
	print(player.animator)
	player.velocity = Vector3.ZERO

	animator["parameters/conditions/idle"] = true


func update(_delta: float) -> void:
	if not player.is_on_floor():
		# we fell
		state_machine.transition_to("Air")

	if Input.is_action_just_pressed("jump"):
		# we jump
		state_machine.transition_to("Air", {do_jump = true})
	elif not input_vector_raw.is_zero_approx():
		state_machine.transition_to("Run")


func exit() -> void:
	animator["parameters/conditions/idle"] = false
