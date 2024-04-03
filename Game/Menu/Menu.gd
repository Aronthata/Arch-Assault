extends AspectRatioContainer
func _on_audio_stream_player_finished():
	$"../BackgroundSFX/AudioStreamPlayer".playing = true



func _on_quit_pressed():
	get_tree().quit()


func _on_multiplayer_pressed():
	get_tree().change_scene_to_file("res://MultiPlayer.tscn")
