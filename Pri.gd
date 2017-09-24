extends Control

func _ready():
	get_node("Enveno_sono").set("stream/play", T.Agordejo.get_value("Agordoj", "Sonoj", true))

func _on_Fontkodo_pressed():
	OS.shell_open("https://github.com/HassanHeydariNasab/k2")

func _on_Atribuoj_pressed():
	OS.shell_open("https://github.com/HassanHeydariNasab/k2/blob/master/ATRIBUOJ.md")

func _on_Donaci_pressed():
	OS.shell_open("bitcoin:1iNMJMFqDgYp7iUMd4qkP79CiCLSwLPyp")