extends PlayerState


func enter(msg := {}) -> void:
	print("enter air")
	if msg.has("do_jump"):
		player.velocity.y = player.jump_impulse

func physics_update(delta: float)->void:
	default_movement(delta)
	player.move_and_slide()
	if player.is_on_floor():
		if is_input_zero():
			state_machine.transition_to("Idle")
		else:
			state_machine.transition_to("Run")
