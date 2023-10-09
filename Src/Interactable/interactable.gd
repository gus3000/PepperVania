class_name Interactable
extends Node3D

signal can_interact


func _process(_delta: float):
	pass


func interact(_other: Node):
	assert(
		false,
		(
			"Node %s : Using base interactable is forbidden, you should extend this class and override _interact()"
			% name
		)
	)


func _on_trigger_area_entered(area: Area3D):
	var trigger_owner = area.get_owner()
	assert(
		trigger_owner is Pepper,
		"%s collides with %s who is not a player" % [name, trigger_owner.name]
	)

	trigger_owner.add_interact_target(self)


func _on_trigger_area_exited(area):
	var trigger_owner = area.get_owner()
	assert(
		trigger_owner is Pepper,
		"%s ends collision with %s who is not a player" % [name, trigger_owner.name]
	)

	trigger_owner.remove_interact_target(self)
