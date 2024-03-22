extends AspectRatioContainer
func _on_audio_stream_player_finished():
	$"../BackgroundSFX/AudioStreamPlayer".playing = true



func _on_quit_pressed():
	get_tree().quit()
