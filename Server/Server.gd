extends Node

var network = NetworkedMultiplayerENet.new()
var port = 1909
var max_players = 100

onready var generator_node = get_node("Generator")
onready var rpc_node = get_node("RPC")

func _ready():
	StartServer()

func StartServer():
	network.create_server(port,max_players)
	get_tree().set_network_peer(network)
	print("Server started at Port => ",str(port)," Version: 1.0")
	network.connect("peer_connected",self,"_Peer_Connected")
	network.connect("peer_disconnected",self,"_Peer_Disconnected")

func _Peer_Connected(playerId):
	print("User "+ str(playerId) + " Connected")
	rpc_node.sendMap(playerId,generator_node.text_map)

func _Peer_Disconnected(playerId):
	print("User "+ str(playerId) + " Disconnected")

