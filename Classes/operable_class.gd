extends StaticBody2D

remote var is_free=true
remote var is_done=false
remote var is_first=true
# Declare member variables here. Examples:
# var a = 2
# var b = "text"
func _operate():
	rset("is_free", false)
	

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
