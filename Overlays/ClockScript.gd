extends "res://Classes/overlay_class.gd"

var current_hour=0
var current_minute=0
var enterred_times=[]
var correct_sequence=[[9,2],[4,7],[8,0]]
var current_sequence=0
func _ready():
	pass 

func input_hour_hand():
	if Input.is_action_just_pressed("down"):
		if current_hour>0:
			current_hour-=1
		else:
			current_hour=11
		turn_hand()
	if Input.is_action_just_pressed("up"):
		if current_hour<11:
			current_hour+=1
		else:
			current_hour=0
		turn_hand()

func input_minute_hand():
	if Input.is_action_just_pressed("left"):
		if current_minute>0:
			current_minute-=1
		else:
			current_minute=11
		turn_hand()
	if Input.is_action_just_pressed("right"):
		if current_minute<11:
			current_minute+=1
		else:
			current_minute=0
		turn_hand()

func turn_hand():
	$'CanvasLayer/Face/Hour'.rotation_degrees=30*current_hour
	$'CanvasLayer/Face/Minute'.rotation_degrees=30*current_minute
	enterred_times.append([current_hour,current_minute])

func check_sequence():
	if correct_sequence[current_sequence] in enterred_times:
		if current_sequence<2:
			current_sequence+=1
			enterred_times.clear()
		else:
			success()

func success():
	operable_node.set_done()
	self.queue_free()
	var overlay=load("res://Other/CommentSpace.tscn").instance()
	overlay.pass_operable(operable_node)
	$'/root/Node2D'.add_child(overlay)
	overlay.pass_comments(["The base of the clock opened up. Something's there...","Picked up Red Orb"])
	Inventory.add_item(5)

func _process(delta):
	input_hour_hand()
	input_minute_hand()
	check_sequence()
	if Input.is_action_just_pressed("cancel"):
		._close()
