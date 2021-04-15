extends KinematicBody2D

var gravity = 100	
var jumpForce = 100
var speed = 100

var velocity = Vector2()


onready var sprite = get_node("Sprite")

func _process(delta):
	velocity.x = 0
	
	
	if Input.is_action_pressed("ui_left"):
		velocity.x -= speed
	if Input.is_action_pressed("ui_right"):
		velocity.x += speed

	if velocity.x > 0:
		sprite.flip.h = true


 move_and_slide(velocity, Vector2.UP)
