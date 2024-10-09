
extends Node2D






func _ready():
	 #ojo revisar la musica cuando regresamos del cliff_side al world
	MusicaMenu.stop()
	if not GlobalMusic.playing:
		GlobalMusic.play()
	
	
func _process(_delta):
	change_scene()
	change_scene_into_house()

	#transicion de world a cliff_side
func _on_cliffside_transition_point_body_entered(body):
	if body.has_method("player"):
		global.transition_scene = true


func _on_cliffside_transition_point_body_exited(body):
	if body.has_method("player"):
		global.transition_scene = false
		
func change_scene():
	if global.transition_scene == true :
		if global.current_scene == "world":
			get_tree().change_scene_to_file("res://Scenes/cliff_side.tscn")
			global.finish_changescenes()




#transicion de world a  house (ida)

func _on_house_trasition_entrar_body_entered(body):
	if body.has_method("player"):
		global.transition_scene_house = true


func _on_house_trasition_entrar_body_exited(body):
	if body.has_method("player"):
		global.transition_scene_house = false
		
func change_scene_into_house():
	if global.transition_scene_house == true:
		if global.current_scene == "world":
			global.nueva_posicion = Vector2(104,272)
			get_tree().change_scene_to_file("res://Scenes/house.tscn")
			global.finish_changescenes_house()





