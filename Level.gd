extends Node2D


func level_change() -> void:
	BaseInfo.current_level += 1
	match BaseInfo.current_level:
		2:
			get_tree().change_scene("res://Wave1Standby.tscn")
		3:
			get_tree().change_scene("res://Wave2Standby.tscn")
		4:
			get_tree().change_scene("res://Wave3Standby.tscn")

