extends KinematicBody2D

var is_moving_left = true

var gravity = 10
var velocity = Vector2(0,0)
var speed = 32

export (int) var health := 30

func _process(_delta):
	move_character()

func move_character():
	velocity.x = -speed if is_moving_left else speed
	
	velocity.y += gravity
	
	velocity = move_and_slide(velocity, Vector2.UP)
	

	

func handle_hit(damage: int):
	health -= damage
	print("enemy was hit, current health: " + str(health)) 
	if health <= 0:
		queue_free()
	
