extends PlayerState

var timer: Timer


func enter(_msg := {}) -> void:
	print("enter dash")
	animator["parameters/conditions/dash"] = true
	animator["parameters/Dash/conditions/end_dash"] = false
	timer = Timer.new()
	timer.connect("timeout", finish_dash)
	timer.wait_time = player.dash_distance / player.dash_speed
	timer.one_shot = true
	add_child(timer)
	timer.start()


func physics_update(_delta):
	player.velocity = player.basis.z * player.dash_speed
	player.move_and_slide()


func finish_dash():
	state_machine.transition_to("Idle")
	animator["parameters/conditions/dash"] = false
	animator["parameters/Dash/conditions/end_dash"] = true
