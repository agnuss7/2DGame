extends "res://Classes/pick_up_item_class.gd"

func _ready():
	item=0
func _operate():
	._operate()
	var n=$'/root/Node2D'
	n.iron_key=false
	n.rset('iron_key',false)
