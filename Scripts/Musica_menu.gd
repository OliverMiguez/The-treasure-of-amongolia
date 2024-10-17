extends AudioStreamPlayer2D



#Inicia la musica
func _ready():
	play()
#para que se reinicie si no suena o se acaba
func play_music():
	if not is_playing():
		play()

#para la musica  
func stop_music():
	if is_playing():
		stop()
