extends "res://Classes/operable_class.gd"

func _operate():
	._operate()
	if (is_first):
		var comment=load("res://Other/CommentSpaceBeforeOverlay.tscn").instance()
		var overlay=load("res://Overlays/lvl3Slider.tscn").instance()
		comment.pass_next_overlay(overlay)
		comment.pass_operable(self)
		$'/root/Node2D'.add_child(comment)
		comment.pass_comments(["There's a slidder puzzle on top of the cabinet","...what's that inside it?"])
		is_first=false
	else:
		var overlay=load("res://Overlays/lvl3Slider.tscn").instance()
		overlay.pass_operable(self)
		$'/root/Node2D'.add_child(overlay)

