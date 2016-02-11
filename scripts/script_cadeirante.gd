
extends RigidBody2D



func _ready():
	set_process(true)
	
func _process(delta):
	self.move_local_x(4)