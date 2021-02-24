extends Node
remote var current_level=1
remote var line_number=0

func Load_level_one():
	get_tree().change_scene("res://scenes/TrialScene.tscn")
#	get_tree().get_root().get_child(2).done()

remote func Load_level(var nr):
	get_tree().change_scene("res://Levels/Level"+str(nr)+".tscn")
	call_deferred('init_level')
	
func init_level():
	var node=get_node("/root/Node2D")
	node.init()

func tran_level():
	var node=get_node("/root/Node2D")
	node.transition()
	
func Transition_to_level(var nr):
	get_tree().change_scene("res://Levels/Level"+str(nr)+".tscn")
	call_deferred('tran_level')

remote func next_level():
	current_level+=1
	Transition_to_level(current_level)

func _ready():
	get_tree().connect("network_peer_connected",self,'sync_level_number')
	get_tree().connect('network_peer_disconnected', self, '_on_player_disconnected')
	get_tree().connect('server_disconnected', self, '_on_server_disconnected')

func _on_player_disconnected(id):
	var base=get_node("/root/Node2D/YSort")
	base.get_node(str(id)).queue_free()

func _on_server_disconnected():
	get_tree().change_scene("res://scenes/Lobby.tscn")
	NeetWork.players.clear()
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
func sync_level_number(var u_id):
	print ("sync level nr")
	if get_tree().is_network_server():
		rset_id(u_id,"current_level",current_level)
		#rset_id(u_id,"line_number",NeetWork.players.size()-1)
		rpc_id(u_id,"Load_level",current_level)
