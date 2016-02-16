
extends Node2D

var input_states = preload("res://scripts/input_states.gd")
var clique_esquerdo = input_states.new("clique_esquerdo")

func _ready():
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
