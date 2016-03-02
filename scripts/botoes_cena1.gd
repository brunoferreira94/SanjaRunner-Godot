extends CanvasLayer

var input_states = preload("res://scripts/input_states.gd")
var clique_esquerdo = input_states.new("clique_esquerdo")
var reiniciar
var pause

func _ready():
	set_process(true)
	
	#Criando as variáveis que receberão os botões da cena
	#Como aproveitei o código do meu projeto antigo, 
	#comentei as ações que precisam ser implementadas
	reiniciar = get_node("voce_perdeu/reiniciar")
	
	#var voltar = get_node("voltar_botao")
	pause = get_node("pause")
	
func _process(delta):
	#Condições para que as ações dos botões aconteçam
	if reiniciar.is_hovered() && clique_esquerdo.check() == 1:
		get_tree().change_scene("res://scenes/main_scene.scn")
#	if voltar.is_hovered() && clique_esquerdo.check() == 1:
#		get_tree().change_scene("res://scenes/Cena0_abertura.scn")
		
	if pause.is_hovered() && clique_esquerdo.check() == 1:
		if get_tree().is_paused():
			get_tree().set_pause(false)
			#inicia a musica quando despausar
			get_parent().get_node("Musica").set_paused(false)
		else:
			get_tree().set_pause(true)
			#para a musica quando pausar
			get_parent().get_node("Musica").set_paused(true)
