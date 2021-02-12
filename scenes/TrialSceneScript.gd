extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
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


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
