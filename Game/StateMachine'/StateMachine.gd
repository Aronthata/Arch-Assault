extends Node3D
class_name StateMachine
@export var States : Array[Base_State]
@export var State : int
func _ready():
	for I : Base_State in States:
		I.State_Machine = self
	States[State].State_Enter()
func _physics_process(delta):
	var INPUT = Vector3(Input.get_axis("Left", "Right"), 0, Input.get_axis("Backwards", "Forward")).normalized()
	States[State].State_Update(INPUT)
func Change_State(state:Base_State):
	States[State].State_Exit()
	States[State] = state
	States[State].State_Enter()
	
func Find_State(Name:String):
	for I:int in range(States.size()-1):
		print(States[I].resource_name)
		if States[I].resource_name == Name:
			return I
			
