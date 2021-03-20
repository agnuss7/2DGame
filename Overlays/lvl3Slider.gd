extends "res://Classes/overlay_class.gd"

var final_direction

func cubes_are_stopped():
	var are_stopped=true
	for i in range(0,6):
		var node=get_node("CanvasLayer/cube"+str(i))
		if node.current_direction!=0:
			return false
	return true

func move_cubes():
	if(Input.is_action_just_pressed("right") and final_direction!=1):
		final_direction=1
		for i in range(0,6):
			get_node("CanvasLayer/cube"+str(i)).current_direction=1
	if(Input.is_action_just_pressed("down") and final_direction!=4):
		final_direction=4
		for i in range(0,6):
			get_node("CanvasLayer/cube"+str(i)).current_direction=4
	if(Input.is_action_just_pressed("left") and final_direction!=2):
		final_direction=2
		for i in range(0,6):
			get_node("CanvasLayer/cube"+str(i)).current_direction=2
	if(Input.is_action_just_pressed("up") and final_direction!=3):
		final_direction=3
		for i in range(0,6):
			get_node("CanvasLayer/cube"+str(i)).current_direction=3

func check_for_success():
	var list = $'CanvasLayer/FinishArea'.get_overlapping_areas()
	if $'CanvasLayer/cube0/West' in list:
		$'CanvasLayer/cube0/Sprite'.self_modulate.a=0
		control_enabled=false
		$AudioStreamPlayer.play()
		pause(0.7)

func play_after_pause():
	operable_node.set_done()
	._close()
	Inventory.add_item(3)
	var overlay=load("res://Other/CommentSpace.tscn").instance()
	overlay.pass_operable(operable_node)
	$'/root/Node2D'.add_child(overlay)
	overlay.pass_comments(["The orb fell out.","Picked up Green orb."])

func _process(delta):
	if control_enabled:
		if(cubes_are_stopped()):
			move_cubes()
		if Input.is_action_just_pressed("cancel"):
			._close()
		check_for_success()
