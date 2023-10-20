class_name Pepper
extends CharacterBody3D

signal update_point_to_follow(new_point: Node3D)

@export var base_point_to_follow: Node3D

@export var speed: float = 5
@export var rotation_speed: float = 10
@export var gravity: float = 10
#@export var jump_impulse: float = 5
@export var dash_distance: float = 3
@export var dash_speed: float = 10
@export var crouch_speed: float = 3

@onready var animator: AnimationTree = $AnimationTree
@onready var interact_targets: Array[Interactable] = []
@onready var interact_target: Interactable:
	get:
		return interact_targets[0] if interact_targets else null


func _ready():
	pass


func _process(delta):
	pass

func looking_at() -> Node3D:
	if interact_targets:
		return interact_targets[0]
	else:
		return base_point_to_follow

func add_interact_target(target: Interactable):
	interact_targets.append(target)
	update_point_to_follow.emit(interact_targets[0])


func remove_interact_target(target: Interactable):
	interact_targets.erase(target)
	update_point_to_follow.emit(looking_at())


