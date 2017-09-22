extends Control

func _ready():
	get_tree().set_auto_accept_quit(false)

func _on_Nivelo_1_pressed():
	get_tree().change_scene("res://Radiko.tscn")

func _on_Agordoj_pressed():
	get_tree().change_scene("res://Agordoj.tscn")
