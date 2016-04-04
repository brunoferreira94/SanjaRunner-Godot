
extends Node2D

var id = 1
var numPlayer
var player = [preload("res://scenes/personagens/personagem_menino_negro.xml"), preload("res://scenes/personagens/personagem_cadeirante.xml"), preload("res://scenes/personagens/personagem_menina_branca.xml")]
var script = load("res://scripts/char_cadeirante.gd")
var papel = preload("res://scenes/paper.xml")

onready var alturaTela =  get_viewport_rect().size.height
onready var larguraTela =  get_viewport_rect().size.width






var enablePombaCinza = false
var enablePardal = false
var enablePombaFeia = false
var enableGaviao = false

export var qntPombaCinza = 10
export var qntPardal = 10
export var qntPombaFeia = 10
export var qntGaviao = 10

var c;


func _ready():
	set_process(true)
	get_node("/root/data").engrenagemColetada = 0
	get_node("/root/data").papelColetado = 0
	
	if get_node("/root/data").getPlayerSelected() != null:
		numPlayer = get_node("/root/data").getPlayerSelected()
	else:
		randomize()
		numPlayer = randi() % 3
	spawnPlayer(108,461)
	spawnPapel(500,600, 1)
	#spawnPapel(500, 500, 2)
	#get_node("data").save_game(id)
	#get_node("data").load_game(id)
	get_node("data").set_texto_papel(id)

	c = 1
	
func _process(delta):
	#Altere o intervalo dos pássaros nas variáveis do script, na main_scene.
	

	c += 1
	
	if c % qntPombaCinza == 0:
		randSpawnPombaCinza()
	if c % qntGaviao == 0:
		randSpawnGaviao()
	if c % qntPardal == 0:
		randSpawnPardal()
	if c % qntPombaFeia == 0:
		randSpawnPombaFeia()

	
func spawnPlayer(posx, posy):
	var spawnPlayer
	spawnPlayer = player[numPlayer].instance()
	spawnPlayer.set_pos(Vector2(posx,posy))
	spawnPlayer.set_script(script)
	add_child(spawnPlayer)

#Chama o objeto papel para a cena na posição dada e atribui um id, se já não foi coletado
func spawnPapel(posx, posy, id):
	if get_node("/root/data").get_numPapel(0,id-1) == 0:
		var spawnPapel
		spawnPapel = papel.instance()
		spawnPapel.set_pos(Vector2(posx,posy))
		spawnPapel.set_id(id)
		spawnPapel.get_node("Sprite").set_scale(Vector2(0.5,0.5))
		get_node("papel").add_child(spawnPapel)
	else:
		return str("\nPapel ", id, " já foi coletado.")
		
func randSpawnPombaCinza():
	var pombaCinza = preload("res://scenes/objetos/PombaCinza.xml").instance()
	randomize()
	var v = randi()%2
	if v == 1: #Esse primeiro if sorteia pra que lado o passaro voa
		pombaCinza.set_pos(Vector2((larguraTela+200)+get_node("personagem_fantasma").get_pos().x,randi() % int((alturaTela/3))))
		pombaCinza.set_linear_velocity(Vector2(-((randi()%100))-100,0))
		pombaCinza.get_node("Sprite").set_flip_h(true)
		
	else:
		pombaCinza.set_pos(Vector2((larguraTela+200)+get_node("personagem_fantasma").get_pos().x,randi() % int((alturaTela/3))))
		pombaCinza.set_linear_velocity(Vector2((randi()%100)+100,0))
		pombaCinza.get_node("Sprite").set_flip_h(false)
	add_child(pombaCinza)


func randSpawnPardal():
	var pardal = preload("res://scenes/objetos/Pardal.xml").instance()
	randomize()
	var v = randi()%2
	if v == 1: #Esse primeiro if sorteia pra que lado o passaro voa
		pardal.set_pos(Vector2((larguraTela+200)+get_node("personagem_fantasma").get_pos().x,randi() % int((alturaTela/3))))
		pardal.set_linear_velocity(Vector2(-((randi()%100))-100,0))
		pardal.get_node("Sprite").set_flip_h(true)
	
	else:
		pardal.set_pos(Vector2((larguraTela+200)+get_node("personagem_fantasma").get_pos().x,randi() % int((alturaTela/3))))
		pardal.set_linear_velocity(Vector2((randi()%100)+100,0))
		pardal.get_node("Sprite").set_flip_h(false)
	add_child(pardal)


func randSpawnGaviao():
	var gaviao = preload("res://scenes/objetos/Gaviao.xml").instance()
	randomize()
	var v = randi()%2
	if v == 1: #Esse primeiro if sorteia pra que lado o passaro voa
		gaviao.set_pos(Vector2((larguraTela+200)+get_node("personagem_fantasma").get_pos().x,randi() % int((alturaTela/3))))
		gaviao.set_linear_velocity(Vector2(-((randi()%100))-100,0))
		gaviao.get_node("Sprite").set_flip_h(true)
		
	else:
		gaviao.set_pos(Vector2((larguraTela+200)+get_node("personagem_fantasma").get_pos().x,randi() % int((alturaTela/3))))
		gaviao.set_linear_velocity(Vector2((randi()%100)+100,0))
		gaviao.get_node("Sprite").set_flip_h(false)
	add_child(gaviao)


func randSpawnPombaFeia():
	var pombaFeia = preload("res://scenes/objetos/PombaFeia.xml").instance()
	randomize()
	var v = randi()%2
	if v == 1: #Esse primeiro if sorteia pra que lado o passaro voa
		pombaFeia.set_pos(Vector2((larguraTela+200)+get_node("personagem_fantasma").get_pos().x,randi() % int((alturaTela/3))))
		pombaFeia.set_linear_velocity(Vector2(-((randi()%100))-100,0))
		pombaFeia.get_node("Sprite").set_flip_h(true)
	else:
		pombaFeia.set_pos(Vector2((larguraTela+200)+get_node("personagem_fantasma").get_pos().x,randi() % int((alturaTela/3))))
		pombaFeia.set_linear_velocity(Vector2((randi()%100)+100,0))
		pombaFeia.get_node("Sprite").set_flip_h(false)
	add_child(pombaFeia)