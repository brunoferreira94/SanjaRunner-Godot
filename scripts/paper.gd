
extends Node2D

export var value = 1

func _ready():
	if get_owner()!= null:
		get_owner().PapersTotal += 1
		
	get_node("Area2D")
	

func _collect_paper( body ):
	print(get_owner().papersCollected)
	if get_owner() != null:
		get_owner().papersCollected += value
		get_parent().get_parent().get_node("HUD/texto_papel").set_info_papel(value)
	print(get_owner().papersCollected)
	get_tree().set_pause(true)
	get_parent().get_parent().get_node("HUD/texto_papel").show()
	get_parent().get_parent().get_node("HUD/pause").hide()
	queue_free()
