extends Node2D

var Nivelo = null
var Steloj = null
var Luno = null
var Kvadrato = preload("res://Objektoj/Kvadrato.tscn")
var Kvadrato_teksturo = preload("res://Objektoj/kvadrato.png")
var Kvadrato_malaktivita_teksturo = preload("res://Objektoj/kvadrato_malaktivita.png")
var Triangulo = preload("res://Objektoj/Triangulo.tscn")
var Triangulo_teksturo = preload("res://Objektoj/triangulo.png")
var Triangulo_malaktivita_teksturo = preload("res://Objektoj/triangulo_malaktivita.png")
onready var Kamero = get_node("Kamero")
onready var Objektoj = get_node("Objektoj")
onready var Ekvivejo = get_node("Ekvivejo")
onready var Rotacii = get_node("Rotacii")
onready var PreVenko = get_node("PreVenko")
onready var Rotacii_sono = get_node("Rotacii_sono")
onready var Brileti_sono = get_node("Brileti_sono")
onready var Stelon_kapti_sono = get_node("Stelon_kapti_sono")
onready var Lunon_kapti_sono = get_node("Lunon_kapti_sono")
onready var Kvadrato_Nombroj = get_node("Kanvaso/Kvadrato/Nombroj")
onready var Triangulo_Nombroj = get_node("Kanvaso/Triangulo/Nombroj")
onready var FPS = get_node("Kanvaso/FPS")
onready var Steloj_Sxangxi = get_node("Kanvaso/Steloj/Sxangxi")
onready var Steloj_Nombroj = get_node("Kanvaso/Steloj/Nombroj")

const KVADRATOJ = [ [],
					[0, 2, 9, 4],
					[0, 20, 9, 4]
					]
const TRIANGULOJ = [ [],
					[0, 1, 10, 3],
					[0, 20, 9, 4]
					]
var kvadratoj = 0
var trianguloj = 0

func _ready():
	T.Radiko = self
	T.Objekto = null
	T.steloj = 0
	kvadratoj = KVADRATOJ[T.pako][T.nivelo]
	Kvadrato_Nombroj.set_text(str(kvadratoj))
	trianguloj = TRIANGULOJ[T.pako][T.nivelo]
	Triangulo_Nombroj.set_text(str(trianguloj))
	add_child(load("res://Niveloj/P%dN%d.tscn" % [T.pako,T.nivelo]).instance())
	Nivelo = get_node("Nivelo")
	Nivelo.get_node("Fonmuziko").set("stream/play", T.Agordejo.get_value("Agordoj", "Muzikoj", true))
	Steloj = Nivelo.get_node("Steloj")
	Luno = Nivelo.get_node("Luno")
	if T.akcelometro_aktivita:
		get_node("Kanvaso/Kontroliloj").queue_free()
	Steloj_Sxangxi.interpolate_property(Steloj_Nombroj, "custom_colors/font_color",
		Color("ffffff"), Color("ffcc00"), 0.5, Tween.TRANS_QUAD,
		Tween.EASE_OUT
	)
	Steloj_Sxangxi.interpolate_property(Steloj_Nombroj, "custom_colors/font_color",
		Color("ffcc00"), Color("ffffff"), 0.5, Tween.TRANS_QUAD,
		Tween.EASE_OUT,0.5
	)
	set_process(true)

func _process(delta):
	FPS.set_text(str(int(1.0/delta)))

func _on_Kvadrato_pressed():
	if kvadratoj >= 1:
		kvadratoj -= 1
		Kvadrato_Nombroj.set_text(str(kvadratoj))
	else:
		return
	var Kvadrato_ = Kvadrato.instance()
	Kvadrato_.set_global_pos(Ekvivejo.get_global_pos())
	Kvadrato_.get_node("Aspekto").set_texture(Kvadrato_teksturo)
	Objektoj.add_child(Kvadrato_)
#	if T.Objekto != null and weakref(T.Objekto).get_ref():
	if T.Objekto != null:
		T.Objekto.set_fixed_process(false)
		if T.Objekto.get_node("Aspekto").get_texture() == Triangulo_teksturo:
			T.Objekto.get_node("Aspekto").set_texture(Triangulo_malaktivita_teksturo)
		elif T.Objekto.get_node("Aspekto").get_texture() == Kvadrato_teksturo:
			T.Objekto.get_node("Aspekto").set_texture(Kvadrato_malaktivita_teksturo)
		T.Objekto.get_node("Fumo_blanka").set_emitting(false)
		T.Objekto.get_node("Fumo_flava").set_emitting(false)
	T.Objekto = Kvadrato_
	T.Objekto.set_fixed_process(true)

func _on_Triangulo_pressed():
	if trianguloj >= 1:
		trianguloj -= 1
		Triangulo_Nombroj.set_text(str(trianguloj))
	else:
		return
	var Triangulo_ = Triangulo.instance()
	Triangulo_.set_global_pos(Ekvivejo.get_global_pos())
	Triangulo_.get_node("Aspekto").set_texture(Triangulo_teksturo)
	Objektoj.add_child(Triangulo_)
#	if T.Objekto != null and weakref(T.Objekto).get_ref():
	if T.Objekto != null:
		T.Objekto.set_fixed_process(false)
		if T.Objekto.get_node("Aspekto").get_texture() == Triangulo_teksturo:
			T.Objekto.get_node("Aspekto").set_texture(Triangulo_malaktivita_teksturo)
		elif T.Objekto.get_node("Aspekto").get_texture() == Kvadrato_teksturo:
			T.Objekto.get_node("Aspekto").set_texture(Kvadrato_malaktivita_teksturo)
		T.Objekto.get_node("Fumo_blanka").set_emitting(false)
		T.Objekto.get_node("Fumo_flava").set_emitting(false)
	T.Objekto = Triangulo_
	T.Objekto.set_fixed_process(true)

func _on_Forigi_toggled( b ):
	T.foranta = b

func _on_Brileti_timeout():
	randomize()
	if int(rand_range(0,2)) == 0 and Steloj.get_child_count() > 0:
		var Stelo = Steloj.get_child(int(rand_range(0,Steloj.get_child_count())))
		Stelo.Brileti.resume_all()
		Brileti_sono.set("stream/play", T.Agordejo.get_value("Agordoj", "Sonoj", true))

func _on_Rotacii_timeout():
	if int(rand_range(0,3)) == 0:
		Luno.Rotacii.resume_all()
		Rotacii_sono.set("stream/play", T.Agordejo.get_value("Agordoj", "Sonoj", true))

func _on_PreVenko_timeout():
	if T.steloj > T.Agordejo.get_value("Steloj", "P"+str(T.pako)+"N"+str(T.nivelo), 0):
		T.Agordejo.set_value("Steloj", "P"+str(T.pako)+"N"+str(T.nivelo), T.steloj)
		T.Agordejo.save(T.agordejo)
		T.jxus_rekordita = true
	get_tree().change_scene("res://Niveloj.tscn")

func _on_Sxangxi_tween_step( object, key, elapsed, value ):
	if elapsed == 1:
		Steloj_Sxangxi.stop_all()

func _on_Rekomenci_pressed():
	get_tree().reload_current_scene()


func _on_Rulumilo_value_changed( valoro ):
	Kamero.set_offset(Vector2(valoro, 300))
