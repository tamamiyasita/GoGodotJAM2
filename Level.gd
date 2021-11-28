extends Node2D

var current_level := 1

func level_change() -> void:
	current_level += 1
	match current_level:
		2:
			get_tree().change_scene("res://Wave1Standby.tscn")
		3:
			get_tree().change_scene("res://Wave2Standby.tscn")
		4:
			get_tree().change_scene("res://Wave3Standby.tscn")

