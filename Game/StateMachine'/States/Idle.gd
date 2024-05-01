extends Base_State
class_name Idle
func State_Enter():
	State_Machine.velocity = Vector3.ZERO

func State_Update(INPUT:Vector3):
	if INPUT.x or INPUT.z:
		State_Machine.Change_State(State_Machine.Find_State("Run"))
