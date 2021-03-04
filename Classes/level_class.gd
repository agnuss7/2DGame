extends Node2D
var places=[Vector2(0,0), Vector2(30,0), Vector2(-30,0)]

func init():
	var player=load("res://Player/"+NeetWork.player_info.sprite_name+".tscn").instance()
	var u_id=get_tree().get_network_unique_id()
	player.name=str(u_id)
	player.set_network_master(u_id)
	var cam=load("res://Other/Camera.tscn").instance()
	$'/root/Node2D'.add_child(cam)
	$'/root/Node2D/YSort'.add_child(player)
	if !get_tree().is_network_server():
		rpc_id(1,'sync_level',get_tree().get_network_unique_id())
	for i in NeetWork.players:
		if i!=u_id and NeetWork.players.has(i):
			var new_player = load('res://Player/'+NeetWork.players[i].sprite_name+'.tscn').instance()
			new_player.name = str(i)
			new_player.set_network_master(i)
			$'/root/Node2D/YSort/'.add_child(new_player)
			
func transition():
	var player=load("res://Player/"+NeetWork.player_info.sprite_name+".tscn").instance()
	var u_id=get_tree().get_network_unique_id()
	player.name=str(u_id)
	player.set_network_master(u_id)
	var cam=load("res://Other/Camera.tscn").instance()
	$'/root/Node2D'.add_child(cam)
	$'/root/Node2D/YSort'.add_child(player)
	player.init()
	for i in NeetWork.players:
		if i!=u_id and NeetWork.players.has(i):
			var new_player = load('res://Player/'+NeetWork.players[i].sprite_name+'.tscn').instance()
			new_player.name = str(i)
			new_player.set_network_master(i)
			$'/root/Node2D/YSort/'.add_child(new_player)

remote func sync_level(var id):
	if get_tree().is_network_server():
		LevelLoader.rset_id(id,"line_number",NeetWork.players.size()-1)
		get_node('/root/Node2D/YSort/'+str(id)).rpc_id(id,'init')
		Inventory.rset_id(id,'inventory',Inventory.inventory)
