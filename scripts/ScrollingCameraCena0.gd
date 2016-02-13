extends Camera2D

func _ready():
	set_process(true)
	
func _process(delta):
	
	var curPos = get_pos()
	curPos.x = curPos.x + 500 * delta
	set_pos(curPos)

