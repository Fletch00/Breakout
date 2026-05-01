extends Node2D

@export var ID = "b1"

func _process(_delta):
	

	if $BlockCounter.get_child_count() == 0:
		get_tree().change_scene_to_file("res://win_menu.tscn")
		if ID not in Save.winLvl:
			Save.saveGame(ID)
