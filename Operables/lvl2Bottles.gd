extends "res://Classes/operable_class.gd"

remote var code_complete=false


func _operate():
	if !code_complete:
		._operate()
		var overlay=load("res://Overlays/lvl2Planet_puzzle.tscn").instance()
		overlay.pass_operable(self)
		$'/root/Node2D'.add_child(overlay)
	else:
		._operate()
		var overlay=load("res://Overlays/lvl2MathHint.tscn").instance()
		overlay.pass_operable(self)
		$'/root/Node2D'.add_child(overlay)

func set_code_complete():
	code_complete=true
	rset('code_complete',true)
