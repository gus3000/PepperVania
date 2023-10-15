extends PlayerState

func enter(_msg := {}):
	print("enter Crouch_Walk")

func update(delta):
	default_movement(delta, player.crouch_speed)
	default_transitions(["Crouch_Idle", "Run"])
