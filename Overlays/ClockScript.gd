extends "res://Classes/overlay_class.gd"

var current_hour=0
var current_minute=0

func _ready():
	pass 

func input_hand():
	if Input.is_action_just_pressed("left"):
		if current_hour<11:
			current_hour+=1
		else:
			current_hour=0
	if Input.is_action_just_pressed("right"):
		if current_minute<11:
			current_minute+=1
		else:
			current_minute=0
	turn_hand()

func turn_hand():
	$'CanvasLayer/Face/Hour'.rotation_degrees=30*current_hour
	$'CanvasLayer/Face/Minute'.rotation_degrees=30*current_minute

func _process(delta):
	input_hand()
	if Input.is_action_just_pressed("cancel"):
		._close()
