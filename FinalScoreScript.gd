extends Node2D

var names=[]
var scores=[]


func _ready():
	$'names'.text=""

func pass_names(var nn, var ss):
	for i in nn:
		$'names'.text+=str(i)+", "
	var grid=$'GridContainer'
	for i in range(0,ss.size()):
		var a =Label.new()
		a.text="Level "+str(i+1)
		grid.add_child(a)
		var c =Label.new()
		c.text="................................................................................."
		c.size_flags_horizontal=3
		c.clip_text=1
		grid.add_child(c)
		var b =Label.new()
		b.text=str(ss[i])
		grid.add_child(b)
