
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
	var t = Timer.new()
	t.set_wait_time(1)
	add_child(t)
	get_node("/root/data").engrenagemColetada += value
	get_node("catch_coin").play("coin")
	self.hide()
	get_owner().get_node("HUD/points").set_text(str(get_node("/root/data").engrenagemColetada*100))
	t.start()
	yield(t,"timeout")
	queue_free()
