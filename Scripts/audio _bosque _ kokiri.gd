extends AudioStreamPlayer


func _ready():
	play()

func play_music():
	if not is_playing():
		play()


func stop_music():
	if is_playing():
		stop()
