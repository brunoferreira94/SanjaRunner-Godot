extends Camera2D
var curPos
var char_velocity
var char_pos

func _ready():
	set_fixed_process(true)
	
func _process(delta):
	char_pos = get_parent().get_node("personagem").get_pos()
	curPos = get_pos()
	char_velocity = get_parent().get_node("personagem").get_linear_velocity()
	curPos.x = char_pos.x + 500
	set_pos(curPos)
	print(curPos.x - char_pos.x)
