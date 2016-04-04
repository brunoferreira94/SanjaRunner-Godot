
extends Node2D

var pergaminho
var engrenagem

func _ready():
	get_node("/root/data").load_pontuacao()
	pergaminho = get_node("pontos papel")
	engrenagem = get_node("pontos engrenagem")
	pergaminho.set_scale(Vector2(2.5,2.5))
	engrenagem.set_scale(Vector2(2.5,2.5))
	pergaminho.add_text(str(get_node("/root/data").papelColetadoGlobal))
	engrenagem.add_text(str(get_node("/root/data").engrenagemColetadaGlobal*100))
	if get_node("/root/data").engrenagemColetadaGlobal*100 > 9999 and get_node("/root/data").engrenagemColetadaGlobal*100 < 99999:
		engrenagem.set_scale(Vector2(2,2))
	elif get_node("/root/data").engrenagemColetadaGlobal*100 > 99999 and get_node("/root/data").engrenagemColetadaGlobal*100 < 999999:
		engrenagem.set_scale(Vector2(1.65,1.65))