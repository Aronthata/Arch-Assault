extends Node3D
class_name StateMachine
@export var States : Array[Base_State]
@export var Start_state : int
var State: Base_State
func _ready():
	State = States[Start_state]
	State.State_Enter()
	for I : Base_State in States:
		I.State_Machine = self
func _physics_process(delta):
	State.State_Update()
