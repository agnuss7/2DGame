extends Node


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

func Load_level_one():
	get_tree().change_scene("res://scenes/TrialScene.tscn")
#	get_tree().get_root().get_child(2).done()
	
func _ready():
	get_tree().connect('network_peer_disconnected', self, '_on_player_disconnected')
	get_tree().connect('server_disconnected', self, '_on_server_disconnected')

func _on_player_disconnected(id):
	var base=get_node("/root/Node2D/YSort")
	base.get_node(str(id)).queue_free()

func _on_server_disconnected():
	get_tree().change_scene("res://scenes/Lobby.tscn")
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
