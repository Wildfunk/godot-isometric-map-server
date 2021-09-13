extends TileMap


var arr :Array = []
var dict :Dictionary 
# Called when the node enters the scene tree for the first time.
func _ready():
	tilemap_json_generator()
	pass
	
func tilemap_json_generator():
	var all_tiles = get_used_cells()
	for tile in all_tiles:
		dict = {
				"Vector_X": tile.x,
				"Vector_Y": tile.y,
				"Key":get_cell(tile.x,tile.y)
				}
		arr.append(dict)
	var json = to_json(arr)
	var file = File.new()
	file.open("res://Jsons/green_trees_isometric.json", File.WRITE)
	file.store_line(json)
	file.close()

