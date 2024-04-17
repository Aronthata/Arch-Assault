extends Control
class_name GUIParent
# Define variables
@onready var background: TextureRect = $TextureRect
var Speed = 20
var DIR = Vector2.RIGHT
var New_Pos = Vector2.ZERO
@onready var label: Label = $AspectRatioContainer/MarginContainer/CenterContainer/MainBox/Label
var FontBasedNodes: Array[Control]
var FontSizeArray: Array[float]
func _ready():
	for I: Node in Extend.get_all_Children(self):
		if I is Control:
			if I is Label or I is BaseButton or I is LineEdit:
				FontBasedNodes.append(I)
	for I in FontBasedNodes:
		FontSizeArray.append(I["theme_override_font_sizes/font_size"])
	get_tree().get_root().size_changed.connect(FontWork)
	FontResize(FontBasedNodes, FontSizeArray)
func FontWork():
	FontResize(FontBasedNodes, FontSizeArray)
func FontResize(Nodes: Array[Control], FontSizes: Array):
	if ProjectSettings.get_setting("global/text_Resize") != 0:
		var viewportSize = get_viewport().size
		var newSize = Vector2(1600, 900)
		for I in Nodes.size():
			if Nodes[I] is Label or Nodes[I] is BaseButton or Nodes[I] is LineEdit:
				var originalFontSize = FontSizes[I]
				var Formula: float
				if ProjectSettings.get_setting("global/text_Resize") == 1:
					Formula = viewportSize.x/newSize.x
				elif ProjectSettings.get_setting("global/text_Resize") == 2:
					Formula = viewportSize.y/newSize.y
				elif ProjectSettings.get_setting("global/text_Resize") == 3:
					if viewportSize.x <= viewportSize.y:
						Formula = viewportSize.x/newSize.x
					else:
						viewportSize.y/newSize.y
				Nodes[I]["theme_override_font_sizes/font_size"] = Formula * originalFontSize
