extends Node2D
var timer


var label_node
func _ready():
	label_node=get_node("CanvasLayer/Label")
	label_node.self_modulate.a=0
	get_tree().connect('connected_to_server', self, 'just_connected')
	timer=Timer.new()
	timer.set_one_shot(true)
	timer.set_wait_time(2)
	timer.connect('timeout',self,'turn_translucent')
	add_child(timer)
	
	
func just_connected():
	rpc('send_nick_name',NeetWork.player_info.nick_name)
	

remote func send_nick_name(var nick_name):
	label_node.self_modulate.a=1
	$'CanvasLayer/Label'.text= nick_name+' has joined'
	timer.start()
	
func turn_translucent():
	label_node.self_modulate.a=0

