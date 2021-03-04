extends Control

const sprite_textures=["ddt5r2m-38b8c791-a12b-460a-bf2b-42128353e4a2.png","ddt5nnu-f656ddbf-0a9e-46d6-abc2-771b6bcb964e.png","ddt5r11-d7e61b3a-9312-47bc-9d99-71563e4a0c1e.png"]
var current_selected=0
var text
# Called when the node enters the scene tree for the first time.
func _ready():
	var host_butt=get_node("CanvasLayer/HostButton")
	var join_butt=get_node("CanvasLayer/JoinButton")
	var left_butt=get_node("CanvasLayer/SpriteButtonLeft")
	var right_butt=get_node("CanvasLayer/SpriteButtonRight")
	text=get_node("CanvasLayer/TextEdit")
	host_butt.connect("pressed", self, "_host_button_pressed")
	join_butt.connect("pressed", self, "_join_button_pressed")
	left_butt.connect("pressed",self,"_on_left_pressed")
	right_butt.connect("pressed",self,"_on_right_pressed")

func change_texture():
	$"CanvasLayer/Sprite".texture=load("res://sprites/"+sprite_textures[current_selected])

func _on_right_pressed():
	if current_selected<sprite_textures.size()-1:
		current_selected+=1
	else:
		current_selected=0
	change_texture()
	
func _on_left_pressed():
	if current_selected>0:
		current_selected-=1
	else:
		current_selected=sprite_textures.size()-1
	change_texture()
#func Load_level(var u_id):
#	var level=load("res://scenes/TrialScene.tscn").instance()
#
#	get_tree().change_scene("res://scenes/TrialScene.tscn")
#	var player=load("res://Player/Player.tscn").instance()
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
func player_sprite_name():
	if (current_selected==0):
		return "Player"
	elif (current_selected>0 and current_selected<3):
		return "Player"+str(current_selected+1)
	else:
		return "Player"
	
func _host_button_pressed():
	NeetWork.host_game(text.text,player_sprite_name())
	LevelLoader.Load_level(LevelLoader.current_level)
	self.queue_free()
	
	
func _join_button_pressed():
	var jjoin=load("res://Other/SecondJoin.tscn").instance()
	jjoin.pass_name(text.text,player_sprite_name())
	get_parent().add_child(jjoin)
	self.queue_free()
	
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
