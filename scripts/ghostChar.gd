extends RigidBody2D

#PERSONAGEM FANTASMA FOI CRIADO COM A INTENÇÃO DE ALINHAR A CAMERA AO PERSONAGEM
#PRINCIPAL, PORÉM, TORNANDO ESSA CAMERA INDEPENDENTE, GARANTINDO QUE ELA PROSSIGA MESMO QUE O PERSONAGEM
#PRINCIPAL PERCA O JOGO

var current_Speed = Vector2(0,0)
var player_Speed = 700
var accel = 5

func _ready():
 set_fixed_process(true)

func _fixed_process(delta):
	move(player_Speed,accel,delta)
	#Setando a posição para ele não cair
	#set_pos(Vector2(get_pos().x,0))
	
func move(speed, accel, delta):
	var real_pers_pos = get_parent().get_node("personagem").get_pos().x
	current_Speed.x = lerp(current_Speed.x, speed, accel * delta)
	if real_pers_pos > 40000 and real_pers_pos < 41000:
		set_linear_velocity(Vector2(current_Speed.x-400 + delta, 0))
	elif real_pers_pos > 41000:
		set_linear_velocity(Vector2(0, 0))
	else:
		set_linear_velocity(Vector2(current_Speed.x + delta, 0))
