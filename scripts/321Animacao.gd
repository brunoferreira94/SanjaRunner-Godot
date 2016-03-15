
extends AnimatedSprite

func _ready():
	set_process(true)
	get_tree().set_pause(true)
	get_parent().get_parent().get_node("HUD/pause").hide()
	get_node("AnimationPlayer").play("inicio")
	
func _process(delta):
	if !get_node("AnimationPlayer").is_playing() && is_visible():
		get_parent().get_parent().get_node("HUD/pause").show()
		get_parent().get_parent().get_node("Musica").play()
		hide()
		get_tree().set_pause(false)