extends Area2D

var time=0
remote var done=false

func is_standing():
	var player=get_node("../"+str(get_tree().get_network_unique_id()))
	var list=self.get_overlapping_bodies()
	if player in list:
		return true
	else:
		return false
	
func waited():
	var overlay=load("res://Other/CommentSpace.tscn").instance()
	$'/root/Node2D'.add_child(overlay)
	overlay.pass_comments(["There was a clicking somewhere."])
	
func _process(delta):
	if !done:
		if is_standing():
			time+=delta
		else:
			time=0
		if time>4:
			done=true
			rset('done',true)
			waited()
