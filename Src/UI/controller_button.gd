class_name ControllerButton
extends Control

@export var active:TextureRect
@export var inactive:TextureRect

func _ready():
	switch(false)

func switch(state:bool):
	active.visible = state
	inactive.visible = not state
