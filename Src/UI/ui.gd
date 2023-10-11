extends Node

@export var ui_controller:UiController

func _process(_delta):
	var input = Input.get_vector("left", "right", "up", "down")
	ui_controller.set_joystick_position(UiController.JoystickSide.Left,input)

	var camera_input = Input.get_vector("camera_left", "camera_right", "camera_up", "camera_down")
	ui_controller.set_joystick_position(UiController.JoystickSide.Right, camera_input)

