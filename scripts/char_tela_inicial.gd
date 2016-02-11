extends RigidBody2D

var input_states = preload("res://input_states.gd")

var jump_force = 550
var extra_gravity = 400
var raycast_down = null

var PLAYERSTATE_PREV = ""
var PLAYERSTATE = ""
var PLAYERSTATE_NEXT = "ground"

var anim_personagem = null

var pulo = input_states.new("cima")

var anim = ""
var anim_new = ""
var anim_speed = 1.0
var anim_blend = 0.0

func is_on_ground():
	if raycast_down.is_colliding():
		return true
	else:
		return false
		
func _ready():
	raycast_down = get_node("RayCast2D")
	raycast_down.add_exception(self)
	
	set_fixed_process(true)
	set_applied_force(Vector2(0,extra_gravity))
	
	anim_personagem = get_node("rotate/AnimationPlayer")
	
func _fixed_process(delta):
	PLAYERSTATE_PREV = PLAYERSTATE
	PLAYERSTATE = PLAYERSTATE_NEXT
	
	if PLAYERSTATE == "ground":
		ground_state(delta)
	if PLAYERSTATE == "air":
		air_state(delta)
	
	if anim != anim_new:
		anim_new = anim
		anim_personagem.play(anim)

func ground_state(delta):
	anim = "andando"
		
	if is_on_ground():
		if pulo.check() == 1:
			set_axis_velocity(Vector2(0, -jump_force))
	else:
		PLAYERSTATE_NEXT = "air"

func air_state(delta):
	if get_linear_velocity().y > 0:
		anim = "pulando"
	else:
		anim = "pulando"

	if is_on_ground():
		PLAYERSTATE_NEXT = "ground"
