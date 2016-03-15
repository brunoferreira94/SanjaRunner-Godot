
extends TextureFrame

func _ready():
	pass

func _on_Timer_timeout():
	transition.fade_to("res://scenes/splashscreen/splashcreen.xml")
