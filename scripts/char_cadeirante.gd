extends RigidBody2D

#O input_states serve para importar um script que saberá o estado do botão
#Ex.: se foi pressionado, se está segurando, se soltou e etc.
var input_states = preload("res://scripts/input_states.gd")

#Variáveis para controlar o personagem no chão e no ar
export var player_Speed = 700
var accel = 5
var air_accel = 2
export var jump_force = 420

var raycast_down = null
var current_Speed = Vector2(0,0)
var jumping = 0
var pos_parada

#Variáveis de estado para saber se o personagem está no chão ou no ar
var PLAYERSTATE_PREV = ""
var PLAYERSTATE = ""
var PLAYERSTATE_NEXT = "ground"

#Variável que controla a animação atual do personagem
var anim_personagem = null

#Variável para os efeitos sonoros do personagem
var somPersonagem = null

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
	
	somPersonagem = get_node("somPersonagem")
	pos_parada = get_node("/root/data").pos_parada
	
func _fixed_process(delta):
	
	#Váriavel anterior recebendo atual e a atual
	#recebendo a próxima para controlar o estado (chão ou ar)
	PLAYERSTATE_PREV = PLAYERSTATE
	PLAYERSTATE = PLAYERSTATE_NEXT
	
	#condições para que o estado do personagem receba o estado ar ou chão
	if PLAYERSTATE == "ground":
		ground_state(delta)
	if PLAYERSTATE == "air":
		air_state(delta)
	
	#verifica animação do personagem e atualiza para a nova animação
	if anim != anim_new:
		anim_new = anim
		anim_personagem.play(anim)
		
	move(player_Speed,accel,delta)
	morreu()
	ganhou()
	
#função que analisa a posição do personagem para dar GAME OVER
func morreu():
	var timer = get_parent().get_node("Timer")
	var altura_tela = get_viewport_rect().size.y
	var largura_tela = get_viewport_rect().pos.x
	var voce_perdeu = get_parent().get_node("HUD/voce_perdeu")
	var pause = get_parent().get_node("HUD/pause")
	var pulo = get_parent().get_node("HUD/Botão Pulo")
	
	#se o personagem sair dos limite lateral esquerdo ou inferior, ele perde
	if (get_pos().x < largura_tela or get_pos().y > altura_tela) && voce_perdeu.is_hidden():
		print(get_pos().x,"\t", largura_tela, "\n")
		print(get_pos().y,"\t", altura_tela, "\n")
		pause.hide()
		pulo.hide()
		voce_perdeu.show()
		somPersonagem.play("lose")
		print("Tempo de jogo: ", 60 - timer.get_time_left())
		get_node("/root/data").engrenagemColetada = 0
		get_node("/root/data").papelColetado = 0
		#para a musica quando personagem perder
		get_parent().get_node("Musica").stop()
		#retorna verdadeiro para indicar que o personagem morreu
		return true

#função que verifica se o personagem ganhou
func ganhou():
	if get_pos().x > pos_parada[0] and get_pos().x < pos_parada[1]:
		set_linear_velocity(Vector2(current_Speed.x-400, get_linear_velocity().y))
	elif get_pos().x > pos_parada[1]:
		set_linear_velocity(Vector2(0, get_linear_velocity().y))
		if is_on_ground():
			set_axis_velocity(Vector2(0, -jump_force))
			somPersonagem.play("8-bit-jump")
			jumping = 1
			if !get_parent().get_node("HUD/voce_ganhou").is_visible():
				get_parent().get_node("HUD/voce_ganhou").show()
		else:
			PLAYERSTATE_NEXT = "air"
			
	else:
		set_linear_velocity(Vector2(current_Speed.x, get_linear_velocity().y))

#função responsavel pelo movimento do personagem
func move(speed, accel, delta):
	anim = "andando"
	#lerp calcula a interpolação linear entre current_speed.x e speed
	current_Speed.x = lerp(current_Speed.x, speed, accel * delta)
	set_linear_velocity(Vector2(current_Speed.x, get_linear_velocity().y))

#funcao que verifica a posição de ground do personagem e permite o salto

func ground_state(delta):
	if is_on_ground():
		get_node("Particles2D").set_emitting(true)
		get_node("Particles2D").set_use_local_space(true)
		jumping = 0
		if pulo.check() == 1:
			set_axis_velocity(Vector2(0, -jump_force))
			somPersonagem.play("8-bit-jump")
			jumping = 1
	else:
		PLAYERSTATE_NEXT = "air"

#funçao que verifica a posião de air do personagem e permite o double jump
func air_state(delta):
	get_node("Particles2D").set_emitting(false)
	get_node("Particles2D").set_use_local_space(false)
	if pulo.check() == 1 and (jumping == 1 or jumping == 0):
		set_axis_velocity(Vector2(0, -jump_force))
		somPersonagem.play("8-bit-jump")
		jumping = 2
		
	if get_linear_velocity().y > 0:
		anim = "pulando"
	else:
		anim = "pulando"

	if is_on_ground():
		PLAYERSTATE_NEXT = "ground"
