extends CharacterBody3D

var speed = 1000
var gravity  = 5
var settiing = 0.1
var sensitivity = 0.01
@onready var camera = $Camera3D


func _enter_tree():
	set_multiplayer_authority(name.to_int())

func _ready():
	camera.current = is_multiplayer_authority()
	
	Input.mouse_mode = Input.MOUSE_MODE_CAPTURED
func _unhandled_input(event):
	if event is InputEventMouseMotion:
		rotation.y += -event.relative.x*sensitivity
		rotation.x = clamp(rotation.x+event.relative.y*sensitivity, deg_to_rad(-70), deg_to_rad(70))
func _physics_process(delta):
	if is_multiplayer_authority():
		
		
		if Input.is_action_just_pressed("Quit"):
			$"../".exit_game(name.to_int())
			queue_free()
			get_tree().quit()
		
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
		velocity = ((transform.basis * velocity.normalized()*speed)*delta)*Vector3(1,0,1)
		move_and_slide()
