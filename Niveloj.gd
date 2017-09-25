extends Control

onready var Stelo_kolizio_sono = get_node("Stelo_kolizio_sono")

func _init():
	var lingvo = T.Agordejo.get_value("Lingvo", "lingvo")
	if TranslationServer.get_locale() != lingvo:
		TranslationServer.set_locale(lingvo)

func _ready():
	get_tree().set_auto_accept_quit(false)
	T.Niveloj = self
	get_node("Pakoj").set_selected(T.pako-1)
	get_node("Enveno_sono").set("stream/play", T.Agordejo.get_value("Agordoj", "Sonoj", true))
	get_node("Fonmuziko").set("stream/play", T.Agordejo.get_value("Agordoj", "Muzikoj", true))
	for n in range(1,4):
		get_node("N"+str(n)+"/Stelo/Stelo/Aspekto/Rekordo").set_text(str(T.Agordejo.get_value("Steloj", "P"+str(T.pako)+"N"+str(n), 0)))
	if T.jxus_rekordita:
		T.jxus_rekordita = false
		get_node("N"+str(T.nivelo)+"/Stelo").rekordita()
		get_node("Rekordita_sono").set("stream/play", T.Agordejo.get_value("Agordoj", "Sonoj", true))
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

func _on_N3_pressed():
	T.nivelo = 3
	get_tree().change_scene("res://Radiko.tscn")

func _on_Agordoj_pressed():
	get_tree().change_scene("res://Agordoj.tscn")

func _on_Lingvo_pressed():
	get_tree().change_scene("res://Lingvo.tscn")

func _on_Pri_pressed():
	get_tree().change_scene("res://Pri.tscn")

func _on_Pakoj_button_selected( idx ):
	T.pako = idx+1
	get_tree().reload_current_scene()
