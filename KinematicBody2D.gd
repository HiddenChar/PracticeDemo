extends KinematicBody2D

const UP = Vector2(0,-1)
const GRAVITY = 20
const MAXFALLSPEED = 200
const MAXSPEED = 80
const JUMPFORCE = 300
const ACCEL = 10

var motion = Vector2()
export (float) var speed := 200.0
var facing_right = true

onready var weapon = $Weapon

func _physics_process(delta: float) -> void:
	
	
	
	motion.y += GRAVITY
	if motion.y > MAXFALLSPEED:
		motion.y = MAXFALLSPEED
	
	if facing_right == true:
		$Sprite.scale.x = 1
	else:
		$Sprite.scale.x = -1
	
	motion.x = clamp(motion.x,-MAXSPEED,MAXSPEED)
	
	if Input.is_action_pressed("right"):
		motion.x += ACCEL
		facing_right = true
		$AnimationPlayer.play("Run")
	elif Input.is_action_pressed("left"):
		motion.x -= ACCEL
		facing_right = false
		$AnimationPlayer.play("Run")
	else: 
		motion.x = lerp(motion.x,0,0.2)
		$AnimationPlayer.play("Idle")
		
	if is_on_floor	():
		if Input.is_action_just_pressed("jump"):
			motion.y = -JUMPFORCE
			
	if facing_right == true:
		$Weapon.scale.x = 1
	else:
		$Weapon.scale.x = -1
	

	
			
	motion = move_and_slide(motion,UP)
		
func _unhandled_input(event: InputEvent) -> void:

	
	if event.is_action_pressed("attack"):
		weapon.attack()
		




