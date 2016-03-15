
extends TextureFrame

func _ready():
	#get_node("Timer").set_wait_time(5)
	get_node("SamplePlayer2D").play("star_open")

func _on_Timer_timeout():
	transition.fade_to("res://scenes/Cena0_abertura.xml")
