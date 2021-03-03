extends "res://Classes/operable_class.gd"

remote var card_read=false

func _operate():
	._operate()
	if !card_read:
		var overlay=load("res://Other/CommentSpace.tscn").instance()
		overlay.pass_operable(self)
		$'/root/Node2D'.add_child(overlay)
		overlay.pass_comments(["","The panel is not operational.","There's a card reader"])
	else:
		var overlay=load("res://Overlays/password.tscn").instance()
		overlay.pass_operable(self)
		$'/root/Node2D'.add_child(overlay)
		
func _operate_with(nr):
	if(nr==1):
		._operate()
		card_read=true
		rset('card_read',true)
		var overlay=load("res://Other/CommentSpace.tscn").instance()
		overlay.pass_operable(self)
		$'/root/Node2D'.add_child(overlay)
		overlay.pass_comments(["","Swipping the card at the card reader activated the panel.","A password can now be enterred"])
		Inventory.inventory.erase(1)
		Inventory.rset('inventory',Inventory.inventory)
		return true
	else:
		return false
