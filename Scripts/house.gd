
extends Node2D

func _ready():
	$AudioStreamPlayer2D.play()
	GlobalMusic.stop()
	MusicaMenu.stop()

func _process(_delta):
	change_scene_house()

#transicion de house a world
func _on_salir_casa_body_entered(body):
	if body.has_method("player"):
		global.transition_scene_house = true


func _on_salir_casa_body_exited(body):
	if body.has_method("player"):
		global.transition_scene_house = false

func change_scene_house():
	if global.transition_scene_house == true :
		if global.current_scene == "world":
			get_tree().change_scene_to_file("res://Scenes/world ida.tscn")
			global.finish_changescenes_house()
