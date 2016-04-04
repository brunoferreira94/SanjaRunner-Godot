
extends Node2D

func _ready():
	set_process(true)
	
func _process(delta):
	
	var continue1 = get_node("continue")
	var pontuacao1 = get_node("pontuacao")
	var creditos1 = get_node("creditos")
	var fechar1 = get_node("fechar")
	var jogar1 = get_node("jogar")
	
	if fechar1.is_pressed():
		get_tree().quit()
	elif jogar1.is_pressed():
		get_tree().change_scene("res://scenes/selectPlayer.xml")
	elif continue1.is_pressed():
		get_tree().change_scene("res://scenes/Cena3_selecao_mapa.xml")