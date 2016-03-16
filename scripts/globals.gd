extends Node

var PlayerSelected
var papelColetado
var engrenagemColetada

func getPlayerSelected():
	return PlayerSelected
	
func setPlayerSelected(var numPlayer):
	PlayerSelected = numPlayer
	
func load_pontuacao_inicial():
	var savegame = File.new()
	var linha
	if !savegame.file_exists("res://savegame.save"):
		print("Arquivo de save não existente.")
		return -1
	else:
		savegame.open("res://savegame.save", File.READ)
		linha = savegame.get_line()
		papelColetado = linha.split(";")
		engrenagemColetada = linha.split(";")