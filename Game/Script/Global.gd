extends Node
var Config = ConfigFile.new()


func _ready():
	DirAccess.make_dir_absolute("user://"+"Arch_Run")
	var err = Config.load("user://scores.cfg")
	if err != OK:
		Config = ConfigFile.new()
		Apply_Settings(1)
	else:
		Set_Settings()
func Set_Settings():
	if ProjectSettings.has_setting("global/text_Resize"): 
		ProjectSettings.set_setting("global/text_Resize", Config.get_value("global", "text_resize"))
	else: print_debug("SETTING_ERR_1")
func Apply_Settings(TextResize = null):
	if TextResize != null: Config.set_value("global", "text_resize", TextResize)
	Config.save("user://"+"Arch_Run"+"/"+"Settings.cfg")
	Set_Settings()
