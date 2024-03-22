extends AspectRatioContainer
func _on_audio_stream_player_finished():
	$"../AudioStreamPlayer".playing = true
