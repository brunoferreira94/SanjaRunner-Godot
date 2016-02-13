extends Node2D

var sections = [preload("res://scenes/background/background1.scn"),preload("res://scenes/background/background2.scn"),preload("res://scenes/background/background3.scn"),preload("res://scenes/background/background4.scn"),preload("res://scenes/background/background5.scn"),preload("res://scenes/background/background6.scn")]
var game_offset
var player_pos
var step
var tile
func _ready():
	game_offset = 1024
	step = 0
	player_pos = get_parent().get_node("personagem").get_pos().x
	set_process(true)
	tile = get_parent().get_node("background/TileMap")
	
func _process(delta):
	
	tile.set_cell(500,600,0)
	randomize()
	var randnum = randi() % sections.size()
	
	player_pos = get_parent().get_node("RigidBody2D").get_pos().x
	
	if player_pos > 107 + step:
		var new_section = sections[randnum].instance()
		new_section.set_pos(Vector2(game_offset,0))
		game_offset+=1024
		add_child(new_section)
		step+=800
