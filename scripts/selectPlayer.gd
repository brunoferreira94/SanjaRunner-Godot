
extends Node2D

var input_states = preload("res://scripts/input_states.gd")
var clique_esquerdo = input_states.new("clique_esquerdo")

var mainscene = preload("res://scenes/main_scene.scn")
# member variables here, example:
# var a=2
# var b="textvar"

func _ready():
	set_process(true)
	
func _process(delta):
	var dkplayer = get_node("DKbutton")
	var zeplayer = get_node("Zebutton")
	var mariaplayer = get_node("Mariabutton")
	
	if dkplayer.is_hovered() && clique_esquerdo.check() == 1:
		get_tree().change_scene("res://scenes/main_scene.scn") 
	if zeplayer.is_hovered() && clique_esquerdo.check() == 1:
		get_tree().change_scene("res://scenes/main_scene.scn")
	if mariaplayer.is_hovered() && clique_esquerdo.check() == 1:
		get_tree().change_scene("res://scenes/main_scene.scn")