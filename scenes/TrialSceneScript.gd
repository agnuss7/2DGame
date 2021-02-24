extends "res://Classes/level_class.gd"
const no_of_places=3

#func _ready():
#	var player=load("res://Player/Player.tscn").instance()
#	var u_id=get_tree().get_network_unique_id()
#	player.name=str(u_id)
#	player.set_network_master(u_id)
##	var back=load("res://Other/TrialBackground.tscn").instance()
##	back.name="Background"
#	var cam=load("res://Other/Camera.tscn").instance()
##	$'/root/Node2D'.add_child(back)
#	$'/root/Node2D'.add_child(cam)
##	var y=YSort.new()
##	y.name="YSort"
##	$'/root/Node2D'.add_child(y)
#	$'/root/Node2D/YSort'.add_child(player)
#	player.init()
#	if !get_tree().is_network_server():
#		rpc_id(1,'sync_level',get_tree().get_network_unique_id())
#	for i in NeetWork.players:
#		if i!=u_id and NeetWork.players.has(i):
#			print(i)
#			var new_player = load('res://Player/Player.tscn').instance()
#			new_player.name = str(i)
#			new_player.set_network_master(i)
#			$'/root/Node2D/YSort/'.add_child(new_player)
#

remote func sync_level(var id):
	.sync_level(id)
	if get_tree().is_network_server():
#		LevelLoader.rset_id(id,"line_number",NeetWork.players.size()-1)
#		get_node('/root/Node2D/YSort/'+str(id)).rpc_id(id,'init')
		var node=get_node("/root/Node2D/YSort/Panel")
		node.rset_id(id,"is_done",node.is_done)
		if node.is_done:
			node.rpc('set_lock_done')
		var d=get_node("YSort/Door")
		d.rset_id(id,"is_open",d.is_open)
