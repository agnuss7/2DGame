extends "res://Classes/operable_class.gd"

remote var rusted=true

func _operate():
	._operate()
	if rusted:
		var over=load("res://Other/CommentSpace.tscn").instance()
		over.pass_operable(self)
		$'/root/Node2D'.add_child(over)
		over.pass_comments(["","The skeleton is clutching something","But its wrist is rusted, you can't open it"])
	else:
		var node=get_node("/root/Node2D")
		var overlay=load("res://Overlays/lvl2Humours.tscn").instance()
		node.add_child(overlay)
		overlay.pass_operable(self)
		
func _operate_with(nr):
	if(nr==2):
		rusted=false
		rset('rusted',false)
		var over=load("res://Other/CommentSpace.tscn").instance()
		over.pass_operable(self)
		$'/root/Node2D'.add_child(over)
		over.pass_comments(["","The rusted hand can be opened","It was clutching a poster"])
		Inventory.inventory.erase(2)
		Inventory.rset('inventory',Inventory.inventory)
		return true
	else:
		return false
