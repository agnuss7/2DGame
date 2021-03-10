extends Node
remote var current_level=3
remote var line_number=0
const total_levels=3

var score=0
var scores=[]


func Load_level_one():
	get_tree().change_scene("res://scenes/TrialScene.tscn")
#	get_tree().get_root().get_child(2).done()

remote func Load_level(var nr):
	get_tree().change_scene("res://Levels/Level"+str(nr)+".tscn")
	call_deferred('init_level')
	
func init_level():
	var node=get_node("/root/Node2D")
	node.init()
	score=0

func tran_level():
	var node=get_node("/root/Node2D")
	node.transition()
	scores.append(score)
	score=0
	Inventory.inventory.clear()
	
func Transition_to_level(var nr):
	get_tree().change_scene("res://Levels/Level"+str(nr)+".tscn")
	call_deferred('tran_level')

remote func next_level():
	if current_level<total_levels:
		current_level+=1
		Transition_to_level(current_level)
	else:
		final_score()

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

func sync_level_number(var u_id):
	print ("sync level nr")
	if get_tree().is_network_server():
		rset_id(u_id,"current_level",current_level)
		#rset_id(u_id,"line_number",NeetWork.players.size()-1)
		rpc_id(u_id,"Load_level",current_level)

func final_score():
	get_tree().change_scene("res://scenes/FinalScore.tscn")
	if get_tree().is_network_server():
		scores.append(score)
		var n=[]
		for i in NeetWork.players:
			n.append(NeetWork.players[i].nick_name)
		call_deferred('give_names',n)
	
func _process(delta):
	score+=delta

func give_names(var nn):
	if get_tree().is_network_server():
		$'/root/Node2D'.pass_names(nn,scores)
		$'/root/Node2D'.rpc('pass_names',nn, scores)
	
