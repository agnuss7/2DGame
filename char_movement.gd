extends KinematicBody2D

export (int) var speed = 65

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
		current_h=pose.right
		current=pose.right
	if Input.is_action_pressed('left'):
		velocity.x -= 1
		if current_h == pose.right:
			$Sprite.flip_h=1
		current_h=pose.left
		current=pose.left
	if Input.is_action_pressed('down'):
		velocity.y += 1
		current=pose.down
	if Input.is_action_pressed('up'):
		velocity.y -= 1
		current=pose.up
	velocity = velocity.normalized() * speed


func animations():
	if Input.is_action_pressed("right") or Input.is_action_pressed("left"):
		$AnimationPlayer.play("walkingRight",-1,2.0)
	elif Input.is_action_pressed("down"):
		$AnimationPlayer.play("walkingDown",-1,2.0)
	elif Input.is_action_pressed("up"):
		$AnimationPlayer.play("walkingUp",-1,2.0)
	else:
		$AnimationPlayer.stop()
	

func _ready():
	pass

func _physics_process(delta):
	get_input()
	velocity = move_and_slide(velocity)
	animations()
	#print(position)


