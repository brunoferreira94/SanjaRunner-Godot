
extends Node2D

var player = [preload("res://scenes/personagens/personagem_menino_negro.xml"), preload("res://scenes/personagens/personagem_cadeirante.xml"), preload("res://scenes/personagens/personagem_menina_branca.xml")]
var numPlayer
var Questions = [["questao1","questao2","questao3","questao4","questao5"],[0,0,0,0,0]]



func _ready():
	set_process(true)
	if get_node("/root/globals").getPlayerSelected() != null:
		numPlayer = get_node("/root/globals").getPlayerSelected()
	else:
		numPlayer = randi() % 3
	spawnPlayer(145,600)
	

func spawnPlayer(posx, posy):
	var spawnPlayer
	spawnPlayer = player[numPlayer].instance()
	spawnPlayer.set_pos(Vector2(posx,posy))
	add_child(spawnPlayer)
	spawnPlayer.set_gravity_scale(0)
	spawnPlayer.set_z(1)
	spawnPlayer.get_node("AnimatedSprite").set_scale(Vector2(1.4,1.4))

#Pega o texto de um arquivo e atribui ao Questions
func set_question(id):
	var questoes = File.new()
	var linha
	questoes.open("res://questoes.txt", File.READ)
	while(!questoes.eof_reached()):
		if questoes.get_line() == str(id):
			for j in range(5):
				linha = questoes.get_line()
				Questions[0][j] = linha
				print(Questions[0][j],"\n")

#atribui o texto para à questao
func set_texto_questao(id):
	get_node("TextBaloon/Pergunta/questao").add_text(Questions[0][id-1])