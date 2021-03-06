extends "res://Classes/overlay_class.gd"

var control_enabled=true 
var current_selected=1
const total_buttons=3
var is_operational=false
func _ready():
	change_highlight()
	

func change_highlight():
	for i in range(1,total_buttons+1):
		if(i!=current_selected):
			get_node("CanvasLayer/Highlight"+str(i)).self_modulate.a=0
		else:
			get_node("CanvasLayer/Highlight"+str(i)).self_modulate.a=1

func get_horizontal_input():
	if(Input.is_action_just_pressed("down")):
		if current_selected<total_buttons:
			current_selected+=1
		else:
			current_selected=1
	if(Input.is_action_just_pressed("up")):
		if current_selected>1:
			current_selected-=1
		else:
			current_selected=total_buttons
	change_highlight()

func get_e_input():
	if Input.is_action_just_pressed("operate"):
		button_function()

func button_function():
	if current_selected==1:
		._close()
	elif current_selected==2:
		var f=funcref(self, "to_main")
		var yn=load("res://Overlays/YesNoDialog.tscn").instance()
		yn.pass_fun(f)
		control_enabled=false
		add_child(yn)
	elif current_selected==3:
		var f=funcref(get_tree(), "quit")
		var yn=load("res://Overlays/YesNoDialog.tscn").instance()
		yn.pass_fun(f)
		control_enabled=false
		add_child(yn)
		

func to_main():
	get_tree().change_scene('res://scenes/MainMenu.tscn')
	NeetWork.players.clear()
	NeetWork.peer.close_connection()







func _process(delta):
	if control_enabled:
		get_horizontal_input()
		if(is_operational):
			if(Input.is_action_just_pressed("cancel") or Input.is_action_just_pressed("quit")):
				._close()
		else:
			is_operational=true
		get_e_input()
