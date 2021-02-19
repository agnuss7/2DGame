extends "res://Classes/comment_class.gd"

var next_overlay

func end_of_array():
	#var overlay=load(next_overlay).instance()
	
	next_overlay.pass_operable(operable_node)
	get_parent().add_child(next_overlay)
	self.queue_free()

func pass_next_overlay(var o):
	next_overlay=o



# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
