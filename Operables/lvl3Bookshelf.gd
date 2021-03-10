extends "res://Classes/operable_class.gd"


func _operate():
	._operate()
	var overlay=load("res://Overlays/lvl3Books.tscn").instance()
	overlay.pass_operable(self)
	$'/root/Node2D'.add_child(overlay)
