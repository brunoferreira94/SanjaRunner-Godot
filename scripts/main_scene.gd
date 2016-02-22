
extends Node2D

var sections = [preload("res://scenes/main_scene2.scn"),preload("res://scenes/main_scene3.scn")]
var playerpos
var step
var count_map
var papers_total = 0
var papers_collected = 0
var numPlayer
var player = [preload("res://scenes/personagens/personagem_menino_negro.scn"), preload("res://scenes/personagens/personagem_cadeirante.scn"), preload("res://scenes/personagens/personagem_menina_branca.scn")]
var script = load("res://scripts/char_cadeirante.gd")

func _ready():
	step = 12500
	count_map = 0
	set_process(true)
	numPlayer = get_node("/root/globals").getPlayerSelected()
	spawnPlayer()
	
	
func _process(delta):
	playerpos = get_node("personagem_fantasma").get_pos().x
	print(step)

	if playerpos > step and count_map < 2:
		var new_section = sections[count_map].instance()
		new_section.set_pos(Vector2(playerpos+1024,0))
		add_child(new_section)
		step = step+12500
		count_map = count_map + 1
	
func spawnPlayer():
	var spawnPlayer = player[numPlayer].instance()
	spawnPlayer.set_pos(Vector2(108,461))
	spawnPlayer.set_script(script)
	add_child(spawnPlayer)
	