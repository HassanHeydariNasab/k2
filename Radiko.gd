extends Node2D

var Nivelo = null
var Steloj = null
var Luno = null
var Kvadrato = preload("res://Objektoj/Kvadrato.tscn")
var Kvadrato_teksturo = preload("res://Objektoj/kvadrato.png")
var Kvadrato_malaktivita_teksturo = preload("res://Objektoj/kvadrato_malaktivita.png")
onready var Objektoj = get_node("Objektoj")
onready var Ekvivejo = get_node("Ekvivejo")
onready var Rotacii = get_node("Rotacii")
onready var PreVenko = get_node("PreVenko")
onready var Rotacii_sono = get_node("Rotacii_sono")
onready var Brileti_sono = get_node("Brileti_sono")
onready var Stelon_kapti_sono = get_node("Stelon_kapti_sono")
onready var Lunon_kapti_sono = get_node("Lunon_kapti_sono")

func _ready():
	T.Radiko = self
	T.Objekto = null
	T.steloj = 0
	add_child(load("res://Niveloj/N%d.tscn" % T.nivelo).instance())
	Nivelo = get_node("Nivelo")
	Steloj = Nivelo.get_node("Steloj")
	Luno = Nivelo.get_node("Luno")
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

func _on_Forigi_toggled( b ):
	T.foranta = b

func _on_Brileti_timeout():
	randomize()
	if int(rand_range(0,2)) == 0 and Steloj.get_child_count() > 0:
		var Stelo = Steloj.get_child(int(rand_range(0,Steloj.get_child_count())))
		Stelo.Brileti.resume_all()
		Brileti_sono.play()

func _on_Rotacii_timeout():
	if int(rand_range(0,3)) == 0:
		Luno.Rotacii.resume_all()
		Rotacii_sono.play()

func _on_PreVenko_timeout():
	if T.steloj > T.Agordejo.get_value("Steloj", str(T.nivelo), 0):
		T.Agordejo.set_value("Steloj", str(T.nivelo), T.steloj)
		T.Agordejo.save(T.agordejo)
		T.jxus_rekordita = true
	get_tree().change_scene("res://Niveloj.tscn")
