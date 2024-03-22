extends Control
@onready var Text_Resize: OptionButton = $AspectRatioContainer/AspectRatioContainer/PanelContainer/VBoxContainer/ScrollContainer/VBoxContainer/HBoxContainer/OptionButton

# Called when the node enters the scene tree for the first time.
func _ready():
	_on_exit_pressed()



func _on_settings_pressed():
	Text_Resize.selected = ProjectSettings.get_setting("global/text_Resize")
	$"..".visible = true
	$".".visible = true


func _on_apply_pressed():
	Global.Apply_Settings(Text_Resize.selected)
	get_tree().get_root().size_changed.emit()


func _on_exit_pressed():
	$"..".visible = false
	$".".visible = false
