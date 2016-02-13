extends RigidBody2D

var current_Speed = Vector2(0,0)
var player_Speed = 700
var accel = 5

func _ready():
 set_fixed_process(true)

func _fixed_process(delta):
	move(player_Speed,accel,delta)
	
func move(speed, accel, delta):
	current_Speed.x = lerp(current_Speed.x, speed, accel * delta)
	set_linear_velocity(Vector2(current_Speed.x, 0))
