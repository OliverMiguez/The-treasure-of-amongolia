extends AudioStreamPlayer

#inicia la musica
func _ready():
	play()
#mantiene la musica encendida
func play_music():
	if not is_playing():
		play()

#para la musica cuando estea sonando
func stop_music():
	if is_playing():
		stop()
