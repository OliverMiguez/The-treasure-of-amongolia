extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	GlobalMusic.stop()
	KakaricoMusica.stop()




func _on_play_pressed():
	get_tree().change_scene_to_file("res://Scenes/house.tscn")


func _on_exit_pressed():
	get_tree().quit()


func _on_tutorial_pressed():
		get_tree().change_scene_to_file("res://Scenes/tutorial.tscn")
