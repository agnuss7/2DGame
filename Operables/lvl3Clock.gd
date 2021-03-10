extends "res://Classes/operable_class.gd"

func _ready():
	pass 

func _operate():
	._operate()
	var overlay=load("res://Overlays/lvl3Clock.tscn").instance()
	overlay.pass_operable(self)
	$'/root/Node2D'.add_child(overlay)

#func _process(delta):
#	pass
