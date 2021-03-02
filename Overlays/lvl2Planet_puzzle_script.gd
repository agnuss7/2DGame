extends "res://Classes/overlay_class.gd"

var current_selected=1
var current_selected_node
var current_code="0000"
var correct_code="1220"
func _ready():
	current_selected_node=get_node("CanvasLayer/Base/Highlight"+str(current_selected))
	change_highlights()

func change_highlights():
	for i in range(1,5):
		if i!=current_selected:
			get_node("CanvasLayer/Base/Highlight"+str(i)).self_modulate.a=0
		else:
			current_selected_node.self_modulate.a=1

func get_move_input():
	if(Input.is_action_just_pressed("right")):
		if current_selected==1:
			current_selected=2
		elif current_selected==3:
			current_selected=4
	if (Input.is_action_just_pressed("left")):
		if current_selected==2:
			current_selected=1
		elif current_selected==4:
			current_selected=3
	if (Input.is_action_just_pressed("down")):
		if current_selected==1:
			current_selected=3
		elif current_selected==2:
			current_selected=4
	if (Input.is_action_just_pressed("up")):
		if current_selected==3:
			current_selected=1
		elif current_selected==4:
			current_selected=2
	current_selected_node=get_node("CanvasLayer/Base/Highlight"+str(current_selected))
	change_highlights()
	
func get_e_input():
	if(Input.is_action_just_pressed("operate")):
		if(current_selected_node.get_node("Symbol").frame<2):
			current_selected_node.get_node("Symbol").frame+=1
		else:
			current_selected_node.get_node("Symbol").frame=0
		make_code()

func make_code():
	var temp=""
	for i in range(1,5):
		temp+=str(get_node("CanvasLayer/Base/Highlight"+str(i)+"/Symbol").frame)
	current_code=temp


func check_for_success():
	if(current_code==correct_code):
		self.queue_free()
		var before=load("res://Other/CommentSpaceBeforeOverlay.tscn").instance()
		var after=load("res://Overlays/lvl2MathHint.tscn").instance()
		before.pass_operable(operable_node)
		before.pass_next_overlay(after)
		$'/root/Node2D'.add_child(before)
		before.pass_comments(["The plate flipped and revealed some writting..."])
		operable_node.set_code_complete()
		

func _process(delta):
	get_move_input()
	get_e_input()
	if(Input.is_action_just_pressed("cancel")):
		._close()
	check_for_success()
