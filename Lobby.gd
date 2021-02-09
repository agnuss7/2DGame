extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	var host_butt=get_node("HostButton")
	var join_butt=get_node("JoinButton")
	host_butt.connect("pressed", self, "_host_button_pressed")
	join_butt.connect("pressed", self, "_join_button_pressed")


	
func _host_button_pressed():
	NeetWork.host_game("first")
	var player=load("res://Player/Player.tscn").instance()
	player.name='1'
	player.set_network_master(1)
	var back=load("res://Other/TrialBackground.tscn").instance()
	back.name="Background"
	var cam=load("res://Other/Camera.tscn").instance()
	$'/root/Node2D'.add_child(back)
	$'/root/Node2D'.add_child(cam)
	var y=YSort.new()
	y.name="YSort"
	$'/root/Node2D'.add_child(y)
	$'/root/Node2D/YSort'.add_child(player)
func _join_button_pressed():
	NeetWork.join_game(NeetWork.ip, "first")
	var player=load("res://Player/Player.tscn").instance()
	var unique_id=get_tree().get_network_unique_id()
	player.name=str(unique_id)
	player.set_network_master(unique_id)
	var back=load("res://Other/TrialBackground.tscn").instance()
	back.name="Background"
	var cam=load("res://Other/Camera.tscn").instance()
	$'/root/Node2D'.add_child(back)
	$'/root/Node2D'.add_child(cam)
	var y=YSort.new()
	y.name="YSort"
	$'/root/Node2D'.add_child(y)
	$'/root/Node2D/YSort'.add_child(player)
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
