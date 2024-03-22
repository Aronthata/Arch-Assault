extends Node



func _ready():
	Set_Get_Settings()
func Set_Get_Settings():
	var Config:ConfigFile = ConfigFile.new()
	Config.load("user://"+"Arch_Run"+"/"+"Settings.cfg")
	print("user://"+"Arch_Run"+"/"+"Settings.cfg")
	if Config == null:
		Config = ConfigFile.new()
		Config.set_value("Global", "text_Resize", ProjectSettings.get_setting("global/text_Resize"))
	else:
		ProjectSettings.set_setting("global/text_Resize", Config.get_value("Global", "text_Resize"))
	DirAccess.make_dir_absolute("user://"+"Arch_Run")
	Config.save("user://"+"Arch_Run"+"/"+"Settings.cfg")
