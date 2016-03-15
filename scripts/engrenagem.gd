
extends AnimatedSprite

func _ready():
	set_owner(get_parent().get_parent().get_node("data").get_owner())

func _coletar_engrenagem( body ):
	if get_owner() != null:
		get_owner().engrenagemColetada += 1
		get_node("SamplePlayer2D").play("8-bit-coin")
		print("Quantidade de engrenagens: ", get_owner().engrenagemColetada)
		hide()
	if get_node("SamplePlayer2D").is_processing():
		queue_free()