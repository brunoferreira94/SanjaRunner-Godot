
extends Node2D

var inputStates = preload("res://scripts/InputStates.gd")
var cliqueEsquerdo = inputStates.new("cliqueEsquerdo")
var infoPapel = ["texto1", "texto2", "texto3"]
var numPapel = [1, 2, 3]
var texto

func set_info_papel(var id):
	texto.set_text(infoPapel[id-1])
	numPapel[id-1] = 1
	
func _ready():
	
	texto = get_node("TextEdit")
	set_process(true)
	
func _process(delta):
	
	var cont = get_node("continue")
	
	if cont.is_hovered() && cliqueEsquerdo.check() == 1:
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
	savegame.open("res://savegame.save", File.WRITE)
	var linha = savegame.get_line()
	if linha == str(id):
		
		return null
	savegame.store_line("ID:"+id)
	savegame.store_line(str(save()))
	print("ID:"+id+"\n"+str(save()))
	savegame.close()
