extends "res://Classes/overlay_class.gd"


enum numbers {
	first=1,
	second=2,
	third=3,
	fourth=4
}
var selected_number
var first_number
var second_number
var third_number
var fourth_number
var selected_number_node
var correct_code="9999"
var current_code="0000"


# Called when the node enters the scene tree for the first time.
func _ready():
	first_number=get_node("CanvasLayer/Base/Number1/Highlight")
	second_number=get_node("CanvasLayer/Base/Number2/Highlight")
	third_number=get_node("CanvasLayer/Base/Number3/Highlight")
	fourth_number=get_node("CanvasLayer/Base/Number4/Highlight")
	selected_number=numbers.first
	change_highlight()

func get_input_for_highlight():
	if Input.is_action_just_pressed("right"):
		if selected_number<4:
			selected_number+=1
			change_highlight()
		else:
			selected_number=numbers.first
			change_highlight()
	elif Input.is_action_just_pressed("left"):
		if selected_number>1:
			selected_number-=1
			change_highlight()
		else:
			selected_number=numbers.fourth
			change_highlight()

func get_input_for_number():
	var num=selected_number_node.get_node("Highlight/BaseOfNumber/Number")
	if Input.is_action_just_pressed("down"):
		if num.frame>0:
			num.frame-=1
		else:
			num.frame=9
		make_current_code()
	elif Input.is_action_just_pressed("up"):
		if num.frame<9:
			num.frame+=1
		else:
			num.frame=0
		make_current_code()
	



func make_current_code():
	var q="BaseOfNumber/Number"
	current_code=str(first_number.get_node(q).frame)+str(second_number.get_node(q).frame)+str(third_number.get_node(q).frame)+str(fourth_number.get_node(q).frame)

func change_highlight():
	turn_off_highlights()
	selected_number_node=get_node("CanvasLayer/Base/Number"+str(selected_number))
	var highlight=selected_number_node.get_node("Highlight")
	highlight.self_modulate.a=255

func turn_off_highlights():
	first_number.self_modulate.a=0
	second_number.self_modulate.a=0
	third_number.self_modulate.a=0
	fourth_number.self_modulate.a=0

func pass_correct_code(var s):
	correct_code=s

func check_for_success():
	if(current_code==correct_code):
		_success()

func _success():
	#var nod2=get_node("/root/Node2D/YSort/"+operable_node)
	.set_operable_done()
	._close()

func _process(delta):
	get_input_for_highlight()
	get_input_for_number()
	if(Input.is_action_just_pressed("cancel")):
		._close()
	check_for_success()
