extends Node2D

var nick_name
var sprite_name
var ip_input_text
var lan_available=false
var lan_status

var time=0

func _ready():
	IpDatabase.start_listen()
	IpDatabase.is_joining=true
	var secondJoinButton=get_node("CanvasLayer/SecondJoinButton")
	secondJoinButton.connect("pressed",self,'_second_join_button_pressed')
	var backButton=get_node("CanvasLayer/BackButton")
	backButton.connect("pressed",self,"_back_button_pressed")
	var lanJoinButton=get_node("CanvasLayer/LanJoinButton")
	lanJoinButton.connect("pressed",self,"_lan_button_pressed")
	ip_input_text=get_node("CanvasLayer/IPAdressInput")
	lan_status=get_node("CanvasLayer/LanStatus")

func pass_name(var n, var s):
	nick_name=n
	sprite_name=s

func _second_join_button_pressed():
	if ip_input_text.text!="":
		NeetWork.join_game(ip_input_text.text,nick_name,sprite_name)
	else:
		NeetWork.join_game(NeetWork.ip, nick_name,sprite_name)
	IpDatabase.is_joined=true
	IpDatabase.is_joining=false
	IpDatabase.end_listen()
	LevelLoader.Load_level(LevelLoader.current_level)
	self.queue_free()

func _back_button_pressed():
	IpDatabase.is_joining=false
	IpDatabase.end_listen()
	get_tree().change_scene("res://scenes/Lobby.tscn")
	self.queue_free()

func _lan_button_pressed():
	if lan_available:
		NeetWork.join_game(IpDatabase.lan_ip,nick_name,sprite_name)
		IpDatabase.is_joined=true
		IpDatabase.is_joining=false
		IpDatabase.end_listen()
		LevelLoader.Load_level(LevelLoader.current_level)
		self.queue_free()

func check_lan():
	if IpDatabase.lan_ip!=null and IpDatabase.host_nick_name!="_end_of_broadcast_":
		lan_status.text="LAN: "+IpDatabase.host_nick_name+"'s game"
		
	else:
		lan_status.text="LAN: unavailable"

func _process(delta):
	time+=delta
	if time>2:
		time=0
		check_lan()
