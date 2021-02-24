extends "res://Classes/operable_class.gd"

func _operate():
	._operate()
	var node=get_node("/root/Node2D")
	var overlay=load("res://Other/NoteOverlay.tscn").instance()
	node.add_child(overlay)
	overlay.pass_operable(self)
