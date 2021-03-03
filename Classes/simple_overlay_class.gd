extends "res://Classes/operable_class.gd"

var res

func _operate():
	._operate()
	var node=get_node("/root/Node2D")
	var overlay=load(res).instance()
	node.add_child(overlay)
	overlay.pass_operable(self)
