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
	Extend.FontResize(FontBasedNodes, FontSizeArray)
func FontWork():
	Extend.FontResize(FontBasedNodes, FontSizeArray)


