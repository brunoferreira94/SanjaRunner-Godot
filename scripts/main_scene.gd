
extends Node2D

var papers_total = 0
var papers_collected = 0
var numPlayer
var player = [preload("res://scenes/personagens/personagem_menino_negro.scn"), preload("res://scenes/personagens/personagem_cadeirante.scn"), preload("res://scenes/personagens/personagem_menina_branca.scn")]
var script = load("res://scripts/char_cadeirante.gd")

func _ready():
	set_process(true)
	numPlayer = get_node("/root/globals").getPlayerSelected()
	spawnPlayer()
	
	
func _process(delta):
	pass
	
func spawnPlayer():
	var spawnPlayer = player[numPlayer].instance()
	spawnPlayer.set_pos(Vector2(108,461))
	spawnPlayer.set_script(script)
	add_child(spawnPlayer)
	