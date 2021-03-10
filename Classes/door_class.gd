extends "res://Classes/operable_class.gd"

remote var is_open=false

func _operate():
	._operate()
	if !is_open:
		var node=get_node("/root/Node2D")
		var overlay=load("res://Other/CommentSpace.tscn").instance()
		overlay.pass_operable(self)
		node.add_child(overlay)
		overlay.pass_comments(["The door is locked."])
	else:
		LevelLoader.rpc('next_level')
		print(NeetWork.players)
		LevelLoader.next_level()

func unlock():
	is_open=true
	rset('is_open',true)
