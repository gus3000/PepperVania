class_name MachineState
extends Node

var state_machine:StateMachine = null
var subject:Node:
	get:
		return state_machine.subject

func handle_input(_event: InputEvent) -> void:
	pass

func update(_delta: float)->void:
	pass

func physics_update(_delta: float) -> void:
	pass

func enter(_msg:= {}) -> void:
	pass

func exit() -> void:
	pass