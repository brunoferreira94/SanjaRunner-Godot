
extends Node2D

var input_states = preload("res://scripts/input_states.gd")
var clique_esquerdo = input_states.new("clique_esquerdo")
var infoPapel = ["texto1", "texto2", "texto3"]
var numPapel = [[0, 0, 0],["texto1", "texto2", "texto3"]]
var texto

func setInfoPapel(var id):
	texto.set_text(infoPapel[id-1])
	numPapel[id-1] = 1
	
func _ready():
	
	texto = get_node("TextEdit")
	set_process(true)
	
func _process(delta):
	
	var cont = get_node("continue")
	
	if cont.is_hovered() && clique_esquerdo.check() == 1:
		if get_tree().is_paused():
			get_tree().set_pause(false)
			hide()
			get_parent().get_node("pause").show()
		else:
			get_tree().set_pause(true)
			
func save():
	var vetorSave = numPapel
	return vetorSave

func save_game(id):
	var savegame = File.new()
	savegame.open("res://savegame.save", File.READ)
	var linha = savegame.get_line()
	print("teste",linha)
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