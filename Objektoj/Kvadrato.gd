extends RigidBody2D

var tipo = "Objekto"
var Korpoj = []
var akcelometro

func _ready():
	pass

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
			if Korpoj[0].get_name() == "Grundo" or Korpoj[0].tipo == "Objekto":
				set_linear_velocity(Vector2(get_linear_velocity().x,-100))
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
			if Korpoj[0].get_name() == "Grundo" or Korpoj[0].tipo == "Objekto":
				set_linear_velocity(Vector2(get_linear_velocity().x,-100))

func _on_Kvadrato_input_event( viewport, evento, shape_idx ):
	if T.foranta and evento.is_pressed() and T.Objekto != self:
		queue_free()