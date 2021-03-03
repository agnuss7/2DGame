extends "res://Classes/overlay_class.gd"

const abc="abcdefghijklmnopqrstuvwxyz"
var current_selected=0
var text
var e_operational=false
var correct_code="afgzew"

func _ready():
	change_highlights()
	text=get_node("CanvasLayer/screen_text")
	text.text=""

func change_highlights():
	for i in range(0,26):
		if(i!=current_selected):
			get_node("CanvasLayer/Base/Highlight"+str(i)).self_modulate.a=0
		else:
			get_node("CanvasLayer/Base/Highlight"+str(i)).self_modulate.a=1
	
func get_move_input():
	if(Input.is_action_just_pressed("right")):
		if(current_selected<25):
			current_selected+=1
	if(Input.is_action_just_pressed("left")):
		if(current_selected>0):
			current_selected-=1
	if(Input.is_action_just_pressed("down")):
		if(current_selected+9<26):
			current_selected+=9
	if(Input.is_action_just_pressed("up")):
		if(current_selected-9>=0):
			current_selected-=9
	change_highlights()


func get_e_input():
	if(Input.is_action_just_pressed("operate")):
		text.text+=abc[current_selected]
		check_for_success()

func check_for_success():
	if(text.text==correct_code):
		var door=$'/root/Node2D/YSort/Door'
		door.unlock()
		door.unlock_anim()
		door.rpc('unlock_anim')
		._close()
		operable_node.set_done()

func _process(delta):
	get_move_input()
	if(e_operational):
		get_e_input()
	else:
		e_operational=true
	if(Input.is_action_just_pressed("cancel")):
		._close()
