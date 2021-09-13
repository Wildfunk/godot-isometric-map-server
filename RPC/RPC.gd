extends Node

func _ready():
	pass # Replace with function body.


func sendMap(playerId,textMap):
	if(playerId):
		rpc_id(playerId,"receiverMap",textMap)

