extends "res://Classes/operable_class.gd"

var statue_name

enum orbs {
	none,
	green,
	blue,
	red
}
var current_orb=orbs.none

func _operate():
	._operate()
	var overlay=load("res://Other/CommentSpace.tscn").instance()
	overlay.pass_operable(self)
	$'/root/Node2D'.add_child(overlay)
	if(current_orb==0):
		overlay.pass_comments(["The statue has its hand open like something should be placed there" ,"The pedestal says "+statue_name])
	else:
		overlay.pass_comments(["The statue is holding a "+Inventory.global_inventory[int(current_orb)+2].name,"Picked up "+Inventory.global_inventory[int(current_orb)+2].name])
		Inventory.inventory.append(int(current_orb)+2)
		Inventory.rset('inventory',Inventory.inventory)
		current_orb=orbs.none

func _operate_with(var item):
	if(item==3 or item==4 or item==5):
		._operate()
		if current_orb==orbs.none:
			current_orb=item-2
			Inventory.inventory.erase(item)
			Inventory.rset('inventory',Inventory.inventory)
			var overlay=load("res://Other/CommentSpace.tscn").instance()
			overlay.pass_operable(self)
			$'/root/Node2D'.add_child(overlay)
			overlay.pass_comments(["Placed orb into hand"])
		else:
			var overlay=load("res://Other/CommentSpace.tscn").instance()
			overlay.pass_operable(self)
			$'/root/Node2D'.add_child(overlay)
			overlay.pass_comments(["The statue is already holding an orb."])
		return true
	else:
		return false





func _operate_super():
	._operate()
