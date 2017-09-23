extends Node2D

func _ready():
	get_tree().set_auto_accept_quit(false)
	get_node("Enveno_sono").set("stream/play", T.Agordejo.get_value("Agordoj", "Sonoj", true))

func _notification(what):
	if what == MainLoop.NOTIFICATION_WM_QUIT_REQUEST and T.lingvo_elektita:
		get_tree().change_scene("res://Niveloj.tscn")

func _on_EO_pressed():
	T.Agordejo.set_value("Lingvo", "lingvo", "eo")
	T.Agordejo.save(T.agordejo)
	T.lingvo_elektita = true
	get_tree().change_scene("res://Niveloj.tscn")

func _on_EN_pressed():
	T.Agordejo.set_value("Lingvo", "lingvo", "en")
	T.Agordejo.save(T.agordejo)
	T.lingvo_elektita = true
	get_tree().change_scene("res://Niveloj.tscn")
