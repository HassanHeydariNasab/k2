extends RigidBody2D

onready var Aspekto = get_node("Aspekto")
onready var Aperi = get_node("Aperi")
onready var Kasxi = get_node("Kasxi")

var Korpoj = []
var akcelometro

var SALTO = 0
var SALTEGO = 0

func _ready():
	Aperi.interpolate_property(Aspekto, "transform/scale",
		Vector2(0.01,0.01), Vector2(0.5,0.5), 1, Tween.TRANS_ELASTIC,
		Tween.EASE_IN_OUT
	)
	Aperi.start()
	Kasxi.interpolate_property(Aspekto, "transform/scale",
		Vector2(0.5,0.5), Vector2(0.01,0.01), 1, Tween.TRANS_ELASTIC,
		Tween.EASE_IN_OUT
	)
	var Ecoj = get_node("Ecoj")
	SALTO = Ecoj.SALTO
	SALTEGO = Ecoj.SALTEGO

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
				set_linear_velocity(Vector2(get_linear_velocity().x,-SALTO))
			elif Korpoj[0].get_layer_mask_bit(3):
				set_linear_velocity(Vector2(get_linear_velocity().x,-SALTEGO))
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
				set_linear_velocity(Vector2(get_linear_velocity().x,-SALTO))
			elif Korpoj[0].get_layer_mask_bit(3):
				set_linear_velocity(Vector2(get_linear_velocity().x,-SALTEGO))

func _on_Kvadrato_input_event( viewport, evento, shape_idx ):
	if T.foranta and evento.is_pressed():
		Kasxi.start()

func _on_Kasxi_tween_complete( object, key ):
	if T.Objekto == self:
		T.Objekto = null
	queue_free()