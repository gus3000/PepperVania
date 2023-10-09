class_name Pepper
extends CharacterBody3D

@export var camera: IsoFollow
@export var speed: float = 5
@export var rotation_speed: float = 10
@export var gravity: float = 10
#@export var jump_impulse: float = 5
@export var dash_distance: float = 3
@export var dash_speed: float = 10

@onready var animator: AnimationTree = $AnimationTree

func _ready():
	print("animator : ", animator)
