
extends Node2D

var id = 1
var numPlayer
var player = [preload("res://scenes/personagens/personagem_menino_negro.xml"), preload("res://scenes/personagens/personagem_cadeirante.xml"), preload("res://scenes/personagens/personagem_menina_branca.xml")]
var script = load("res://scripts/char_cadeirante.gd")
var papel = preload("res://scenes/paper.xml")

func _ready():
	set_process(true)
	if get_node("/root/globals").getPlayerSelected() != null:
		numPlayer = get_node("/root/globals").getPlayerSelected()
	else:
		randomize()
		numPlayer = randi() % 3
	spawnPlayer(108,461)
	spawnPapel(200,500, 1)
	#spawnPapel(500, 500, 2)
	#get_node("data").save_game(id)
	#get_node("data").load_game(id)
	get_node("data").set_texto_papel(id)
	
func _process(delta):
	pass
	
func spawnPlayer(posx, posy):
	var spawnPlayer
	spawnPlayer = player[numPlayer].instance()
	spawnPlayer.set_pos(Vector2(posx,posy))
	spawnPlayer.set_script(script)
	add_child(spawnPlayer)

#Chama o objeto papel para a cena na posição dada e atribui um id, se já não foi coletado
func spawnPapel(posx, posy, id):
	if get_node("data").get_numPapel(0,id-1) == 0:
		var spawnPapel
		spawnPapel = papel.instance()
		spawnPapel.set_pos(Vector2(posx,posy))
		spawnPapel.set_id(id)
		spawnPapel.get_node("Sprite").set_scale(Vector2(0.5,0.5))
		get_node("papers").add_child(spawnPapel)
	else:
		return str("\nPapel ", id, " já foi coletado.")