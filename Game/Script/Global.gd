extends Node
var Config: ConfigFile


func _ready():
	Config = ConfigFile.new()
	Config.load("user://"+"Arch_Run"+"/"+"Settings.cfg")
	if Config == null:
		Config = ConfigFile.new()
		DirAccess.make_dir_absolute("user://"+"Arch_Run")
		Apply_Settings()
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
