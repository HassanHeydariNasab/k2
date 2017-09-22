extends Node

var agordejo = "user://agordejo.cfg"
onready var Agordejo = ConfigFile.new()

var akcelometro_aktivita = true
var os = OS.get_name()

var Objekto = null
var foranta = false
var steloj = 0

func _notification(what):
	if what == MainLoop.NOTIFICATION_WM_QUIT_REQUEST:
		if get_tree().get_current_scene().get_name() == "Niveloj":
			get_tree().quit()
		else:
			get_tree().change_scene("res://Niveloj.tscn")

func _ready():
	Agordejo.load(agordejo)
	if os == "Android":
		akcelometro_aktivita = Agordejo.get_value("Agordoj", "akcelometro", true)
	else:
		akcelometro_aktivita = Agordejo.get_value("Agordoj", "akcelometro", false)
