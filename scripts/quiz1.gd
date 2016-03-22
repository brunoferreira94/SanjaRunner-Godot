
extends Node2D

var player = [preload("res://scenes/personagens/personagem_menino_negro.xml"), preload("res://scenes/personagens/personagem_cadeirante.xml"), preload("res://scenes/personagens/personagem_menina_branca.xml")]
var numPlayer
var questions = ["questao1","questao2","questao3","questao4","questao5"]
var respostas = [["resp11","resp12","resp13","resp14"],
				["resp21","resp22","resp23","resp24"],
				["resp31","resp32","resp33","resp34"],
				["resp41","resp42","resp43","resp44"],
				["resp51","resp52","resp53","resp54"]]

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

#pega o texto do arquivo e atribui para as respostas
func set_resposta(id):
	var respostas = File.new()
	var linha
	respostas.open("res://respostas.txt",File.READ)
	while(!respostas.eof_reached()):
		for i in range (5):
			for j in range (4):
				linha = respostas.get_line()
				respostas[i][j] = linha


#atribui o texto para o balão de questao
func set_texto_questao(id):
	get_node("TextBaloon/questao").add_text(questions[id])
	

#atribui o texto para os balões de resposta
func set_texto_resposta(id):
	get_node("TextBaloon/a/respA").add_text(respostas[id][0])
	get_node("TextBaloon/b/respB").add_text(respostas[id][1])
	get_node("TextBaloon/c/respC").add_text(respostas[id][2])
	get_node("TextBaloon/d/respD").add_text(respostas[id][3])

	
func screen_question(id):
	set_question(id)
	set_texto_questao(id)
	set_resposta(id)
	set_texto_resposta(id)
	