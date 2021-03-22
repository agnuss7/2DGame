extends Node2D

enum direction {
	none,
	right,
	left,
	up,
	down
}
var current_direction=direction.none
const speed=1


func move_right():
	position=Vector2(position.x+speed,position.y)
	if $East.overlaps_body($'../borders/base'):
		position=Vector2(position.x-speed,position.y)
		current_direction=direction.none
		$'../../slide_audio'.play(0.36)
	for i in range(0,6):
		var node=get_node("../cube"+str(i))
		var area=get_node("../cube"+str(i)+"/West")
		if $East.overlaps_area(area):
			position=Vector2(position.x-speed,position.y)
			if node.current_direction==direction.none:
				current_direction=direction.none
				$'../../slide_audio'.play(0.36)
	
	
func move_down():
	position=Vector2(position.x,position.y+speed)
	if $South.overlaps_body($'../borders/base'):
		position=Vector2(position.x,position.y-speed)
		current_direction=direction.none
		$'../../slide_audio'.play(0.36)
	for i in range(0,6):
		var node=get_node("../cube"+str(i))
		var area=get_node("../cube"+str(i)+"/North")
		if $South.overlaps_area(area):
			position=Vector2(position.x,position.y-speed)
			if node.current_direction==direction.none:
				current_direction=direction.none
				$'../../slide_audio'.play(0.36)

func move_up():
	position=Vector2(position.x,position.y-speed)
	if $North.overlaps_body($'../borders/base'):
		position=Vector2(position.x,position.y+speed)
		current_direction=direction.none
		$'../../slide_audio'.play(0.36)
	for i in range(0,6):
		var node=get_node("../cube"+str(i))
		var area=get_node("../cube"+str(i)+"/South")
		if $North.overlaps_area(area):
			position=Vector2(position.x,position.y+speed)
			if node.current_direction==direction.none:
				current_direction=direction.none
				$'../../slide_audio'.play(0.36)
			
			
func move_left():
	position=Vector2(position.x-speed,position.y)
	if $West.overlaps_body($'../borders/base'):
		position=Vector2(position.x+speed,position.y)
		current_direction=direction.none
		$'../../slide_audio'.play(0.36)
	for i in range(0,6):
		var node=get_node("../cube"+str(i))
		var area=get_node("../cube"+str(i)+"/East")
		if $West.overlaps_area(area):
			position=Vector2(position.x+speed,position.y)
			if node.current_direction==direction.none:
				current_direction=direction.none
				$'../../slide_audio'.play(0.36)
			
			
func _process(delta):
	match current_direction:
		direction.none:
			pass
		direction.right:
			move_right()
		direction.down:
			move_down()
		direction.up:
			move_up()
		direction.left:
			move_left()
