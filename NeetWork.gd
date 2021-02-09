extends Node
# Declare member variables here. Examples:
var peer
const DEFAULT_PORT=10567
const MAX_PEERS=2
const ip="127.0.0.1"

var player_info = {nick_name='', position=Vector2()}
var players={}

func _ready():
	get_tree().connect('network_peer_disconnected', self, '_on_player_disconnected')
	get_tree().connect('network_peer_connected', self, '_on_player_connected')
	
func host_game(new_player_name):
	player_info.nick_name = new_player_name
	players[1]=player_info
	peer = NetworkedMultiplayerENet.new()
	peer.create_server(DEFAULT_PORT, MAX_PEERS)
	get_tree().set_network_peer(peer)
	print('host game')


func join_game(ip, new_player_name):
	player_info.nick_name = new_player_name
	get_tree().connect('connected_to_server', self, '_connected_to_server')
	peer = NetworkedMultiplayerENet.new()
	peer.create_client(ip, DEFAULT_PORT)
	get_tree().set_network_peer(peer)
	print('join game')

func _on_player_disconnected(id):
	players.erase(id)

func _on_player_connected(connected_player_id):
	var local_player_id = get_tree().get_network_unique_id()
	if not(get_tree().is_network_server()):
		rpc_id(1, '_request_player_info', local_player_id, connected_player_id)
	print ('on player connected')

func _connected_to_server():
	var local_player_id = get_tree().get_network_unique_id()
	players[local_player_id] = player_info
	rpc('_send_player_info', local_player_id, player_info)
	print('connected to server')

remote func _request_player_info(request_from_id, player_id):
	if get_tree().is_network_server():
		rpc_id(request_from_id, '_send_player_info', player_id, players[player_id])
	print('request player onifo')

remote func _send_player_info(id, info):
	players[id] = info
	var new_player = load('res://Player/Player.tscn').instance()
	new_player.name = str(id)
	new_player.set_network_master(id)
	$'/root/Node2D/YSort/'.add_child(new_player)
	print('send info')
	# new_player.init(info.name, info.position, true)
