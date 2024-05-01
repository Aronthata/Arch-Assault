extends Base_State
class_name Run
var speed = 10

func _physics_process(delta):
	if Input.is_action_pressed("Forward"):
		State_Machine.velocity.z = speed
	if Input.is_action_pressed("Backwards"):
		State_Machine.velocity.z = -speed
	if Input.is_action_pressed("Left"):
		State_Machine.velocity.x = speed
	if Input.is_action_pressed("Right"):
		State_Machine.velocity.x = -speed
