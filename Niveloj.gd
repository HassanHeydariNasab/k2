extends Control

onready var Stelo_kolizio_sono = get_node("Stelo_kolizio_sono")

func _init():
	var lingvo = T.Agordejo.get_value("Lingvo", "lingvo")
	if TranslationServer.get_locale() != lingvo:
		TranslationServer.set_locale(lingvo)

func _ready():
	get_tree().set_auto_accept_quit(false)
	T.Niveloj = self
	set_process(true)

func _process(delta):
	if T.Kaptitajxo != null:
		T.Kaptitajxo.set_global_pos(get_global_mouse_pos())

func _on_N1_pressed():
	T.nivelo = 1
	get_tree().change_scene("res://Radiko.tscn")

func _on_N2_pressed():
	T.nivelo = 2
	get_tree().change_scene("res://Radiko.tscn")

func _on_Agordoj_pressed():
	get_tree().change_scene("res://Agordoj.tscn")

func _on_Lingvo_pressed():
	get_tree().change_scene("res://Lingvo.tscn")
