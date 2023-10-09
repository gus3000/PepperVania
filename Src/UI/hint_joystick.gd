extends Control

@export var joystick_image: Control

@export var joy_image_scale: float = 50

var time = 0


func _process(delta: float):
	time += delta
	set_input_vector(Input.get_vector("left", "right", "up", "down"))


func set_input_vector(v: Vector2):
	assert(v.x >= -1 and v.x <= 1)
	assert(v.y >= -1 and v.y <= 1)
	joystick_image.position.x = (v.x + 1) * 32
	joystick_image.position.y = (v.y + 1) * 32
	
