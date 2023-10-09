extends Interactable

@export var loot: String

@onready var animator: AnimationPlayer = $chest/AnimationPlayer

var _is_open: bool = false


func _ready():
	pass


func interact(other: Node):
	if not _is_open:
		open()


func open():
	_is_open = true
	animator.play("Open")

