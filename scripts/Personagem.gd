extends RigidBody2D

#O input_states serve para importar um script que saberá o estado do botão
#Ex.: se foi pressionado, se está segurando, se soltou e etc.
var input_states = preload("res://scripts/InputStates.gd")

#Variáveis para controlar o personagem no chão e no ar
export var player_Speed = 700
var accel = 5
var airAccel = 2
export var jumpForce = 700

var raycastDown = null
var currentSpeed = Vector2(0,0)
var jumping = 0
export var posParada = 11000

#Variáveis de estado para saber se o personagem está no chão ou no ar

var alturaTela =0
var larguraTela = 0
var soltouBotao = false


#Variável que controla a animação atual do personagem
var animPersonagem = null

#Variável para os efeitos sonoros do personagem
var somPersonagem = null

#Variável que recebe o comando de entrada (teclado, mouse touch)
var pulo = input_states.new("cima")

#Variáveis para que a mesma animação não se repita e atrapalhe a animação atual
var anim = ""
var animNew = ""
var groundState = false


#função que vê se o Raycast está colidindo ou não com o chão
func is_on_ground():
	if raycastDown.is_colliding():
		return true
	else:
		return false

func _ready():
	set_fixed_process(true)
	
	#Variável recebendo o Raycast2D e adicionando uma 
	#exceção para não colidir com o personagem
	raycastDown = get_node("RayCast2D")
	raycastDown.add_exception(self)
	alturaTela = get_viewport_rect().size.height
	larguraTela = get_viewport_rect().size.width
	#Variável recebendo o nó de animação do personagem
	animPersonagem = get_node("AnimationPlayer")	
	somPersonagem = get_node("somPersonagem")
	self.set_gravity_scale(30)
	
func _fixed_process(delta):
	
	
	#Váriavel anterior recebendo atual e a atual
	#recebendo a próxima para controlar o estado (chão ou ar)
	
	
	#condições para que o estado do personagem receba o estado ar ou chão
	check_pulo(delta)
	
	#verifica animação do personagem e atualiza para a nova animação
	if anim != animNew:
		animNew = anim
		animPersonagem.play(anim)
		
	move(player_Speed,accel,delta)
	morreu()
	
#função que analisa a posição do personagem para dar GAME OVER
func morreu():
	var timer = get_parent().get_node("Timer")
	
	
	var voce_perdeu = get_parent().get_node("HUD/voce_perdeu")
	var pause = get_parent().get_node("HUD/pause")
	
	#se o personagem sair dos limite lateral esquerdo ou inferior, ele perde
	if (get_pos().x < 0 or get_pos().y > alturaTela) && voce_perdeu.is_hidden():
		pause.hide()
		voce_perdeu.show()
		somPersonagem.play("lose")
		print("Tempo de jogo: ", 60 - timer.get_time_left())
		#para a musica quando personagem perder
		get_parent().get_node("Musica").stop()
		#retorna verdadeiro para indicar que o personagem morreu
		return true

#função responsavel pelo movimento do personagem
func move(speed, accel, delta):
	anim = "andando"
	#lerp calcula a interpolação linear entre currentSpeed.x e speed
	currentSpeed.x = lerp(currentSpeed.x, speed, accel * delta)
	if get_pos().x > posParada and get_pos().x < posParada+1000:
		set_linear_velocity(Vector2(currentSpeed.x-400, get_linear_velocity().y))
	elif get_pos().x > posParada+1000:
		set_linear_velocity(Vector2(0, get_linear_velocity().y))
		anim = "pulando"
	else:
		set_linear_velocity(Vector2(currentSpeed.x, get_linear_velocity().y))

#funcao que verifica a posição de ground do personagem e permite o salto
func check_pulo(delta):		
	if is_on_ground():
		if groundState == true:
			jumping = 0		
		if pulo.check() == 1 and jumping == 0:
			set_axis_velocity(Vector2(0, -jumpForce))
			somPersonagem.play("8-bit-jump")
			jumping = 1
	else:
		groundState = false
		if pulo.check() == 1 and jumping < 2:
			set_axis_velocity(Vector2(0, -jumpForce))
			somPersonagem.play("8-bit-jump")
			jumping += 1
		
		if get_linear_velocity().y < 0:
			anim = "pulando"
		else:
			anim = "andando"
			groundState = true
	

func get_player_speed():
	return player_Speed
	
func get_player_accel():
	return accel