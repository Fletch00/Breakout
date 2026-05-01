extends Node

var winLvl: Array = []
const saveFile = "user://breakout_data.save"
var already_loaded = false
var winMaybe = false


func saveGame(ID : String):
	Save.winLvl.append(ID)

func pressedSave():
	var file = FileAccess.open(saveFile, FileAccess.WRITE)
	if file:
		file.store_var(winLvl, false)
		file.close()

func loadSave():
	if already_loaded == false:
		if FileAccess.file_exists(saveFile):
			var file = FileAccess.open(saveFile, FileAccess.READ)
			if file:
				print("Loaded winLvl:", winLvl)
				var temp = file.get_var(false)
				file.close()
				already_loaded = true
				if typeof(temp) == TYPE_ARRAY:
					winLvl = temp
					already_loaded = true
				else:
					winLvl = []
					pressedSave()
				
		else:
			winLvl = []
			already_loaded = true
	elif already_loaded == true:
		return
