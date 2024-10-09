extends Node2D

@onready var label = $cartel2
@onready var label2 = $no_back2
func _ready():
	MusicaMenu.stop()
	GlobalMusic.stop()
	KakaricoMusica.play()
	label.visible = false
	label2.visible = false
	
	
	if global.nueva_posicion != Vector2():
		position = global.nueva_posicion
		global.nueva_posicion = Vector2() 
	
func _process(delta):
	change_scene_pueblo_cliff()
	change_scene_casa1()
	change_scene_casa2()
#texto cartel
func _on_cartel_body_entered(body):
	if body.is_in_group("player"):
		label.visible = true


func _on_cartel_body_exited(body):
	if body.is_in_group("player"):
		label.visible = false


#no_back

func _on_no_back_body_entered(body):
	if body.is_in_group("player"):
		label2.visible = true


func _on_no_back_body_exited(body):
	if body.is_in_group("player"):
		label2.visible = false


#pueblo_cliff


func _on_pueblo_cliff_body_entered(body):
	if body.is_in_group("player"):
		global.transicion_pueblo_cliff = true
		print("cuerpo entro")


func _on_pueblo_cliff_body_exited(body):
	if body.is_in_group("player"):
		global.transicion_pueblo_cliff = false
		print("cuerpo salio")

func change_scene_pueblo_cliff():
	if global.transicion_pueblo_cliff == true :
		if global.current_scene_pueblo_cliff == "pueblo":
			global.nueva_posicion = Vector2(216,120)#para que cuando vuelva al cliff cambie  de pos
			get_tree().change_scene_to_file("res://Scenes/cliff_side.tscn")
			global.finish_changescene_pueblo_cliff()


#casa 1


func _on_casa_1_body_entered(body):
	if body.has_method("player"):
		global.transicion_casa1 = true


func _on_casa_1_body_exited(body):
	if body.has_method("player"):
		global.transicion_casa1 = false
		
func change_scene_casa1():
	if global.transicion_casa1 == true:
		if global.current_scene_casa1 == "pueblo":
			get_tree().change_scene_to_file("res://Scenes/casa_pueblo_1.tscn")
			global.finish_changescene_casa1()

#entrar casa 2




func _on_casa_2_body_entered(body):
	if body.has_method("player"):
		global.transicion_casa2 = true


func _on_casa_2_body_exited(body):
	if body.has_method("player"):
		global.transicion_casa2 = false

func change_scene_casa2():
	if global.transicion_casa2 == true :
		if global.current_scene_casa2 == "pueblo":
			get_tree().change_scene_to_file("res://Scenes/casa_2.tscn")
			global.finish_changescene_casa2()
		
