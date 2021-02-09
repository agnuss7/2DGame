extends Camera2D


# Called when the node enters the scene tree for the first time.
func _ready():
	set_limits()
	
func set_limits():
	var nod=get_node("/root/Node2D/Background")
	var rect=nod.get_rect()
	limit_bottom=nod.position.y+rect.end.y*nod.scale.y
	limit_left=nod.position.x-rect.end.x*nod.scale.x
	limit_right=nod.position.x+rect.end.x*nod.scale.x
	limit_top=nod.position.y-rect.end.y*nod.scale.y
	print(nod.region_rect)

func return_master_position():
	var nodes=get_node("/root/Node2D/YSort").get_children()
	for node in nodes:
		if(int(node.name[0])>0 and node.is_network_master()):
			return node.position
	return get_node("../Background").position


func _process(delta):
	position=return_master_position()
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
