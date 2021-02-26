extends "res://Classes/operable_class.gd"

func _operate():
	._operate()
	var node=get_node("/root/Node2D")
	var overlay=load("res://Overlays/lvl2Paper.tscn").instance()
	node.add_child(overlay)
	overlay.pass_operable(self)
