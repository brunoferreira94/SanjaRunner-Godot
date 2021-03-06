extends Node2D

var input_states = preload("res://scripts/input_states.gd")
var clique_esquerdo = input_states.new("clique_esquerdo")
var numPlayer

func _ready():
	set_process(true)
	numPlayer = 0
	
func _process(delta):
	if get_node("Botão DK").is_pressed():
		get_tree().change_scene("res://scenes/Cena3_selecao_mapa.xml")
		numPlayer = 0
		get_node("/root/data").setPlayerSelected(numPlayer)
		get_node("/root/data").save_game(-1)
	if get_node("Botão Zézinho").is_pressed():
		get_tree().change_scene("res://scenes/Cena3_selecao_mapa.xml")
		numPlayer = 1
		get_node("/root/data").setPlayerSelected(numPlayer)
		get_node("/root/data").save_game(-1);
	if get_node("Botão Maria").is_pressed():
		get_tree().change_scene("res://scenes/Cena3_selecao_mapa.xml")
		numPlayer = 2
		get_node("/root/data").setPlayerSelected(numPlayer)
		get_node("/root/data").save_game(-1)