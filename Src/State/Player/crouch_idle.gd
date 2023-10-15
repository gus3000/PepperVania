extends PlayerState

func enter(msg := {}):
	print("enter Crouch_Idle")


func update(delta):
	default_transitions(["Air", "Dash", "Idle", "Crouch_Walk"])
