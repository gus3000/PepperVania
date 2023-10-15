extends PlayerState


func enter(_msg := {}) -> void:
	print("enter idle")
	player.velocity = Vector3.ZERO

	animator["parameters/conditions/idle"] = true


func update(_delta: float) -> void:
	default_interact()
	default_transitions(["Air", "Dash", "Run", "Crouch_Idle"])


func exit() -> void:
	animator["parameters/conditions/idle"] = false
