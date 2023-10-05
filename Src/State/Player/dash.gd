extends PlayerState

var timer:Timer

func enter(_msg := {}) -> void:
	print("enter dash")
	timer = Timer.new()
	timer.connect("timeout", finish_dash)
	timer.wait_time = player.dash_distance / player.dash_speed
	timer.one_shot = true
	add_child(timer)
	timer.start()

func physics_update(delta):
	player.velocity = player.basis.z * player.dash_speed
	player.move_and_slide()
	

func finish_dash():
	state_machine.transition_to("Idle")

