extends Node
@onready var root = get_tree().get_root()
@onready var current_scene = root.get_child(root.get_child_count()-1)

func TF_to_INT(TF: bool) -> int:
	if TF: return 1
	else: return -1

func change_scene(path: String) -> void:
	current_scene.queue_free()
	var new_scene = ResourceLoader.load(path)
	current_scene = new_scene.instantiate()
	get_tree().get_root().add_child(current_scene)
	get_tree().set_current_scene(current_scene)
	

func FontResize(Nodes: Array[Control], FontSizes: Array):
	var viewportSize = get_viewport().size
	var newSize = Vector2(1600, 900)
	for I in Nodes.size():
		if Nodes[I] is Label or Nodes[I] is BaseButton or Nodes[I] is LineEdit:
			var originalFontSize = FontSizes[I]
			var newFontSize = (viewportSize.x/newSize.x) * originalFontSize
			Nodes[I]["theme_override_font_sizes/font_size"] = newFontSize


func get_all_Children(root_node):
	var nodes = []
	for node in root_node.get_children():
		nodes.append(node)
		if node.get_child_count() > 0:
			nodes += get_all_Children(node)
	return nodes
