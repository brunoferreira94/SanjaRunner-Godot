
extends Node2D

var player = [preload("res://scenes/personagens/personagem_menino_negro.xml"), preload("res://scenes/personagens/personagem_cadeirante.xml"), preload("res://scenes/personagens/personagem_menina_branca.xml")]
var numPlayer
var questions = ["questao1","questao2","questao3","questao4","questao5"]
var respostas = ["resp1","resp2","resp3","resp4","resp5"]

func _ready():
	set_process(true)
	if get_node("/root/globals").getPlayerSelected() != null:
		numPlayer = get_node("/root/globals").getPlayerSelected()
	else:
		numPlayer = randi() % 3
	spawnPlayer(145,600)
	
	screen_question(2)
		

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
				questions[j] = linha
				print(questions[j],"\n")


func set_resposta(id):
	var respostas = File.new()
	var linha
	respostas.open("res://respostas.txt",File.READ)
	while(!respostas.eof_reached()):
		


#atribui o texto para à questao
func set_texto_questao(id):
	get_node("TextBaloon/questao").add_text(questions[id])
	
func screen_question(id):
	set_question(id)
	set_texto_questao(id)
	