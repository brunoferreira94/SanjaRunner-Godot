
extends Node2D

export var value = 1

func _ready():
	get_node("Area2D").connect("body_enter", self, "_on_collect_gear")

func _on_collect_gear( body ):
	get_node("/root/data").engrenagemColetada += value
	get_node("catch_coin").play("coin")
	get_owner().get_node("HUD/points").set_text(str(get_node("/root/data").engrenagemColetada*100))
	self.hide()
	var timer = Timer.new()
	timer.set_one_shot(true)
	timer.set_wait_time(1)
	add_child(timer)
	timer.start()
	yield(timer, "timeout")
	queue_free()
