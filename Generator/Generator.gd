extends Node

var text_map
var json_maps

func _ready():
	print("Generating Map...")
	text_map = list_files_in_directory("res://Jsons")
	#text_map=read_map()
	if text_map:
		print(text_map)
		print("Map Generated Successfully")
		


static func read_map():
	var file = File.new()
	file.open("res://Jsons/green_trees_isometric.json", file.READ)
	var json = file.get_as_text()
	var json_result = JSON.parse(json).result
	file.close()
	return json_result
	
func list_files_in_directory(path: String):
	var files = []
	var dir = Directory.new()
	dir.open(path)
	dir.list_dir_begin()

	while true:
		var file = dir.get_next()
		if file == "":
			break
		elif file.ends_with(".json"):
			files.append(file)
	dir.list_dir_end()
	json_maps = read_maps(files)
	return json_maps


static func read_maps(files: Array):
	var json_result
	var arr_json: Array = []
	for i in files:
		var file_name = str(i)
		var file = File.new()
		file.open("res://Jsons/"+ file_name, file.READ)
		var json = file.get_as_text()
		json_result = JSON.parse(json).result
		arr_json.append(json_result)
		file.close()	
	return arr_json
