extends Control

var myLvl



func _ready() -> void:
	Save.loadSave()
	print(str(Save.winLvl))
	var b1 = $HBoxContainer/b1
	var b2 = $HBoxContainer/b2
	var b3 = $HBoxContainer/b3
	
	for button in [b1, b2, b3]:
		if button.name in Save.winLvl:
			button.text += " ^w^"




func _on_button_pressed() -> void:
	myLvl = "res://level_1.tscn"
	get_tree().change_scene_to_file(myLvl)


func _on_button_2_pressed() -> void:
	myLvl = "res://level_2.tscn"
	get_tree().change_scene_to_file(myLvl)


func _on_button_3_pressed() -> void:
	myLvl = "res://dev_debug.tscn"
	get_tree().change_scene_to_file(myLvl)


func _on_save_time_pressed() -> void:
	Save.pressedSave()
