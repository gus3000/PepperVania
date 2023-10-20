extends Marker3D

@export var point_to_follow:Node3D

func _ready():
	assert(point_to_follow != null)

func _process(_d):
	global_position = point_to_follow.global_position

func _on_player_update_point_to_follow(new_point:Node3D):
	point_to_follow = new_point
