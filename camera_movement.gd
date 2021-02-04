extends Camera2D


# Called when the node enters the scene tree for the first time.
func _ready():
	set_limits()
	
func set_limits():
	var nod=get_node("../Background")
	var rect=get_node("../Background").get_rect()
	limit_bottom=nod.position.y+rect.end.y*nod.scale.y
	limit_left=nod.position.x-rect.end.x*nod.scale.x
	limit_right=nod.position.x+rect.end.x*nod.scale.x
	limit_top=nod.position.y-rect.end.y*nod.scale.y
	print(nod.region_rect)

func _process(delta):
	position=get_node("../YSort/KinematicBody2D").position


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
