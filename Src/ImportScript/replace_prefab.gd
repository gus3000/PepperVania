@tool
extends EditorScenePostImport

var regex: RegEx
var prefabs: Dictionary
var root_node: Node3D


func _post_import(scene):
	assert(scene is Node3D)

	print("------------------- attempting to import prefabs in scene %s -------------------" % scene.name)

	regex = RegEx.new()
	regex.compile("(?<prefab_name>.*)-prefab")

	load_prefabs()

	root_node = scene
	replace_prefab_rec(scene)
	return scene


func load_prefabs():
	prefabs = {"chest": load("res://Prefab/Interactable/chest.tscn")}


func replace_prefab_rec(node):
	if node == null:
		return
	print(node.name)
	var res: RegExMatch = regex.search(node.name)
	if res:
		var prefab_name = res.get_string("prefab_name")
		print(node, " -> ", prefab_name)
		assert(
			prefab_name in prefabs,
			(
				"prefab '%s' not in available prefabs ! check the script for the list of available prefabs."
				% prefab_name
			)
		)

		var pref = prefabs[prefab_name].instantiate()
		print("replaced by : ", pref)
		node.add_child(pref)
		pref.set_owner(root_node)
		return

	for child in node.get_children():
		replace_prefab_rec(child)
