extends Node

@export var movement_joy:Control

func _process(_delta):
	var input = Input.get_vector("left", "right", "up", "down")

