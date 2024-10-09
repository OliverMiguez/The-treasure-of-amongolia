class_name Transicion
extends CanvasLayer

@onready var anim = $AnimationPlayer

func _ready():
	layer = -1 
	# layer es para poner el canvaslayer detras del juego
	get_node("AnimationPlayer").play("trans")


func change_scene(path : String) -> void:
	layer  =  1 # para poner el canva delante del juego
	anim.play("trans")
	await ($AnimationPlayer.animation_finished)
	#cambiar la escena
	get_tree().change_scene_to_file(path)
	anim.play_backwards("trans")
	await ($AnimationPlayer.animation_finished)
	layer = -1
