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
		return (
			(get_viewport().get_camera_3d().basis * Vector3(input_dir.x, 0, input_dir.y))
			# . rotated(Vector3.UP, -PI / 2)
			# . normalized()
		)


func default_movement(delta) -> void:
	default_rotation(delta)
	var dir = direction
	if dir:
		player.velocity.x = dir.x * player.speed
		player.velocity.z = dir.z * player.speed
	else:
		player.velocity.x = move_toward(player.velocity.x, 0, player.speed)
		player.velocity.z = move_toward(player.velocity.z, 0, player.speed)

	player.velocity.y -= player.gravity * delta


func default_rotation(delta) -> void:
	var from = player.basis.z
	var to = Vector3(direction.x, 0, direction.z)
	var angle = from.signed_angle_to(to, Vector3.UP)
	player.rotate_y(angle * player.rotation_speed * delta)


func is_input_zero() -> bool:
	return input_vector_raw.is_equal_approx(Vector2.ZERO)
