
extends Node2D
onready var leste = get_node("Leste")
onready var norte = get_node("Norte")
onready var centro = get_node("Centro")
onready var oeste = get_node("Oeste")
onready var sul = get_node("Sul")
onready var sudeste = get_node("Sudeste")

func _ready():
	set_fixed_process(true)
	
func _fixed_process(delta):
	if oeste.is_pressed():
		oeste.hide()