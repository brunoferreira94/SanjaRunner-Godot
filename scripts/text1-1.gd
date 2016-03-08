
extends Node2D

var input_states = preload("res://scripts/input_states.gd")
var clique_esquerdo = input_states.new("clique_esquerdo")
var texto

func setInfoPapel(var id):
	texto.set_text(get_parent().get_parent().get_node("data").get_numPapel(1,id-1))
	
func _ready():
	
	texto = get_node("TextEdit")
	set_process(true)
	
func _process(delta):
	
	var cont = get_node("continue")
	
	if cont.is_hovered() && clique_esquerdo.check() == 1:
		if get_tree().is_paused():
			get_tree().set_pause(false)
			hide()
			get_parent().get_node("pause").show()
		else:
			get_tree().set_pause(true)