
extends Node2D

var plataforma
var timer = Timer.new()
export var pos_parada = [0, 0]

func _ready():
	#timer = Timer.new()
	#plataforma = get_node("TileMap")
	#cria_plataforma(5,10,5)
	#cria_plataforma(18,10,5)
	get_node("/root/data").pos_parada = pos_parada
	print("parada 1: ",pos_parada[0], "\n parada 2: ", pos_parada[1])
	
func _fixed_process(delta):
	pass

#Limites de posição para plataforma
#0 >= y <= 12
#x >= 0
func cria_plataforma(x,y,qtdTiles):
	var i = x+1
	plataforma.set_cell(x,y,0)
	while(i < x+qtdTiles):
		plataforma.set_cell(i,y,1)
		i += 1
	plataforma.set_cell(x+qtdTiles,y,2)