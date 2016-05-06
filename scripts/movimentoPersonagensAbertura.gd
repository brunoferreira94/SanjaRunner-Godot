extends Node2D

var input_states = preload("res://scripts/input_states.gd")
var clique_esquerdo = input_states.new("clique_esquerdo")

var mainscene = preload("res://scenes/cena_cidade.xml")
var numPlayer

func _ready():
	set_process(true)
	numPlayer = 0
	
func _process(delta):
	var dkplayer = get_node("personagem")
	var zeplayer = get_node("personagem 2")
	var mariaplayer = get_node("personagem 3")
	
	
	
	if clique_esquerdo.check() == 1:
		return null
	if clique_esquerdo.check() == 1:
		return null
	if clique_esquerdo.check() == 1:
		return null