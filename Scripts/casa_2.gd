extends Node2D

func _ready():
	GlobalMusic.stop()
	KakaricoMusica.stop()
	MusicaMenu.stop()
	$AudioStreamPlayer2D.play()
	
	
	
	if global.nueva_posicion != Vector2():
		position = global.nueva_posicion
		global.nueva_posicion = Vector2()

	
func _process(_delta):
	change_scene_casa2_salir()
func _on_salir_casa_2_body_entered(body):
	if body.has_method("player"):
		global.transicion_casa2_salir = true


func _on_salir_casa_2_body_exited(body):
	if body.has_method("player"):
		global.transicion_casa2_salir = false


func change_scene_casa2_salir():
	if global.transicion_casa2_salir == true :
		if global.current_scene_casa2_salir == "casa2":
			global.nueva_posicion = Vector2(22,227)
			get_tree().change_scene_to_file("res://Scenes/pueblo.tscn")
			global.finish_changescene_casa2_salir()
