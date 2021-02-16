extends Node2D
var place = {
	position=Vector2(7,-50),
	taken=false}
const no_of_places=3
remote var places=[place, place, place]
# Called when the node enters the scene tree for the first time.
func _ready():
	places[0].position=Vector2(0,0)
	places[1].position=Vector2(20,0)
	places[2].position=Vector2(-20,0)
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
	player.init()

remote func request_place(var id):
	if(get_tree().is_network_server()):
		for i in range(0,no_of_places):
			if(!places[i].taken):
				places[i].taken=true
				rpc_id(id,"send_place",places[i].position)
				return
remote func send_place(var pos):
	NeetWork.player_info.position=pos
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
