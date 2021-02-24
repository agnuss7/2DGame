extends Control


var text
# Called when the node enters the scene tree for the first time.
func _ready():
	var host_butt=get_node("CanvasLayer/HostButton")
	var join_butt=get_node("CanvasLayer/JoinButton")
	text=get_node("CanvasLayer/TextEdit")
	host_butt.connect("pressed", self, "_host_button_pressed")
	join_butt.connect("pressed", self, "_join_button_pressed")


func Load_level(var u_id):
	var level=load("res://scenes/TrialScene.tscn").instance()
	
	get_tree().change_scene("res://scenes/TrialScene.tscn")
	var player=load("res://Player/Player.tscn").instance()
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


func _host_button_pressed():
	NeetWork.host_game(text.text)
	LevelLoader.Load_level(LevelLoader.current_level)
	self.queue_free()
	
	
func _join_button_pressed():
	var jjoin=load("res://Other/SecondJoin.tscn").instance()
	jjoin.pass_name(text.text)
	get_parent().add_child(jjoin)
	self.queue_free()
	
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
