extends StaticBody2D

remote var is_free=true
remote var is_done=false
var is_first=true

func _operate():
	rset("is_free", false)
	
func set_done():
	is_done=true
	rset("is_done",true)

func _ready():
	pass # Replace with function body.

