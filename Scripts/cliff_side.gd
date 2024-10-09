

extends Node2D
@onready var label = $no_atras2

func _ready():
	label.visible = false
	MusicaMenu.stop()
	KakaricoMusica.stop()
	
	if not GlobalMusic.playing:
		GlobalMusic.play()
	
func _process(delta):
	#change_scene()
	change_scene_pueblo()
	change_scene_cliff_world()
##transicion de cliff_side a world
#func _on_world_transition_body_entered(body):
	#if body.has_method("player"):
		#global.transition_scene = true
#
#
#func _on_world_transition_body_exited(body):
	#if body.has_method("player"):
		#global.transition_scene = false
	#
	#
#func change_scene():
	#if global.transition_scene == true :
		#if global.current_scene == "world":
			#get_tree().change_scene_to_file("res://Scenes/world_vuelta.tscn")
			#global.finish_changescenes()

#no volver a casa
func _on_no_atras_body_entered(body):
	if body.is_in_group("player"):
		label.visible = true


func _on_no_atras_body_exited(body):
	if body.is_in_group("player"):
		label.visible = false



#pueblo transicion
func _on_pueblo_transition_body_entered(body):
	if body.has_method("player"):
		global.transition_pueblo = true


func _on_pueblo_transition_body_exited(body):
	if body.has_method("player"):
		global.transition_pueblo = false
		
func change_scene_pueblo():
	if global.transition_pueblo == true :
		if global.current_scene_cliff == "cliff_pueblo":
			get_tree().change_scene_to_file("res://Scenes/pueblo.tscn")
			global.finish_changescene_pueblo()


#cliff  a world 


func _on_cliff_world_body_entered(body):
	if body.is_in_group("player"):
		global.transition_cliff_world = true


func _on_cliff_world_body_exited(body):
	if body.is_in_group("player"):
		global.transition_cliff_world = false

func change_scene_cliff_world():
	if global.transition_cliff_world == true:
		if global.current_scene_cliff_world == "cliff_side":
			global.nueva_posicion = Vector2(380,200)
			#global.nueva_posicion_guardian = Vector2(-200,-200)
			get_tree().change_scene_to_file("res://Scenes/world ida.tscn")
			global.finish_changescene_cliff_world()
