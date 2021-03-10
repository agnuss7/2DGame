extends "res://Classes/level_class.gd"

func _ready():
	places=[Vector2(0,0),Vector2(20,0),Vector2(40,0)]

remote func sync_level(var id):
	.sync_level(id)
