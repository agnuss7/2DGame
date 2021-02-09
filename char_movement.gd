extends KinematicBody2D

export (int) var speed = 65


enum animations {
	right,
	up,
	down,
	none
}
remote var r_position=Vector2()
remote var r_animations
remote var r_flip


var velocity = Vector2()
enum pose {
	right,
	left,
	up,
	down
}
var current_h=pose.right
var current=pose.right

func get_input():
	velocity = Vector2()
	if Input.is_action_pressed('right'):
		velocity.x += 1
		if current_h==pose.left:
			$Sprite.flip_h=0
			rset('r_flip',0)
		current_h=pose.right
		current=pose.right
		rset('r_animations', animations.right)
	if Input.is_action_pressed('left'):
		velocity.x -= 1
		if current_h == pose.right:
			$Sprite.flip_h=1
			rset('r_flip',1)
		current_h=pose.left
		current=pose.left
		rset('r_animations', animations.right)
	if Input.is_action_pressed('down'):
		velocity.y += 1
		current=pose.down
		rset('r_animations', animations.down)
	if Input.is_action_pressed('up'):
		velocity.y -= 1
		current=pose.up
		rset('r_animations', animations.up)
	velocity = velocity.normalized() * speed
	rset('r_position',position)


func animations():
	if Input.is_action_pressed("right") or Input.is_action_pressed("left"):
		$AnimationPlayer.play("walkingRight",-1,2.0)
	elif Input.is_action_pressed("down"):
		$AnimationPlayer.play("walkingDown",-1,2.0)
	elif Input.is_action_pressed("up"):
		$AnimationPlayer.play("walkingUp",-1,2.0)
	else:
		$AnimationPlayer.stop()
		rset('r_animations', animations.none)
		
	

func set_r_animations():
	$Sprite.flip_h=r_flip
	if r_animations==animations.right:
		$AnimationPlayer.play("walkingRight",-1,2.0)
	elif r_animations==animations.up:
		$AnimationPlayer.play("walkingUp",-1,2.0)
	elif r_animations==animations.down:
		$AnimationPlayer.play("walkingDown",-1,2.0)
	else:
		$AnimationPlayer.stop()

func _ready():
	pass



func _physics_process(delta):
	if is_network_master():
		get_input()
		velocity = move_and_slide(velocity)
		animations()
	else:
		position=r_position
		set_r_animations()
	


