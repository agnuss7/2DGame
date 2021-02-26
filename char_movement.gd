extends KinematicBody2D

### movement functions -----------------------

export (int) var speed = 65

var control_enabled=true

enum animations {
	right,
	up,
	down,
	none
}
remote var r_position=Vector2(2,2)
remote var r_animations
remote var r_flip=1


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

### --------------------

func set_area_position():
	var area_col=get_node("Area2D/CollisionShape2D")
	if current==pose.right:
		area_col.position=Vector2(16,0)
	elif current==pose.left:
		area_col.position=Vector2(-16,0)
	elif current==pose.down:
		area_col.position=Vector2(0,16)
	else:
		area_col.position=Vector2(0,-16)

var inventory_mode=false
var inventory_number=0

func no_effect():
	control_enabled=false
	var overlay=load("res://Other/CommentSpace.tscn").instance()
	$'/root/Node2D'.add_child(overlay)
	overlay.pass_operable(self)
	overlay.pass_comments(["","There's no effect"])
	inventory_mode=false
	inventory_number=0
	$'InventoryIcon'.texture=null


func get_operate_with_input():
	if Input.is_action_just_pressed("operate"):
		var area=get_node("Area2D")
		var list=area.get_overlapping_bodies()
		for bod in list:
			if bod.has_method("_operate_with") and bod.is_free and !bod.is_done:
				if (bod._operate_with(Inventory.inventory[inventory_number])):
					control_enabled=false
					inventory_mode=false
					inventory_number=0
					$'InventoryIcon'.texture=null
					return
				else:
					no_effect()
					return
		no_effect()

func get_inventory_input():
	if Input.is_action_just_pressed("inventory"):
		if !inventory_mode:
			if !Inventory.inventory.empty():
				inventory_mode=true
				$'InventoryIcon'.texture=load(str(Inventory.global_inventory[Inventory.inventory[inventory_number]].texture))
		else:
			if(inventory_number<Inventory.inventory.size()-1):
				inventory_number+=1
				$'InventoryIcon'.texture=load(str(Inventory.global_inventory[Inventory.inventory[inventory_number]].texture))
			else:
				inventory_number=0
				$'InventoryIcon'.texture=load(str(Inventory.global_inventory[Inventory.inventory[inventory_number]].texture))
	if Input.is_action_just_pressed("cancel") and inventory_mode:
		inventory_mode=false
		inventory_number=0
		$'InventoryIcon'.texture=null

func get_operate_input():
	if Input.is_action_just_pressed("operate"):
		var area=get_node("Area2D")
		var list=area.get_overlapping_bodies()
		for bod in list:
			if bod.has_method("_operate") and bod.is_free and !bod.is_done:
				bod._operate()
				print(bod.is_done)
				control_enabled=false
				return

func _ready():
	pass

remote func init():
	position=$'/root/Node2D'.places[LevelLoader.line_number]
	print(position)
		
func _physics_process(delta):
	if is_network_master():
		if control_enabled:
			get_input()
			velocity = move_and_slide(velocity)
			animations()
			set_area_position()
			if (!inventory_mode):
				get_operate_input()
			else:
				get_operate_with_input()
			get_inventory_input()
	else:
		position=r_position
		set_r_animations()
	


