extends Base_State
class_name Run
var speed = 100

func State_Update(INPUT):
	if INPUT.y > 0:
		#jump
		pass
	elif INPUT.x != 0 && INPUT.z != 0:
		State_Machine.velocity = INPUT*speed
		pass
	else:
		State_Machine.Change_State(State_Machine.Find_State("Idle"))
	State_Machine.move_and_slide()
