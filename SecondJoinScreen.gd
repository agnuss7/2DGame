extends Node2D

var nick_name
var ip_input_text
func _ready():
	var secondJoinButton=get_node("CanvasLayer/SecondJoinButton")
	secondJoinButton.connect("pressed",self,'_second_join_button_pressed')
	ip_input_text=get_node("CanvasLayer/IPAdressInput")

func pass_name(var n):
	nick_name=n

func _second_join_button_pressed():
	if ip_input_text.text!="":
		NeetWork.join_game(ip_input_text.text,nick_name)
	else:
		NeetWork.join_game(NeetWork.ip, nick_name)
	LevelLoader.Load_level(LevelLoader.current_level)
	self.queue_free()
