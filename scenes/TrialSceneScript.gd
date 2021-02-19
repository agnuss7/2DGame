extends Node2D
const no_of_places=3
remote var places=[Vector2(0,0), Vector2(30,0), Vector2(-30,0)]
# Called when the node enters the scene tree for the first time.
func _ready():
	get_tree().connect('network_peer_connected', self, 'sync_level')
	var player=load("res://Player/Player.tscn").instance()
	var u_id=get_tree().get_network_unique_id()
	player.name=str(u_id)
	player.set_network_master(u_id)
#	var back=load("res://Other/TrialBackground.tscn").instance()
#	back.name="Background"
	var cam=load("res://Other/Camera.tscn").instance()
#	$'/root/Node2D'.add_child(back)
	$'/root/Node2D'.add_child(cam)
#	var y=YSort.new()
#	y.name="YSort"
#	$'/root/Node2D'.add_child(y)
	$'/root/Node2D/YSort'.add_child(player)

func sync_level(var id):
	print("sunc_level")
	if get_tree().is_network_server():
		var node=get_node("/root/Node2D/YSort/Panel")
		node.rset("is_done",node.is_done)
