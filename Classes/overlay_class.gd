extends Node2D

var operable_node

var control_enabled=true

func _close():
	
	var nod=get_node("/root/Node2D/YSort/"+str(get_tree().get_network_unique_id()))
	#var nod2=get_node("/root/Node2D/YSort/"+operable_node)
	nod.control_enabled=true
	if (operable_node!=null):
		operable_node.rset("is_free",true)
	self.queue_free()
	
func pass_operable(var n):
	operable_node=n
	
func set_operable_done():
	operable_node.rset("is_done",true)

func pause(var time):
	var t = Timer.new()
	t.connect('timeout',self,'play_after_pause')
	t.set_wait_time(time)
	t.set_one_shot(true)
	self.add_child(t)
	t.start()

func play_after_pause():
	pass
