
extends Node2D

var player = [preload("res://scenes/personagens/personagem_menino_negro.xml"), preload("res://scenes/personagens/personagem_cadeirante.xml"), preload("res://scenes/personagens/personagem_menina_branca.xml")]
var numPlayer

func _ready():
	set_process(true)
	if get_node("/root/globals").getPlayerSelected() != null:
		numPlayer = get_node("/root/globals").getPlayerSelected()
	else:
		numPlayer = randi() % 3
	spawnPlayer(145,600)
	

func spawnPlayer(posx, posy):
	var spawnPlayer
	spawnPlayer = player[numPlayer].instance()
	spawnPlayer.set_pos(Vector2(posx,posy))
	add_child(spawnPlayer)
	spawnPlayer.set_gravity_scale(0)
	spawnPlayer.set_z(1)
	spawnPlayer.get_node("AnimatedSprite").set_scale(Vector2(1.4,1.4))



