extends Node2D

onready var Stelo = get_node("Stelo")

func _ready():
	randomize()
	Stelo.set_linear_velocity(Vector2(rand_range(-150,200),-20))

func rekordita():
	var Aspekto = Stelo.get_node("Aspekto")
	var Rekordita = Aspekto.get_node("Rekordita")
	Rekordita.interpolate_property( Aspekto, "transform/scale",
	Vector2(1,1), Vector2(3,3), 1, Tween.TRANS_QUAD,
	Tween.EASE_OUT
	)
	Rekordita.interpolate_property( Aspekto, "transform/scale",
	Vector2(3,3), Vector2(1,1), 0.6, Tween.TRANS_QUAD,
	Tween.EASE_IN, 1
	)
	Rekordita.start()

func _on_Stelo_input_event( viewport, evento, shape_idx ):
	if evento.type == InputEvent.SCREEN_TOUCH:
		if evento.is_pressed():
			T.Kaptitajxo = Stelo
		else:
			T.Kaptitajxo = null
	elif evento.type == InputEvent.MOUSE_BUTTON:
		if evento.button_index == BUTTON_LEFT and evento.is_pressed():
			T.Kaptitajxo = Stelo
		else:
			T.Kaptitajxo = null

func _on_Stelo_body_enter( korpo ):
	if korpo.get_name() == "Stelo":
		T.Niveloj.Stelo_kolizio_sono.set("stream/play", T.Agordejo.get_value("Agordoj", "Sonoj", true))
