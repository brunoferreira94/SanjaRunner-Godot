extends RigidBody2D

#PERSONAGEM FANTASMA FOI CRIADO COM A INTENÇÃO DE ALINHAR A CAMERA AO PERSONAGEM
#PRINCIPAL, PORÉM, TORNANDO ESSA CAMERA INDEPENDENTE, GARANTINDO QUE ELA PROSSIGA MESMO QUE O PERSONAGEM
#PRINCIPAL PERCA O JOGO

var current_Speed = Vector2(0,0)
var player_Speed = 700
var accel = 5
var pos_parada
var metade_tela_y

func _ready():
	metade_tela_y = get_viewport_rect().size.height/2
	pos_parada = get_node("/root/data").pos_parada
	set_fixed_process(true)
	
func _fixed_process(delta):
	move(player_Speed,accel,delta)
	
func move(speed, accel, delta):
	current_Speed.x = lerp(current_Speed.x, speed, accel * delta)
	
	if get_pos().x > pos_parada[0] and get_pos().x < pos_parada[1]-metade_tela_y:
		set_linear_velocity(Vector2(current_Speed.x-400, 0))
	elif get_pos().x > pos_parada[1]-metade_tela_y:
		set_linear_velocity(Vector2(0, 0))
	else:
		set_linear_velocity(Vector2(current_Speed.x + delta, 0))
