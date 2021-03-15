extends "res://Classes/statue_class.gd"

remote var clutching=true

func _ready():
	statue_name="Min"
	
func _operate():
	if clutching:
		._operate_super()
		var overlay=load("res://Other/CommentSpace.tscn").instance()
		overlay.pass_operable(self)
		$'/root/Node2D'.add_child(overlay)
		overlay.pass_comments(["The statue is clutching its hand.","There must be a mechanism to open it","The pedestal says Min"])
	else:
		if current_orb==orbs.none:
			._operate_super()
			var overlay=load("res://Other/CommentSpaceBeforeOverlay.tscn").instance()
			var palm=load("res://Overlays/lvl3MinPalm.tscn").instance()
			overlay.pass_operable(self)
			overlay.pass_next_overlay(palm)
			$'/root/Node2D'.add_child(overlay)
			overlay.pass_comments(["There's a newspaper clipping in Min's palm."])
		else:
			._operate()
		
func _operate_with(var item):
	if clutching:
		if (item==3 or item==4 or item==5):
			._operate_super()
			var overlay=load("res://Other/CommentSpace.tscn").instance()
			overlay.pass_operable(self)
			$'/root/Node2D'.add_child(overlay)
			overlay.pass_comments(["The hand is clutched.","It needs to be opened to place the orb."])
			return true
		else:
			return false
	else:
		if (item==3 or item==4 or item==5):
			._operate_with(item)
			return true
		else:
			return false

func unclutch():
	clutching=false
	rset('clutching',false)
