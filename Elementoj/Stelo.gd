extends Node2D

var tipo = "Elemento"

onready var Kasxi = get_node("Kasxi")
onready var Brileti = get_node("Brileti")

func _ready():
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
	if korpo.tipo == "Objekto":
		get_node("Areo").clear_shapes()
		T.steloj += 1
		get_node("/root/Radiko/Kanvaso/Steloj").set_text(str(T.steloj)+" X")
		Kasxi.start()

func _on_Kasxi_tween_complete( object, key ):
	queue_free()

func _on_Brileti_tween_step( object, key, elapsed, value ):
	if elapsed == 0.3:
		Brileti.stop_all()
