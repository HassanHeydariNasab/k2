extends RigidBody2D

onready var Aspekto = get_node("Aspekto")
onready var Aperi = get_node("Aperi")

var Korpoj = []
var akcelometro

func _ready():
	Aperi.interpolate_property(Aspekto, "transform/scale",
		Vector2(0.01,0.01), Vector2(0.5,0.5), 1, Tween.TRANS_ELASTIC,
		Tween.EASE_IN_OUT
	)
	Aperi.start()

func _fixed_process(delta):
	Korpoj = get_colliding_bodies()
	if T.akcelometro_aktivita:
		akcelometro = Input.get_accelerometer()
		if akcelometro.x > -3 and akcelometro.x < -1.5:
			set_angular_velocity(2)
		elif akcelometro.x < 3 and akcelometro.x > 1.5:
			set_angular_velocity(-2)
		elif akcelometro.x > 3:
			set_angular_velocity(-5)
		elif akcelometro.x < -3:
			set_angular_velocity(5)
		if akcelometro.y > -0.7 and Korpoj.size() > 0:
			if Korpoj[0].get_layer_mask_bit(0) or Korpoj[0].get_layer_mask_bit(1):
				set_linear_velocity(Vector2(get_linear_velocity().x,-120))
	else:
		if Input.is_action_pressed("turni_dekstre_malrapide"):
			set_angular_velocity(2)
		elif Input.is_action_pressed("turni_maldekstre_malrapide"):
			set_angular_velocity(-2)
		elif Input.is_action_pressed("turni_maldekstre"):
			set_angular_velocity(-5)
		elif Input.is_action_pressed("turni_dekstre"):
			set_angular_velocity(5)
		if (Input.is_action_pressed("salti")) and Korpoj.size() > 0:
			if Korpoj[0].get_layer_mask_bit(0) or Korpoj[0].get_layer_mask_bit(1):
				set_linear_velocity(Vector2(get_linear_velocity().x,-120))

func _on_Kvadrato_input_event( viewport, evento, shape_idx ):
	if T.foranta and evento.is_pressed() and T.Objekto != self:
		var Kasxi = get_node("Kasxi")
		Kasxi.interpolate_property(Aspekto, "transform/scale",
			Vector2(0.5,0.5), Vector2(0.01,0.01), 1, Tween.TRANS_ELASTIC,
			Tween.EASE_IN_OUT
		)
		Kasxi.start()

func _on_Kasxi_tween_complete( object, key ):
	queue_free()
