class_name Pepper
extends CharacterBody3D

@export var point_to_follow: Node3D


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

@onready var point_to_follow_origin = point_to_follow.position


func _ready():
	update_camera()
	pass

func _process(delta):
	update_camera()

func add_interact_target(target: Interactable):
	interact_targets.append(target)
	# update_camera()


func remove_interact_target(target: Interactable):
	interact_targets.erase(target)
	# update_camera()


func update_camera():
	# print("targets : ", interact_targets)
	if interact_target:
		# print("following ", interact_target)
		point_to_follow.global_position = interact_target.global_position
	else:
		# print("following self")
		point_to_follow.position = point_to_follow_origin
	# print("point to follow : ", point_to_follow.position, point_to_follow.global_position)
	
