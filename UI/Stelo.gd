extends Node2D

onready var Stelo = get_node("Stelo")

func _ready():
	randomize()
	Stelo.set_global_pos(Stelo.get_global_pos()+Vector2(rand_range(-150,150),0))

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
		T.Niveloj.Stelo_kolizio_sono.play()
