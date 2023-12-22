extends Area2D

@onready var player = $Player
#var level = player.level

var FLAG = false

func _onEndDoorAreaEntered(area):
	if FLAG == true:
		get_tree().change_scene_to_file("res://Level2.tscn")
		#level += 1
	else:
		get_tree().change_scene_to_file("res://youWin.tscn")
