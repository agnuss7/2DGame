extends Node2D

export (bool) var wasd
export (String) var explanation_wasd
export (bool) var ws
export (String) var explanation_ws
export (bool) var ad
export (String) var explanation_ad
export (bool) var e
export (String) var explanation_e

func _ready():
	var node=$'CanvasLayer/HBoxContainer'
	if wasd:
		var pic=Sprite.new()
		pic.texture=load("res://sprites/wasd.png")
		pic.scale=Vector2(0.05,0.05)
		node.add_child(pic)
		var label=Label.new()
		label.text=explanation_wasd
		node.add_child(label)
