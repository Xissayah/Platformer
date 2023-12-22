extends Area2D

func _ready():
	pass
	
func _process(delta):
	pass

func _onBodyEntered(body):
	get_tree().change_scene_to_file("res://GameOver.tscn")
