
extends Node2D

var numPapel = [[],[0, 0, 0, 0, 0],["texto1", "texto2", "texto3", "texto4", "texto5"]]

func save():
	var vetorSave = numPapel
	return vetorSave

func save_game(id):
	var savegame = File.new()
	savegame.open("res://savegame.save", File.READ)
	var linha = savegame.get_line()
	numPapel[0].append("inserido")
	numPapel[0].append("inserido1")
	if linha == str(id):
		print("Id é igual ao da cena:",linha)
	savegame.close()
	savegame.open("res://savegame.save", File.WRITE)
	savegame.store_line(str(id))
	savegame.store_line(str(save()))
	savegame.close()

func load_game():
	var savegame = File.new()
	var linha
	if !savegame.file_exists("res://savegame.save"):
		print(-1)
		return -1

	savegame.open("res://savegame.save", File.READ)
	while (!savegame.eof_reached()):
		linha = savegame.get_line()
		print(linha)

func _ready():
	pass


