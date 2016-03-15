
extends Node2D

var numPapel = [[0, 0, 0, 0, 0],["texto1", "texto2", "texto3", "texto4", "texto5"]]

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
					print(numPapel[1][j],"\n")

#atribui o texto para o papel coletado
func set_texto_papel_coletado(id):
	get_parent().get_node("HUD/texto_papel/TextEdit").set_text(numPapel[1][id])

func set_papel_coletado(umOuZero, id):
	numPapel[0][id] = umOuZero
	
#retorna a informação da posição do vetor definida
func get_numPapel(i, j):
	return numPapel[i][j]
	
#Retorna o vetor numPapel
func save():
	var vetorSave = numPapel
	return vetorSave

#Grava as alterações feitas no vetor numPapel num arquivo
func save_game(id):
	var savegame = File.new()
	var pos
	savegame.open("res://savegame.save", File.READ_WRITE)
	
	if savegame.file_exists("res://savegame.save"):
		while(!savegame.eof_reached()):
			if savegame.get_line() == str(id):
				savegame.store_line(str(save()))
				savegame.close()
				break
			elif savegame.eof_reached():
				savegame.store_line(str(id))
				savegame.store_line(str(save()))
				savegame.close()
				break
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
						if numPapel[i][j] == 1:
							get_owner().papelColetado += 1
						print(numPapel[i][j],"\n")
						cont+=1
		savegame.close()

func _ready():
	pass


