extends "res://Classes/overlay_class.gd"

var fun

var current_selected=1

func _ready():
	change_highlights()

func pass_fun(var f):
	fun=f

func get_horizontal_input():
	if Input.is_action_just_pressed("right"):
		if current_selected<2:
			current_selected+=1
	if Input.is_action_just_pressed("left"):
		if current_selected>1:
			current_selected-=1
	change_highlights()

func get_e_input():
	if Input.is_action_just_pressed("operate"):
		if(current_selected==1):
			fun.call_func()
		else:
			self.queue_free()
			$'/root/Node2D/Menu'.control_enabled=true

func change_highlights():
	for i in range(1,3):
		if(i==current_selected):
			get_node("CanvasLayer/Base/Highlight"+str(i)).self_modulate.a=1
		else:
			get_node("CanvasLayer/Base/Highlight"+str(i)).self_modulate.a=0
	
func _process(delta):
	get_horizontal_input()
	get_e_input()
