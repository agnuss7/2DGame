extends "res://Classes/overlay_class.gd"

func _process(delta):
	if(Input.is_action_just_pressed("cancel")):
		._close()
