
extends Node2D

export var value = 1
var pontuacao

func _ready():
	get_node("Area2D").connect("body_enter", self, "_on_collect_gear")

func _on_collect_gear( body_enter ):
	get_node("/root/data").engrenagemColetada += value
	get_node("/root/data").pontuacao = get_node("/root/data").engrenagemColetada*10
	get_owner().get_node("HUD/points").set_text(str(pontuacao))
	get_node("catch_coin").play("coin")
	self.hide()
	var timer = Timer.new()
	timer.set_one_shot(true)
	timer.set_wait_time(1)
	add_child(timer)
	timer.start()
	yield(timer, "timeout")
	queue_free()
