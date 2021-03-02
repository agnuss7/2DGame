extends "res://Classes/pick_up_item_class.gd"

func _ready():
	item=2
func _operate():
	._operate()
	var n=$'/root/Node2D'
	n.oil_can=false
	n.rset('oil_can',false)
