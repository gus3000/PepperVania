extends PlayerState


func enter(_msg := {}) -> void:
	print("enter run")
	animator["parameters/conditions/moving"] = true


func physics_update(delta: float) -> void:
	if not player.is_on_floor():
		state_machine.transition_to("Air")
		return

	default_movement(delta)
	player.move_and_slide()

	var movement_intensity = direction.length()
	animator["parameters/Move/walk_run/blend_amount"] = movement_intensity
	if movement_intensity < 0.5:
		animator["parameters/Move/walk_scale/scale"] = movement_intensity * 2
	else:
		animator["parameters/Move/walk_scale/scale"] = 1

	default_transitions(["Air", "Dash", "Idle"])
	# if Input.is_action_just_pressed("jump"):
	# 	state_machine.transition_to("Air", {do_jump=true})
	# elif is_input_zero():
	# 	state_machine.transition_to("Idle")


func exit() -> void:
	animator["parameters/conditions/moving"] = false
