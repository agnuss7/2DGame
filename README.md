# Multiplayer 2D puzzle game

## Movement

```gdscript
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
```

current_h wasn't needed, since flip_h could've recorded how a sprite is facing horizontally. Knowing where the character is facing will probably be useful in the future when interaction with objects is implemented.

## Walking animations
After creating the needed animations from a [sprite sheet](https://www.deviantart.com/lightningtopaz/art/Moltres-gijinka-835037518) coding it is easy:
```gdscript
func animations():
	if Input.is_action_pressed("right") or Input.is_action_pressed("left"):
		$AnimationPlayer.play("walkingRight",-1,2.0)
	elif Input.is_action_pressed("down"):
		$AnimationPlayer.play("walkingDown",-1,2.0)
	elif Input.is_action_pressed("up"):
		$AnimationPlayer.play("walkingUp",-1,2.0)
	else:
		$AnimationPlayer.stop()
```

## Camera stopping at the border of the background
In Godot cameras have built in limits when to stop scrolling, so we could use that
```gdscript
func set_limits():
	var nod=get_node("../Background")
	var rect=nod.get_rect()
	limit_bottom=nod.position.y+rect.end.y*nod.scale.y
	limit_left=nod.position.x-rect.end.x*nod.scale.x
	limit_right=nod.position.x+rect.end.x*nod.scale.x
	limit_top=nod.position.y-rect.end.y*nod.scale.y
```
## Multiplayer - synchronized walking
Used [this project](https://github.com/GDQuest/godot-demos/tree/master/2018/07-30-2018-multiplayer-high-level-api) a lot to help get started with multiplayer, used rset in char_movement.gd to sync player movements.

## Classes - operables and overlays
Tried classes - or more like inheritance of scripts. It will be useful with what I call operables (objects in the game one can interact with) and overlays (pop-ups where you do stuff i. e. solve a puzzle)
```gdscript
extends "res://Classes/operable_class.gd"

func _operate():
	._operate()
	var node=get_node("/root/Node2D")
	var overlay=load("res://scenes/TrialOverlay.tscn").instance()
	node.add_child(overlay)
	overlay.pass_operable_name(self)
	overlay.pass_correct_code("9999")
```
