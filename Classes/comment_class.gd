extends "res://Classes/overlay_class.gd"

var commentLabel
var commentArray=Array()
var current_comment=0

func _ready():
	commentLabel=get_node("CanvasLayer/Label")
	
func check_for_e():
	if(Input.is_action_just_pressed("operate")):
		next_comment()

func next_comment():
	if(commentArray.size()>current_comment+1):
		current_comment+=1
		commentLabel.text=commentArray[current_comment]
	else:
		end_of_array()
		
func end_of_array():
	._close()
	
func pass_comments(var com):
	commentArray=com
	commentLabel.text=commentArray[current_comment]
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	check_for_e()
