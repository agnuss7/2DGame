extends Node2D

var operable_node

func _close():
	
	var nod=get_node("/root/Node2D/YSort/"+str(get_tree().get_network_unique_id()))
	#var nod2=get_node("/root/Node2D/YSort/"+operable_node)
	nod.control_enabled=true
	operable_node.rset("is_free",true)
	self.queue_free()
	
func pass_operable(var n):
	operable_node=n
	
func set_operable_done():
	operable_node.rset("is_done",true)
