extends Control

func _ready():
	get_node("Akcelometro").set_pressed(T.akcelometro_aktivita)

func _on_Akcelometro_toggled( premita ):
	T.Agordejo.set_value("Agordoj", "akcelometro", premita)
	T.Agordejo.save(T.agordejo)
	T.akcelometro_aktivita = premita