extends TileMap


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var arr :Array = []
var dict :Dictionary 
# Called when the node enters the scene tree for the first time.
func _ready():
	tilemap_json_generator()
	pass
	
func tilemap_json_generator():
	print("tilemap script")
	var all = get_used_cells()
	print(all)
#	var coords = get_used_cells_by_id(1)
#	print(coords,'coords')
#	print(coords[0].x,'coords x')
#	var id = get_cell(coords[0].x,coords[0].y)
#	print(id)
	for i in all:
		dict = {
				"Vector_X": i.x,
				"Vector_Y": i.y,
				"Key":get_cell(i.x,i.y)
				}
		arr.append(dict)
	var jsonn = to_json(arr)
	print(jsonn,'json')
	var file = File.new()
	file.open("res://Jsons/trees_isometric.json", File.WRITE)
	file.store_line(jsonn)
	file.close()
