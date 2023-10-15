class_name PlayerState
extends MachineState

var player: Pepper:
	get:
		return state_machine.subject as Pepper

var animator: AnimationTree:
	get:
		return player.animator

var input_vector_raw: Vector2:
	get:
		return Input.get_vector("left", "right", "up", "down")

var direction: Vector3:
	get:
		var input_dir = input_vector_raw
		return get_viewport().get_camera_3d().basis * Vector3(input_dir.x, 0, input_dir.y)


func default_movement(delta, speed = -1) -> void:
	if speed == -1: speed = player.speed
	default_rotation(delta)
	var dir = direction
	if dir:
		player.velocity.x = dir.x * speed
		player.velocity.z = dir.z * speed
	else:
		player.velocity.x = move_toward(player.velocity.x, 0, speed)
		player.velocity.z = move_toward(player.velocity.z, 0, speed)

	player.velocity.y -= player.gravity * delta


func default_rotation(delta: float) -> void:
	var from = player.basis.z
	var to = Vector3(direction.x, 0, direction.z)
	var angle = from.signed_angle_to(to, Vector3.UP)
	player.rotate_y(angle * player.rotation_speed * delta)


func default_transitions(allowed: Array[String]) -> void:
	var all_transitions = ["Air", "Crouch", "Dash", "Idle", "Run", "Crouch_Idle", "Crouch_Walk"]
	if allowed == null:
		allowed = all_transitions

	if "Dash" in allowed and Input.is_action_just_pressed("dash"):
		return state_machine.transition_to("Dash")

	if "Air" in allowed and not player.is_on_floor():
		return state_machine.transition_to("Air")
	
	if "Crouch_Walk" in allowed and Input.is_action_pressed("crouch") and not is_input_zero():
		return state_machine.transition_to("Crouch_Walk")
	
	if "Run" in allowed and not Input.is_action_pressed("crouch") and not is_input_zero():
		return state_machine.transition_to("Run")

	if "Crouch_Idle" in allowed and Input.is_action_pressed("crouch") and is_input_zero():
		return state_machine.transition_to("Crouch_Idle")
	
	if "Idle" in allowed and not Input.is_action_pressed("crouch") and is_input_zero():
		return state_machine.transition_to("Idle")


func is_input_zero() -> bool:
	return input_vector_raw.is_zero_approx()

func default_interact():
	if player.interact_target == null:
		return
	
	if Input.is_action_just_pressed("interact"):
		print("interact")
		player.interact_target.interact(player)
