extends Node2D

var tipo = "Elemento"

onready var Kasxi = get_node("Kasxi")
onready var Rotacii = get_node("Rotacii")

func _ready():
	Kasxi.interpolate_property(self, "transform/scale",
	Vector2(1,1), Vector2(1.5,1.5), 1, Tween.TRANS_QUAD,
	Tween.EASE_IN
	)
	Kasxi.interpolate_property(self, "transform/rot",
	0, -90, 1, Tween.TRANS_QUAD,
	Tween.EASE_OUT
	)
	Kasxi.interpolate_property(self, "visibility/opacity",
	1, 0, 1, Tween.TRANS_QUAD,
	Tween.EASE_IN
	)
	Rotacii.interpolate_property( self, "transform/rot",
	0, 360, 0.8, Tween.TRANS_QUAD,
	Tween.EASE_OUT
	)

func _on_Areo_body_enter( korpo ):
	if korpo.tipo == "Objekto":
		get_node("Areo").clear_shapes()
		T.Radiko.Rotacii.stop()
		T.Radiko.Lunon_kapti_sono.play()
		Kasxi.start()

func _on_Kasxi_tween_complete( object, key ):
	T.Radiko.PreVenko.start()
	queue_free()

func _on_Rotacii_tween_step( object, key, elapsed, value ):
	if elapsed == 0.8:
		Rotacii.stop_all()
