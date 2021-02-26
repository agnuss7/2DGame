extends "res://Classes/operable_class.gd"

remote var is_ignited=false

func _operate():
	if !is_ignited:
		._operate()
		var comment=load("res://Other/CommentSpace.tscn").instance()
		comment.pass_operable(self)
		$'/root/Node2D'.add_child(comment)
		comment.pass_comments(["","The machine seems to be off.","There's a space to insert the key"])
	else:
		._operate()
		var puzzle=load("res://Overlays/lvl2Lever_puzzle.tscn").instance()
		puzzle.pass_operable(self)
		$"/root/Node2D".add_child(puzzle)
		
	
func _operate_with(nr):
	if(nr==0):
		._operate()
		var comment=load("res://Other/CommentSpace.tscn").instance()
		comment.pass_operable(self)
		$'/root/Node2D'.add_child(comment)
		comment.pass_comments(["","The key fits.","The machine is now on."])
		is_ignited=true
		rset('is_ignited',true)
		Inventory.inventory.erase(0)
		Inventory.rset('inventory',Inventory.inventory)
		return true
	else:
		return false
