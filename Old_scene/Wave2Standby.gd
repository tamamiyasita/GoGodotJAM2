extends Control

onready var anime := $AnimationPlayer

func _ready() -> void:
	pass


func _on_TextureButton_pressed() -> void:
	anime.play('next')
	yield(anime, "animation_finished" )
	get_tree().change_scene("res://Level3.tscn")
