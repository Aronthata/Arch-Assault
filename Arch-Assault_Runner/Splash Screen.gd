extends Control
var FileRun: String = "Game.exe"
var Folder: String = "Game"

func RunGame():
	print(OS.get_executable_path())
	print(OS.get_executable_path().get_base_dir()+"/"+Folder+"/"+FileRun)
	OS.execute(OS.get_executable_path().get_base_dir()+"/"+Folder+"/"+FileRun, [])
	get_tree().quit()
