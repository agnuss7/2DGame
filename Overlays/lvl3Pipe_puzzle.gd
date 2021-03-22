extends "res://Classes/overlay_class.gd"

const count=30
var rotations=[1,2,3,0,1,3,0,2,0,1,0,2,3,2,0,0,2,1,2,3,2,1,0,3,2,0,1,0,2,0]
var current_selected=0

func change_highlights():
	for i in range(0,count):
		var node=get_node("CanvasLayer/Base/PipeBase"+str(i))
		if i==current_selected:
			node.self_modulate.r=150/255
			node.self_modulate.b=150/255
		else:
			node.self_modulate.r=1
			node.self_modulate.b=1

func change_rotations():
	for i in range(0,count):
		var node=get_node("CanvasLayer/Base/PipeBase"+str(i))
		node.rotation_degrees=90*rotations[i]

func change_rotation():
	var node=get_node("CanvasLayer/Base/PipeBase"+str(current_selected))
	node.rotation_degrees=90*rotations[current_selected]

func get_select_input():
	if(Input.is_action_just_pressed("left")):
		if current_selected>0:
			current_selected-=1
	if Input.is_action_just_pressed("right"):
		if current_selected<count-1:
			current_selected+=1
	if Input.is_action_just_pressed("up"):
		if current_selected-6>=0:
			current_selected-=6
	if Input.is_action_just_pressed("down"):
		if current_selected+6<count:
			current_selected+=6
	change_highlights()

func get_rotation_input():
	if Input.is_action_just_pressed("operate"):
		if rotations[current_selected]<3:
			rotations[current_selected]+=1
		else:
			rotations[current_selected]=0
	change_rotation()

func check_for_success():
	if (rotations[0]==3 and
	rotations[2]==2 and
	rotations[3]==3 and
	rotations[6]==1 and
	rotations[7]==3 and
	rotations[8]==0 and
	(rotations[9]==0 or rotations[9]==2) and
	rotations[13]==2 and
	(rotations[14]==1 or rotations[14]==3) and
	(rotations[16]==1 or rotations[16]==3) and
	rotations[17]==3 and
	(rotations[19]==0 or rotations[19]==2) and
	rotations[20]==2 and
	rotations[21]==0 and
	(rotations[23]==0 or rotations[23]==2) and
	rotations[25]==1 and
	rotations[26]==0 and
	rotations[29]==1):
		control_enabled=false
		play_animations()
		.pause(1.5)

func play_after_pause():
	Inventory.add_item(4)
	operable_node.set_done()
	var overlay=load("res://Other/CommentSpace.tscn").instance()
	overlay.pass_operable(operable_node)
	$'/root/Node2D'.add_child(overlay)
	overlay.pass_comments(["Picked up Blue Orb"])
	._close()

func play_animations():
	var bottle=$'CanvasLayer/Base/Bottle/water/Tween'
	var orb=$'CanvasLayer/Base/Bottle/orb/Tween'
	bottle.interpolate_property($'CanvasLayer/Base/Bottle/water', "scale",
		Vector2(0.926,0), Vector2(0.926,1), 1,
		Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)
	bottle.start()
	orb.interpolate_property($'CanvasLayer/Base/Bottle/orb','position',
	Vector2(-0.42,33.636),Vector2(-0.42,-25),1,Tween.TRANS_LINEAR,Tween.EASE_IN_OUT)
	orb.start()



func _ready():
	change_highlights()
	change_rotations()
	
func _process(delta):
	if control_enabled:
		get_select_input()
		get_rotation_input()
		check_for_success()
		if Input.is_action_just_pressed("cancel"):
			._close()
		
