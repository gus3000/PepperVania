class_name UiController
extends Control

@export var joystick_left: Control
@export var joystick_right: Control
@export var button_interact: ControllerButton
@export var button_dash: ControllerButton

@export var joystick_movement_scale: float = 15

@onready var joystick_left_original_position = joystick_left.position
@onready var joystick_right_original_position = joystick_right.position


func set_controller_state(state: ControllerState):
	set_joystick_position(JoystickSide.Left, state.joystick_left)
	set_joystick_position(JoystickSide.Right, state.joystick_right)
	button_interact.switch(state.interact)
	button_dash.switch(state.dash)


## new_position shoud be a vector with values between -1 and 1 (inclusive)
func set_joystick_position(side: JoystickSide, new_position: Vector2):
	if side == JoystickSide.Left:
		joystick_left.position = (
			joystick_left_original_position + new_position * joystick_movement_scale
		)
	else:
		joystick_right.position = (
			joystick_right_original_position + new_position * joystick_movement_scale
		)
	pass


enum JoystickSide { Left, Right }


class ControllerState:
	var joystick_left: Vector2
	var joystick_right: Vector2
	var interact: bool
	var dash: bool
