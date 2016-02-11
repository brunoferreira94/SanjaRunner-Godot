extends Camera2D

func _ready():
	set_process(true)
	
func _process(delta):
	
	var curPos = get_pos()
	var char_velocity = get_parent().get_node("personagem").get_linear_velocity()
	curPos.x = curPos.x + char_velocity.x/60
	set_pos(curPos)

