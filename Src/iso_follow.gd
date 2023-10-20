class_name IsoFollow
extends Camera3D

const CAMERA_ANGLE: float = -30
const DISTANCE_FROM_PLAYER: float = 10

@export var player: Pepper

@export var direction: IsoDirection = IsoDirection.BackwardsLeft
@export var follow_speed = 2
@export var dead_zone: float = 1
@export var focus_strength: float = 0.5

@onready var point_to_follow: Node3D = player.base_point_to_follow


var _delta_vector: Vector3


func _ready():
	assert(
		direction == IsoDirection.BackwardsLeft,
		(
			"The only supported Camera direction is IsoDirection.BackwardsLeft (%d), but is %d"
			% [IsoDirection.BackwardsLeft, direction]
		)
	)
	_delta_vector = global_position - point_to_follow.global_position
	transform.basis = Basis()

	rotate_object_local(Vector3.UP, deg_to_rad(int(-135)))
	rotate_object_local(Vector3.RIGHT, deg_to_rad(CAMERA_ANGLE))
	# rotate_x(deg_to_rad(CAMERA_ANGLE))


func _process(delta):
	var focus_point = point_to_follow.global_position.lerp(player.base_point_to_follow.global_position, focus_strength)
	var exact_goal = focus_point + _delta_vector
	var distance_to_delta = global_position.distance_to(exact_goal)
	if distance_to_delta > dead_zone:
		var delta_vector = exact_goal - global_position
		var lazy_goal = global_position + delta_vector * (distance_to_delta - dead_zone)
		var blend = pow(0.5,delta * follow_speed)
		global_position = lazy_goal.lerp(global_position, blend)


enum IsoDirection {BackwardsLeft = -135, BackwardsRight = 135, ForwardLeft = -45, ForwardRight = 45}


func _on_player_update_point_to_follow(new_point:Node3D):
	point_to_follow = new_point
