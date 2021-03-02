extends "res://Classes/overlay_class.gd"

var current_code="22222"
var correct_code="01021"
var current_selected=1
var current_selected_node

func _ready():
	current_selected_node=get_node("CanvasLayer/Base/Highlight"+str(current_selected))
	change_highlights()
	
func change_highlights():
	for i in range(1,6):
		var node=get_node("CanvasLayer/Base/Highlight"+str(i))
		if(i!=current_selected):
			node.self_modulate.a=0
		else:
			node.self_modulate.a=1
	current_selected_node=get_node("CanvasLayer/Base/Highlight"+str(current_selected))

func get_horizontal_input():
	if(Input.is_action_just_pressed("right")):
		if(current_selected<5):
			current_selected+=1
		else:
			current_selected=1
		change_highlights()
		
	if(Input.is_action_just_pressed("left")):
		if(current_selected>1):
			current_selected-=1
		else:
			current_selected=5
		change_highlights()

func get_vertical_input():
	if (Input.is_action_just_pressed("down")):
		if(current_selected_node.get_node("Lever").frame<2):
			current_selected_node.get_node("Lever").frame+=1
			make_code()
	if (Input.is_action_just_pressed("up")):
		if(current_selected_node.get_node("Lever").frame>0):
			current_selected_node.get_node("Lever").frame-=1
			make_code()

func make_code():
	var temp=""
	for i in range(1,6):
		temp=temp+str(get_node("CanvasLayer/Base/Highlight"+str(i)+"/Lever").frame)
	current_code=temp

func check_success():
	if current_code==correct_code:
		operable_node.is_done=true
		.set_operable_done()
		._close()
		var nod=get_node("/root/Node2D/YSort/"+str(get_tree().get_network_unique_id()))
		nod.control_enabled=false
		var overlay=load("res://Other/CommentSpace.tscn").instance()
		$'/root/Node2D'.add_child(overlay)
		overlay.pass_comments(["...the machine printed out a card","Picked up "+Inventory.global_inventory[1].name])
		Inventory.inventory.append(1)
		Inventory.rset('inventory',Inventory.inventory)
		
func _process(delta):
	get_horizontal_input()
	get_vertical_input()
	check_success()
	if (Input.is_action_just_pressed("cancel")):
		._close()
