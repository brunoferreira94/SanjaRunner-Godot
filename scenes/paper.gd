
extends Node2D

export var value = 1


func _ready():
	print(get_owner().get_name())
	if get_owner()!= null:
		get_owner().papers_total += value
		
	get_node("Area2D").connect("body_enter",self,"_collect_paper")




func _collect_paper( body ):
	print(get_owner().papers_collected)
	if get_owner() != null:
		get_owner().papers_collected += value
	print(get_owner().papers_collected)
	queue_free()
