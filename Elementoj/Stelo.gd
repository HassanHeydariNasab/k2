extends Node2D

onready var Aperi = get_node("Aperi")
onready var Kasxi = get_node("Kasxi")
onready var Brileti = get_node("Brileti")

func _ready():
	Aperi.interpolate_property(self, "transform/scale",
	Vector2(0.01,0.01), Vector2(0.3,0.3), 1, Tween.TRANS_BOUNCE,
	Tween.EASE_OUT
	)
	Aperi.interpolate_property(self, "transform/rot",
	180, 0, 1, Tween.TRANS_QUAD,
	Tween.EASE_OUT
	)
	Aperi.start()

	Kasxi.interpolate_property(self, "transform/scale",
	Vector2(0.3,0.3), Vector2(0.6,0.6), 0.25, Tween.TRANS_QUAD,
	Tween.EASE_IN
	)
	Kasxi.interpolate_property(self, "transform/rot",
	0, 90, 0.24, Tween.TRANS_QUAD,
	Tween.EASE_IN
	)
	Kasxi.interpolate_property(self, "visibility/opacity",
	1, 0, 0.25, Tween.TRANS_QUAD,
	Tween.EASE_IN
	)

	Brileti.interpolate_property( self, "transform/scale",
	Vector2(0.3,0.3), Vector2(0.4,0.4), 0.15, Tween.TRANS_QUAD,
	Tween.EASE_IN
	)
	Brileti.interpolate_property( self, "transform/scale",
	Vector2(0.4,0.4), Vector2(0.3,0.3), 0.15, Tween.TRANS_QUAD,
	Tween.EASE_IN, 0.15
	)
	set_process(true)

func _process(delta):
	pass

func _on_Areo_body_enter( korpo ):
	if korpo.get_layer_mask_bit(1):
		get_node("Areo").clear_shapes()
		T.steloj += 1
		T.Radiko.Steloj_Nombroj.set_text(str(T.steloj)+" X")
		T.Radiko.Stelon_kapti_sono.set("stream/play", T.Agordejo.get_value("Agordoj", "Sonoj", true))
		T.Radiko.Steloj_Sxangxi.stop_all()
		T.Radiko.Steloj_Sxangxi.resume_all()
		Kasxi.start()

func _on_Kasxi_tween_complete( object, key ):
	queue_free()

func _on_Brileti_tween_step( object, key, elapsed, value ):
	if elapsed == 0.3:
		Brileti.stop_all()