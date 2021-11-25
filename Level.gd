extends Node2D

var current_level := 1

func level_change() -> void:
	current_level += 1
	match current_level:
		2:
			get_tree().change_scene("res://Level2.tscn")
		_:
			pass
