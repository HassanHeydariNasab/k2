extends Node2D

var Kvadrato = preload("res://Objektoj/Kvadrato.tscn")
var Kvadrato_teksturo = preload("res://Objektoj/kvadrato.png")
var Kvadrato_malaktivita_teksturo = preload("res://Objektoj/kvadrato_malaktivita.png")
onready var Objektoj = get_node("Objektoj")
onready var Ekvivejo = get_node("Ekvivejo")
onready var Steloj = get_node("Steloj")
onready var Luno = get_node("Luno")

func _ready():
	T.Objekto = null
	T.steloj = 0
	if T.akcelometro_aktivita:
		get_node("Kanvaso/Kontroliloj").queue_free()

func _on_Kvadrato_pressed():
	var Kvadrato_ = Kvadrato.instance()
	Kvadrato_.set_global_pos(Ekvivejo.get_global_pos())
	Kvadrato_.get_node("Aspekto").set_texture(Kvadrato_teksturo)
	Objektoj.add_child(Kvadrato_)
	if T.Objekto != null:
		T.Objekto.set_fixed_process(false)
		T.Objekto.get_node("Aspekto").set_texture(Kvadrato_malaktivita_teksturo)
	T.Objekto = Kvadrato_
	T.Objekto.set_fixed_process(true)

func _on_Forigi_toggled( premita ):
	T.foranta = premita

func _on_Brileti_timeout():
	randomize()
	if int(rand_range(0,2)) == 0:
		var Stelo = Steloj.get_child(int(rand_range(0,Steloj.get_child_count())))
		Stelo.Brileti.resume_all()

func _on_Luno_rotacii_timeout():
	if int(rand_range(0,2)) == 0:
		Luno.Rotacii.resume_all()
