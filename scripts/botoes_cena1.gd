extends CanvasLayer

var input_states = preload("res://scripts/input_states.gd")
var clique_esquerdo = input_states.new("clique_esquerdo")
var reiniciarGanhou
var reiniciarPerdeu
var voltarTelaInicialPerdeu
var pause
var continuar
var voltar

func _ready():
	set_process(true)
	
	#Criando as variáveis que receberão os botões da cena
	#Como aproveitei o código do meu projeto antigo, 
	#comentei as ações que precisam ser implementadas
	voltarTelaInicialPerdeu = get_node("voce_perdeu/voltar para o menu")
	reiniciarPerdeu = get_node("voce_perdeu/reiniciar")
	reiniciarGanhou = get_node("voce_ganhou/reiniciar")
	
	voltar = get_node("voce_ganhou/voltar")
	pause = get_node("pause")
	continuar = get_node("texto_papel/continue")
	
func _process(delta):
	if voltarTelaInicialPerdeu.is_pressed():
		get_tree().change_scene("res://scenes/Cena0_abertura.xml")
	#Condições para que as ações dos botões aconteçam
	if reiniciarGanhou.is_pressed() || reiniciarPerdeu.is_pressed():
		get_tree().change_scene("res://scenes/main_scene.xml")
	#botão para voltar para o mapa de seleção dentro da região
	if voltar.is_pressed():
		get_tree().change_scene("res://scenes/Cena3_selecao_mapa.xml")
		get_node("/root/data").save_game(get_owner().id)
	#botão para tirar o pause do jogo
	if continuar.is_pressed():
		if get_tree().is_paused():
			get_tree().set_pause(false)
			get_node("texto_papel").hide()
			get_node("Botão Pulo").show()
			pause.show()
	if pause.is_hovered() && clique_esquerdo.check() == 1:
		if get_tree().is_paused():
			get_tree().set_pause(false)
			#inicia a musica quando despausar
			get_parent().get_node("Musica").set_paused(false)
		else:
			get_tree().set_pause(true)
			#para a musica quando pausar
			get_parent().get_node("Musica").set_paused(true)
