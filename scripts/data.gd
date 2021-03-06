
extends Node2D

var numPapel = [[0, 0, 0, 0, 0],["texto1", "texto2", "texto3", "texto4", "texto5"]]
#variáveis para armazenar a pontuação durante a cena
var papelColetado = 0
var engrenagemColetada = 0
#variáveis para armazenar a pontuação depois da cena terminar
var papelColetadoGlobal = 0
var engrenagemColetadaGlobal = 0
var pontuacao = engrenagemColetada * 10
var pos_parada
var caminho_cena_atual

#variável que guarda o id do personagem selecionado 
var PlayerSelected
#retorna a id do personagem
func getPlayerSelected():
	return PlayerSelected
#atribui um id ao personagem
func setPlayerSelected(var numPlayer):
	PlayerSelected = numPlayer

func set_pontuacao():
	get_parent().get_node("HUD/points").set_text(str(pontuacao))

#Pega o texto de um arquivo e atribui ao numPapel
func set_texto_papel(id):
	var conteudo = File.new()
	var linha
	if !conteudo.file_exists("res://savegame.save"):
		print(-1)
		return -1
	else:
		conteudo.open("res://conteudo.txt", File.READ)
		while(!conteudo.eof_reached()):
			if conteudo.get_line() == str(id):
				for j in range(5):
					linha = conteudo.get_line()
					numPapel[1][j] = linha

#atribui o texto para o papel coletado
func set_texto_papel_coletado(id):
	get_parent().get_node("HUD/texto_papel/TextEdit").add_text(numPapel[1][id-1])

func set_papel_coletado(umOuZero, id):
	numPapel[0][id-1] = umOuZero
	
#retorna a informação da posição do vetor definida
func get_numPapel(i, j):
	return numPapel[i][j]

#Grava as alterações feitas no vetor numPapel num arquivo
func save_game(id):
	var savegame = File.new()
	
	get_node("/root/data").papelColetadoGlobal += get_node("/root/data").papelColetado
	get_node("/root/data").engrenagemColetadaGlobal += get_node("/root/data").engrenagemColetada
	
	savegame.open("res://savegame.save", File.READ_WRITE)
	
	if savegame.file_exists("res://savegame.save"):
		savegame.store_line(str(papelColetadoGlobal, ";", engrenagemColetadaGlobal))
		savegame.store_line(str("0",PlayerSelected))
		if id != -1:
			while(!savegame.eof_reached()):
				if savegame.get_line() == str(id):
					savegame.store_line(str(numPapel))
					savegame.close()
					break
				elif savegame.eof_reached():
					savegame.store_line(str(id))
					savegame.store_line(str(numPapel))
					savegame.close()
					break
		else:
			savegame.close()
	else:
		savegame.store_line(str(id))
		savegame.store_line(str(save()))
		savegame.close()

#Lê as informações num arquivo e atribui a matriz numPapel
func load_game(id):
	var savegame = File.new()
	var linha
	if !savegame.file_exists("res://savegame.save"):
		print("Arquivo de save não existente.")
		return -1
	else:
		savegame.open("res://savegame.save", File.READ)
		while(!savegame.eof_reached()):
			if savegame.get_line() == str(id):
				var cont = 0
				linha = savegame.get_line()
				for i in range(2):
					for j in range(5):
						numPapel[i][j] = linha.split(", ")[cont]
						cont+=1
	savegame.close()

#carrega as informações de pontuação total na tela inicial
func load_pontuacao():
	var savegame = File.new()
	var linha = [2]
	if !savegame.file_exists("res://savegame.save"):
		print("Arquivo de save não existente.")
		return -1
	else:
		savegame.open("res://savegame.save", File.READ)
		linha = savegame.get_line().split(";")
		PlayerSelected = int(savegame.get_line())
		papelColetado = int(linha[0])
		engrenagemColetada = int(linha[1])

func _ready():
	pass


