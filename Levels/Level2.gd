extends "res://Classes/level_class.gd"
func _ready():
	places=[Vector2(0,0),Vector2(0,10),Vector2(0,20)]

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
