extends "res://Classes/operable_class.gd"


# Declare member variables here. Examples:
# var a = 2

func _operate():
	._operate()
	var node=get_node("/root/Node2D")
	var overlay=load("res://Other/CommentSpace.tscn").instance()
	#var overlay=load("res://scenes/TrialOverlay.tscn").instance()
	node.add_child(overlay)
	overlay.pass_operable(self)
	overlay.pass_comments(["","hi","How u do"])
	#overlay.pass_correct_code("9999")
# Called when the node enters the scene tree for the first time.
func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
