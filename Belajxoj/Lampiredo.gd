extends Node2D

onready var Postirajxo = get_node("Vojo/Postirajxo")

var i = 0

func _ready():
	set_process(true)

func _process(delta):
	i += 5
	Postirajxo.set_offset(i)
