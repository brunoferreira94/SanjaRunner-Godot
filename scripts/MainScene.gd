
extends Node2D

var PapersTotal = 0
var papersCollected = 0
var numPlayer
var player = [preload("res://scenes/personagens/PersonagemMeninoNegro.scn"), preload("res://scenes/personagens/PersonagemCadeirante.scn"), preload("res://scenes/personagens/PersonagemMeninaBranca.scn")]
var script = load("res://scripts/Personagem.gd")
var spawnPlayer = 0
var altura_tela = 0
var largura_tela = 0

func _ready():	
	if get_node("/root/globals").getPlayerSelected() != null:
		numPlayer = get_node("/root/globals").getPlayerSelected()
	else:
		numPlayer = randi() % 3
	spawn_player()
	get_node("Camera2D").set_pos(Vector2(get_node("personagem").get_pos().x+(largura_tela/2),altura_tela/1.8))
	altura_tela = get_viewport_rect().size.height
	largura_tela = get_viewport_rect().size.width
	get_node("HUD/321/AnimationPlayer").play("inicio")
	get_tree().set_pause(true)
	set_fixed_process(true)
	
	
func _fixed_process(delta):	

	get_node("Camera2D").set_pos(Vector2(get_node("personagem").get_pos().x+(largura_tela/2),altura_tela/1.8))
	
	
	
func spawn_player():
	spawnPlayer = player[numPlayer].instance()
	spawnPlayer.set_pos(Vector2(108,461))
	spawnPlayer.set_script(script)
	add_child(spawnPlayer)

	
	