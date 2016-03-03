extends Node2D

var inputStates = preload("res://scripts/InputStates.gd")
var cliqueEsquerdo = inputStates.new("cliqueEsquerdo")

var main_scene = preload("res://scenes/main_scene.scn")
var numPlayer

func _ready():
	set_process(true)
	numPlayer = 0
	
func _process(delta):
	var dkplayer = get_node("DKbutton")
	var zeplayer = get_node("Zebutton")
	var mariaplayer = get_node("Mariabutton")
	
	if dkplayer.is_hovered() && cliqueEsquerdo.check() == 1:
		get_tree().change_scene("res://scenes/main_scene.scn")
		numPlayer = 0
		get_node("/root/globals").setPlayerSelected(numPlayer)
	if zeplayer.is_hovered() && cliqueEsquerdo.check() == 1:
		get_tree().change_scene("res://scenes/main_scene.scn")
		numPlayer = 1
		get_node("/root/globals").setPlayerSelected(numPlayer)
	if mariaplayer.is_hovered() && cliqueEsquerdo.check() == 1:
		get_tree().change_scene("res://scenes/main_scene.scn")
		numPlayer = 2
		get_node("/root/globals").setPlayerSelected(numPlayer)