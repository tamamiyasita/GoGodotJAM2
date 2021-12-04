extends Control


func _ready() -> void:
	pass


func _on_TextureButton_pressed() -> void:
	get_tree().change_scene("res://Title.tscn")
