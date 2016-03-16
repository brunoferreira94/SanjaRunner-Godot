
extends Node2D

var id = 1

func _ready():
	set_owner(get_parent().get_parent().get_node("data").get_owner())
	
func set_id(id):
	self.id = id
	
func _collect_paper( body ):
	if get_owner() != null:
		get_owner().papelColetado += 1
		print("Quantidade de papéis: ", get_node("/root/globals").get_papelColetado()
	get_tree().set_pause(true)
	get_parent().get_parent().get_node("data").set_texto_papel_coletado(id)
	get_parent().get_parent().get_node("HUD/texto_papel").show()
	get_parent().get_parent().get_node("HUD/pause").hide()
	queue_free()
