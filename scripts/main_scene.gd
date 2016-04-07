
extends Node2D

var id = 1
var numPlayer
var player = [preload("res://scenes/personagens/personagem_menino_negro.xml"), preload("res://scenes/personagens/personagem_cadeirante.xml"), preload("res://scenes/personagens/personagem_menina_branca.xml")]
var script = load("res://scripts/char_cadeirante.gd")
var papel = preload("res://scenes/paper.xml")

onready var alturaTela =  get_viewport_rect().size.height
onready var larguraTela =  get_viewport_rect().size.width

var pombaCinza = preload("res://scenes/objetos/PombaCinza.xml").instance()
var pardal = preload("res://scenes/objetos/Pardal.xml").instance()
var pombaFeia = preload("res://scenes/objetos/PombaFeia.xml").instance()
var gaviao = preload("res://scenes/objetos/Gaviao.xml").instance()

var enablePombaCinza = false
var enablePardal = false
var enablePombaFeia = false
var enableGaviao = false

export var qntPombaCinza = 0
export var qntPardal = 0
export var qntPombaFeia = 0
export var qntGaviao = 0

func _ready():
	#chama a cena do banhado para a main scene
	add_child(preload("res://scenes/cena_banhado.xml").instance())
	set_process(true)
	get_node("/root/data").engrenagemColetada = 0
	get_node("/root/data").papelColetado = 0
	
	if get_node("/root/data").getPlayerSelected() != null:
		numPlayer = get_node("/root/data").getPlayerSelected()
	else:
		randomize()
		numPlayer = randi() % 3
	spawnPlayer(108,200)
	spawnPapel(500,600, 1)
	#spawnPapel(500, 500, 2)
	#get_node("data").save_game(id)
	#get_node("data").load_game(id)
	get_node("data").set_texto_papel(id)
	
	randSpawnPombaCinza()
	randSpawnGaviao()
	randSpawnPardal()
	randSpawnPombaFeia()
	
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
	randomize()
	var v = randi()%2
	if v == 1: #Esse primeiro if sorteia pra que lado o passaro voa
		pombaCinza.set_pos(Vector2(larguraTela+200,randi() % int((alturaTela/2))))
		pombaCinza.set_linear_velocity(Vector2((randi()%100)+100,0))
		pombaCinza.get_node("Sprite").set_flip_h(true)
		add_child(pombaCinza)
	else:
		pombaCinza.set_pos(Vector2(larguraTela+200,randi() % int((alturaTela/2))))
		pombaCinza.set_linear_velocity(Vector2(-((randi()%200)+400),0))
		get_node("HUD").add_child(pombaCinza)
		


func randSpawnPardal():
	randomize()
	var v = randi()%2
	if v == 1: #Esse primeiro if sorteia pra que lado o passaro voa
		pardal.set_pos(Vector2(larguraTela+200,randi() % int((alturaTela/2))))
		pardal.set_linear_velocity(Vector2((randi()%100)+100,0))
		pardal.get_node("Sprite").set_flip_h(true)
		add_child(pardal)
	else:
		pardal.set_pos(Vector2(larguraTela+200,randi() % int((alturaTela/2))))
		pardal.set_linear_velocity(Vector2(-((randi()%200)+400),0))
		get_node("HUD").add_child(pardal)



func randSpawnGaviao():
	randomize()
	var v = randi()%2
	if v == 1: #Esse primeiro if sorteia pra que lado o passaro voa
		gaviao.set_pos(Vector2(larguraTela+200,randi() % int((alturaTela/2))))
		gaviao.set_linear_velocity(Vector2((randi()%100)+100,0))
		gaviao.get_node("Sprite").set_flip_h(true)
		add_child(gaviao)
	else:
		gaviao.set_pos(Vector2(larguraTela+200,randi() % int((alturaTela/2))))
		gaviao.set_linear_velocity(Vector2(-((randi()%200)+400),0))
		get_node("HUD").add_child(gaviao)



func randSpawnPombaFeia():
	randomize()
	var v = randi()%2
	if v == 1: #Esse primeiro if sorteia pra que lado o passaro voa
		pombaFeia.set_pos(Vector2(larguraTela+200,randi() % int((alturaTela/2))))
		pombaFeia.set_linear_velocity(Vector2((randi()%100)+100,0))
		pombaFeia.get_node("Sprite").set_flip_h(true)
		add_child(pombaFeia)
	else:
		pombaFeia.set_pos(Vector2(larguraTela+200,randi() % int((alturaTela/2))))
		pombaFeia.set_linear_velocity(Vector2(-((randi()%200)+400),0))
		get_node("HUD").add_child(pombaFeia)
