
extends Node2D

var id = 1

func _ready():
	pass
	
func set_id(id):
	self.id = id
	
func collect_paper( body ):
	get_owner().papelColetado += 1
	get_parent().get_parent().get_node("data").set_papel_coletado(1,id-1)
	get_tree().set_pause(true)
	get_parent().get_parent().get_node("HUD/texto_papel").show()
	get_parent().get_parent().get_node("HUD/pause").hide()
	queue_free()
