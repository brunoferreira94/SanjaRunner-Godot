
extends Node2D

export var value = 1

func _ready():
	print(get_owner().get_name())
	if get_owner()!= null:
		get_owner().papers_total += value
		
	get_node("Area2D")
	

func _collect_paper( body ):
	print(get_owner().papers_collected)
	if get_owner() != null:
		get_owner().papers_collected += value
		get_parent().get_parent().get_node("HUD/texto_papel").setInfoPapel(value)
	print(get_owner().papers_collected)
	get_tree().set_pause(true)
	get_parent().get_parent().get_node("HUD/texto_papel").show()
	get_parent().get_parent().get_node("HUD/pause").hide()
	queue_free()