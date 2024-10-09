extends Node2D

func _ready():
	GlobalMusic.stop()
	KakaricoMusica.stop()
	MusicaMenu.stop()
	$AudioStreamPlayer2D.play()
	if global.nueva_posicion != Vector2():
		position = global.nueva_posicion
		global.nueva_posicion = Vector2()



func _process(delta):
	change_scene_casa1_pueblo()



#salir casa1
func _on_salir_casa_body_entered(body):
	if body.has_method("player"):
		global.transicion_casa1_salir = true


func _on_salir_casa_body_exited(body):
	if body.has_method("player"):
		global.transicion_casa1_salir = false


func change_scene_casa1_pueblo():
	if global.transicion_casa1_salir == true :
		if global.current_scene_casa1_salir == "casa1":
			global.nueva_posicion = Vector2(-122,234)#para que cuando vuelva al cliff cambie  de pos
			get_tree().change_scene_to_file("res://Scenes/pueblo.tscn")
			global.finish_changescene_casa1_salir()
