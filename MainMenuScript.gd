extends Node2D

var PlayButton
var QuitButton

func _ready():
	PlayButton=get_node("PlayButton")
	QuitButton=get_node("QuitButton")
	PlayButton.connect("pressed",self,"play_pressed")
	QuitButton.connect("pressed",self,"quit_pressed")
	
func play_pressed():
	get_tree().change_scene("res://scenes/Lobby.tscn")
	self.queue_free()
func quit_pressed():
	get_tree().quit()
