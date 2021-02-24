extends "res://Classes/operable_class.gd"


# Declare member variables here. Examples:
# var a = 2

func _operate():
	._operate()
	var node=get_node("/root/Node2D")
	
	var overlay=load("res://Other/CommentSpaceBeforeOverlay.tscn").instance()
	var overlay2=load("res://scenes/TrialOverlay.tscn").instance()
	overlay2.pass_correct_code("4312")
	if(is_first):
		node.add_child(overlay)
		overlay.pass_operable(self)
		overlay.pass_next_overlay(overlay2)
		overlay.pass_comments(["","There's a number lock bolted to the wall"])
		is_first=false
	else:
		node.add_child(overlay2)
		overlay2.pass_operable(self)
	#overlay.pass_correct_code("9999")
func set_done():
	.set_done()
	var door=get_node("/root/Node2D/YSort/Door")
	door.unlock()

remote func set_lock_done():
	get_node("Sprite").frame=0
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
