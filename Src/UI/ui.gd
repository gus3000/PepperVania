extends Node

@export var ui_controller:UiController
@export var fps_counter:Label

func _process(_delta):
	var controller_state = UiController.ControllerState.new()
	controller_state.joystick_left = Input.get_vector("left", "right", "up", "down")
	controller_state.joystick_right = Input.get_vector("camera_left", "camera_right", "camera_up", "camera_down")
	controller_state.interact = Input.is_action_pressed("interact")
	controller_state.dash = Input.is_action_pressed("dash")
	
	# ui_controller.set_joystick_position(UiController.JoystickSide.Right, camera_input)

	ui_controller.set_controller_state(controller_state)

	fps_counter.text = str(Engine.get_frames_per_second())
