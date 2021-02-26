extends "res://Classes/operable_class.gd"

var item

func _operate():
	var overlay=load("res://Other/CommentSpace.tscn").instance()
	$'/root/Node2D'.add_child(overlay)
	overlay.pass_comments(["","Picked up "+Inventory.global_inventory[item].name])
	self.queue_free()
	rpc('remove')
	Inventory.inventory.append(item)
	Inventory.rset('inventory',Inventory.inventory)

remote func remove():
	self.queue_free()
