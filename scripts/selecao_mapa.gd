
extends Node2D

var status = "mapa"
var caminho_cena_atual

onready var leste = get_node("Leste/Botão Leste")
onready var norte = get_node("Norte/Botão Norte")
onready var centro = get_node("Centro/Botão Centro")
onready var oeste = get_node("Oeste/Botão Oeste")
onready var sul = get_node("Sul/Botão Sul")
onready var sudeste = get_node("Sudeste/Botão Sudeste")


onready var voltar = get_node("voltar")

onready var centroBanhado = get_node("Centro/Botão Centro Banhado")

func _ready():
	set_fixed_process(true)
	get_node("Centro/Botão Centro Banhado").set_hidden(true)
	get_node("HUD/Zona central").set_hidden(true)
	get_node("HUD/Zona leste").set_hidden(true)
	get_node("HUD/Zona norte").set_hidden(true)
	get_node("HUD/Zona oeste").set_hidden(true)
	get_node("HUD/Zona sudeste").set_hidden(true)
	get_node("HUD/Zona sul").set_hidden(true)
	
func _fixed_process(delta):
	if voltar.is_pressed():
		if status == "mapa":
			get_tree().change_scene("res://scenes/Cena0_abertura.xml")
		if status == "leste":
			get_node("AnimationPlayer").play("Leste Reverso")
			espera_para_mapa(0.5)
		if status == "norte":
			get_node("AnimationPlayer").play("Norte Reverso")
			espera_para_mapa(0.5)
		if status == "centro":
			get_node("AnimationPlayer").play("Centro Reverso")
			espera_para_mapa(0.5)
		if status == "oeste":
			get_node("AnimationPlayer").play("Oeste Reverso")
			espera_para_mapa(0.5)
		if status == "sul":
			get_node("AnimationPlayer").play("Sul Reverso")
			espera_para_mapa(0.5)
		if status == "sudeste":
			get_node("AnimationPlayer").play("Sudeste Reverso")
			espera_para_mapa(0.5)

		
	elif leste.is_pressed():
		status = "leste"
		animacao_mapa("Leste")
	elif norte.is_pressed():
		status = "norte"
		animacao_mapa("Norte")
	elif centro.is_pressed():
		status = "centro"
		animacao_mapa("Centro")
	elif oeste.is_pressed():
		status = "oeste"
		animacao_mapa("Oeste")
	elif sul.is_pressed():
		status = "sul"
		animacao_mapa("Sul")
	elif sudeste.is_pressed():
		status = "sudeste"
		animacao_mapa("Sudeste")
	elif centroBanhado.is_pressed():
		caminho_cena_atual = "res://scenes/cena_cidade.xml"
		get_node("/root/data").caminho_cena_atual = caminho_cena_atual
		get_tree().change_scene(caminho_cena_atual)
		
func espera_para_mapa(tempo):
	var timer = Timer.new()
	timer.set_wait_time(tempo)
	add_child(timer)
	timer.start()
	yield(timer, "timeout")
	status = "mapa"
			
func animacao_mapa(nomeRegiao):
		#Mostra os botões da região escolhida e o nome da zona
		if(nomeRegiao == "Centro"):
			get_node("Centro/Botão Centro Banhado").set_hidden(false)
			get_node("HUD/Zona central").set_hidden(false)
			get_node("HUD/Zona central/AnimationPlayer").play("fade")
		if(nomeRegiao == "Leste"):
			get_node("HUD/Zona leste").set_hidden(false)
			get_node("HUD/Zona leste/AnimationPlayer").play("fade")
		if(nomeRegiao == "Norte"):
			get_node("HUD/Zona norte").set_hidden(false)
			get_node("HUD/Zona norte/AnimationPlayer").play("fade")
		if(nomeRegiao == "Oeste"):
			get_node("HUD/Zona oeste").set_hidden(false)
			get_node("HUD/Zona oeste/AnimationPlayer").play("fade")
		if(nomeRegiao == "Sul"):
			get_node("HUD/Zona sul").set_hidden(false)
			get_node("HUD/Zona sul/AnimationPlayer").play("fade")
		if(nomeRegiao == "Sudeste"):
			get_node("HUD/Zona sudeste").set_hidden(false)
			get_node("HUD/Zona sudeste/AnimationPlayer").play("fade")
		#Executa a animação do nome da região e esconde os botões do mapa geral
		get_node("AnimationPlayer").play(nomeRegiao)
		get_node("Leste/Botão Leste").set_hidden(true)
		get_node("Norte/Botão Norte").set_hidden(true)
		get_node("Centro/Botão Centro").set_hidden(true)
		get_node("Oeste/Botão Oeste").set_hidden(true)
		get_node("Sul/Botão Sul").set_hidden(true)
		get_node("Sudeste/Botão Sudeste").set_hidden(true)