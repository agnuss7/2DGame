extends "res://Classes/operable_class.gd"

func _operate():
	if is_first:
		is_first=false
		._operate()
		var comment=load("res://Other/CommentSpaceBeforeOverlay.tscn").instance()
		var overlay=load("res://Overlays/lvl3Pipe_puzzle.tscn").instance()
		comment.pass_operable(self)
		comment.pass_next_overlay(overlay)
		$'/root/Node2D'.add_child(comment)
		comment.pass_comments(["There's an orb in a bottle that can't be reached.","Connect the water source with the bottom of the bottle."])
	else:
		._operate()
		var overlay=load("res://Overlays/lvl3Pipe_puzzle.tscn").instance()
		overlay.pass_operable(self)
		$'/root/Node2D'.add_child(overlay)
