extends CharacterBody3D

var speed = 10
var gravity  = 5
@onready var camera = $Camera3D

func _physics_process(delta):
	if Input.is_action_pressed("Forward"):
		velocity.z = speed
	elif Input.is_action_pressed("Backwards"):
		velocity.z = -speed
	else:
		velocity.z = 0
		
	if Input.is_action_pressed("Left"):
		velocity.x = speed
	elif Input.is_action_pressed("Right"):
		velocity.x = -speed
	else:
		velocity.x = 0
	move_and_slide()
