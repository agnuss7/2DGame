extends "res://Classes/overlay_class.gd"

var current_selected=1

var current_row=1

var is_operational=false

var current_code="000000000000000000000"
var correct_code="010000001000000100000"
func get_horizontal_input():
	if Input.is_action_just_pressed("left"):
		if current_selected>1:
			current_selected-=1
		else:
			current_selected=7
	if Input.is_action_just_pressed("right"):
		if current_selected<7:
			current_selected+=1
		else:
			current_selected=1
	change_highlights()

func get_vertical_input():
	if Input.is_action_just_pressed("down"):
		if current_row<3:
			current_row+=1
	if Input.is_action_just_pressed("up"):
		if current_row>1:
			current_row-=1
	change_highlights()

func get_e_input():
	if Input.is_action_just_pressed("operate"):
		var nod=get_node("CanvasLayer/Base/Row"+str(current_row)+"/Highlight"+str(current_selected)+"/Book")
		if (nod.frame==0):
			nod.frame=1
		else:
			nod.frame=0
		change_z()
		make_code()

func change_highlights():
	for i in range(1,4):
		for j in range(1,8):
			if current_row==i and current_selected==j:
				get_node("CanvasLayer/Base/Row"+str(i)+"/Highlight"+str(j)).self_modulate.a=1
			else:
				get_node("CanvasLayer/Base/Row"+str(i)+"/Highlight"+str(j)).self_modulate.a=0
	change_z()
	
func change_z():
	for i in range(1,4):
		for j in range(1,8):
			var nod2=get_node("CanvasLayer/Base/Row"+str(i)+"/Highlight"+str(j))
			var nod=get_node("CanvasLayer/Base/Row"+str(i)+"/Highlight"+str(j)+"/Book")
			if nod.frame==0 and !(current_row==i and current_selected==j):
				nod2.position=Vector2(nod2.position.x,0)
			elif nod.frame==0 and (current_row==i and current_selected==j):
				nod2.position=Vector2(nod2.position.x,0.1)
			elif nod.frame==1:
				nod2.position=Vector2(nod2.position.x,0.2)


func make_code():
	var temp=""
	for i in range(1,4):
		for j in range(1,8):
			temp+=str(get_node("CanvasLayer/Base/Row"+str(i)+"/Highlight"+str(j)+"/Book").frame)
			
	current_code=temp


func check_for_success():
	if current_code==correct_code:
		._close()


func _process(delta):
	if is_operational:
		get_horizontal_input()
		get_vertical_input()
		get_e_input()
		check_for_success()
	else:
		is_operational=true
