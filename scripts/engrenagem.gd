
extends AnimatedSprite

func _ready():
	set_owner(get_parent().get_parent().get_node("data").get_owner())

func _coletar_engrenagem( body ):
	if get_owner() != null:
		get_node("/root/data").papelColetado += 1
		print("Quantidade de engrenagens: ", get_node("/root/data").papelColetado)
		get_node("SamplePlayer2D").play("8-bit-coin")
		hide()