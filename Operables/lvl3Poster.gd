extends "res://Classes/simple_overlay_class.gd"

remote var is_operable=false

func _ready():
	res="res://Overlays/lvl3Poster.tscn"

func _operate():
	if is_operable:
		._operate()
