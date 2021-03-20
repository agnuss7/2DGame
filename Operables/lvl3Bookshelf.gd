extends "res://Classes/operable_class.gd"


var initial_pos
var new_pos

func _operate():
	._operate()
	var overlay=load("res://Overlays/lvl3Books.tscn").instance()
	overlay.pass_operable(self)
	$'/root/Node2D'.add_child(overlay)

func _ready():
	initial_pos=position
	new_pos=Vector2(initial_pos.x-25,initial_pos.y)
	

func move_away():
	move_now()
	rpc('move_now')

func has_moved():
	position=new_pos

remote func move_now():
	var tween = get_node("Tween")
	tween.interpolate_property(self, "position",
		initial_pos, new_pos, 0.5,
		Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)
	$AudioStreamPlayer.play(0.13)
	tween.start()


