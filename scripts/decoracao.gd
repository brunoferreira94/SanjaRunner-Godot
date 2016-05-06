
extends Node2D

var pergaminho
var engrenagem
var divisor = 10
var pontuacao

func _ready():
	get_node("/root/data").load_pontuacao()
	pontuacao = get_node("/root/data").engrenagemColetada*10
	pergaminho = get_node("pontos papel")
	engrenagem = get_node("pontos engrenagem")
	pergaminho.set_scale(Vector2(2.5,2.5))
	engrenagem.set_scale(Vector2(2.5,2.5))
	pergaminho.add_text(str(get_node("/root/data").papelColetado))
	engrenagem.add_text(str(pontuacao))

	if pontuacao > 9999 and pontuacao < 99999:
		engrenagem.set_scale(Vector2(2,2))
	elif pontuacao > 99999 and pontuacao < 999999:
		engrenagem.set_scale(Vector2(1.65,1.65))