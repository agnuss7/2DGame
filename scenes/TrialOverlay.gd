extends "res://Classes/four_digit_lock_class.gd"

func _success():
	._success()
	operable_node.get_node("Sprite").frame=0
	operable_node.rpc('set_lock_done')
	
