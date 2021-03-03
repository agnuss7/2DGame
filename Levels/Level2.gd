extends "res://Classes/level_class.gd"

remote var iron_key=true
remote var oil_can=true

func _ready():
	places=[Vector2(0,0),Vector2(0,10),Vector2(0,20)]

remote func sync_level(var id):
	.sync_level(id)
	if get_tree().is_network_server():
		rpc_id(id,'sync_in_progress',
		iron_key,oil_can,$'/root/Node2D/YSort/Gauges'.is_ignited,
		$'/root/Node2D/YSort/Gauges'.is_done,
		$'/root/Node2D/YSort/Plate'.code_complete,
		$'/root/Node2D/YSort/Skeleton'.rusted,
		$'/root/Node2D/YSort/Panel'.card_read,
		$'/root/Node2D/YSort/Panel'.is_done,
		$'/root/Node2D/YSort/Door'.is_open)

remote func sync_in_progress(var i_key, var oil, var ignited, var gauge_done, var plate_complete, var skel_rust,var panel_card,var panel_done,var door_unlock):
	iron_key=i_key
	if (!i_key):
		var key=$'YSort/Key'
		key.queue_free()
	oil_can=oil
	if (!oil):
		var oily=$'YSort/OilCan'
		oily.queue_free()
	$'/root/Node2D/YSort/Gauges'.is_ignited=ignited
	$'/root/Node2D/YSort/Gauges'.is_done=gauge_done
	$'/root/Node2D/YSort/Plate'.code_complete=plate_complete
	$'/root/Node2D/YSort/Skeleton'.rusted=skel_rust
	$'/root/Node2D/YSort/Panel'.card_read=panel_card
	$'/root/Node2D/YSort/Panel'.is_done=panel_done
	$'/root/Node2D/YSort/Door'.is_open=door_unlock
	if door_unlock:
		$'/root/Node2D/YSort/Door'.unlock_anim()
	

















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
#
#	for i in NeetWork.players:
#		if i!=u_id and NeetWork.players.has(i):
#			var new_player = load('res://Player/Player.tscn').instance()
#			new_player.name = str(i)
#			new_player.set_network_master(i)
#			$'/root/Node2D/YSort/'.add_child(new_player)
