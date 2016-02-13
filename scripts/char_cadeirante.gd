extends RigidBody2D

#O input_states serve para importar um script que saberá o estado do botão
#Ex.: se foi pressionado, se está segurando, se soltou e etc.
var input_states = preload("res://scripts/input_states.gd")

#Variáveis para controlar o personagem no chão e no ar
var player_Speed = 700
var accel = 5
var air_accel = 2
var jump_force = 350
var raycast_down = null
var current_Speed = Vector2(0,0)
var jumping = 0

#Variáveis de estado para saber se o personagem está no chão ou no ar
var PLAYERSTATE_PREV = ""
var PLAYERSTATE = ""
var PLAYERSTATE_NEXT = "ground"

#Variável que controla a animação atual do personagem
var anim_personagem = null

#Variável que recebe o comando de entrada (teclado, mouse touch)
var pulo = input_states.new("cima")

#Variáveis para que a mesma animação não se repita e atrapalhe a animação atual
var anim = ""
var anim_new = ""

#função que vê se o Raycast está colidindo ou não com o chão
func is_on_ground():
	if raycast_down.is_colliding():
		return true
	else:
		return false

func _ready():
	set_fixed_process(true)
	
	#Variável recebendo o Raycast2D e adicionando uma 
	#exceção para não colidir com o personagem
	raycast_down = get_node("RayCast2D")
	raycast_down.add_exception(self)
	
	#Variável recebendo o nó de animação do personagem
	anim_personagem = get_node("AnimationPlayer")
	
func _fixed_process(delta):
	
	#Váriaveil anterior recebendo atual e a atual 
	#recebendo a próxima para controlar o estado (chão ou ar)
	PLAYERSTATE_PREV = PLAYERSTATE
	PLAYERSTATE = PLAYERSTATE_NEXT
	
	#condições para que o estado do personagem receba o estado ar ou chão
	if PLAYERSTATE == "ground":
		ground_state(delta)
	if PLAYERSTATE == "air":
		air_state(delta)
	
	#
	if anim != anim_new:
		anim_new = anim
		anim_personagem.play(anim)
		
	move(player_Speed,accel,delta)

func move(speed, accel, delta):
	anim = "andando"
	current_Speed.x = lerp(current_Speed.x, speed, accel * delta)
	set_linear_velocity(Vector2(current_Speed.x, get_linear_velocity().y))

func ground_state(delta):
		
	if is_on_ground():
		jumping = 0
		if pulo.check() == 1:
			set_axis_velocity(Vector2(0, -jump_force))
			jumping = 1
	else:
		PLAYERSTATE_NEXT = "air"

func air_state(delta):
	if pulo.check() == 1 and (jumping == 1 or jumping == 0):
		set_axis_velocity(Vector2(0, -jump_force))
		jumping = 2
		
	if get_linear_velocity().y > 0:
		anim = "pulando"
	else:
		anim = "pulando"

	if is_on_ground():
		PLAYERSTATE_NEXT = "ground"