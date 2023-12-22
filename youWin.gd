extends Control

func _OnRestartButtonPressed():
	get_tree().change_scene_to_file("res://Level1.tscn")

func _OnExitButtonPressed():
	get_tree().quit()

func _process(delta):
	if Input.is_action_just_pressed("restart"):
		get_tree().change_scene_to_file("res://Level1.tscn")
	
	if Input.is_action_just_pressed("exit"):
		get_tree().quit()
