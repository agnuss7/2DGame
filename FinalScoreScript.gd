extends Node2D

func _ready():
	$'names'.text="Players: "

remote func pass_names(var nn, var ss):
	for i in range(0,nn.size()):
		$'names'.text+=str(nn[i])
		if (i==nn.size()-1):
			$'names'.text+=""
		elif (i==nn.size()-2):
			$'names'.text+=" and "
		else:
			$'names'.text+=", "
		
	var grid=$'GridContainer'
	var total=0
	for i in range(0,ss.size()):
		total+=int(ss[i])
		var a =Label.new()
		a.text="Level "+str(i+1)
		grid.add_child(a)
		var c =Label.new()
		c.text="................................................................................."
		c.size_flags_horizontal=3
		c.clip_text=1
		grid.add_child(c)
		var b =Label.new()
		var h=int(ss[i]/3600)
		var mins=int((ss[i]-h*3600)/60)
		var secs=int(ss[i]-60*mins-h*3600)
		if h>0:
			b.text='%02d'%h+":"
		b.text+='%02d'%mins+":"+'%02d'%secs
		grid.add_child(b)
	var a =Label.new()
	a.text="Total"
	grid.add_child(a)
	var c =Label.new()
	c.text="................................................................................."
	c.size_flags_horizontal=3
	c.clip_text=1
	grid.add_child(c)
	var b =Label.new()
	var h=int(total/3600)
	var mins=int((total-h*3600)/60)
	var secs=int(total-60*mins-h*3600)
	if h>0:
		b.text='%02d'%h+":"
	b.text+='%02d'%mins+":"+'%02d'%secs
	grid.add_child(b)
