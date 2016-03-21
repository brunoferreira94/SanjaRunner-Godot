
extends Node2D

export var value = 1

func _ready():
	if get_owner() != null:
		get_node("/root/data").engrenagemColetada += value
	get_node("Area2D").connect("body_enter", self, "_on_collect_gear")
	set_process(true)
	
func _process(delta):
	pass

func _on_collect_gear( body ):
	get_node("/root/data").engrenagemColetada += value
	get_node("catch_coin").play("coin")
	get_owner().get_node("HUD/points").set_text(str(get_node("/root/data").engrenagemColetada*100))
	#queue_free()
	self.hide()
