extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	MusicaMenu.stop()
	KakaricoMusica.stop()
	MusicaMenu.play()

# Called every frame. 'delta' is the elapsed time since the previous frame.




func _on_retry_pressed():
	get_tree().change_scene_to_file("res://Scenes/house.tscn")
