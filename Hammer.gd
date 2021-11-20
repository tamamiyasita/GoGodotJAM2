extends Node2D

onready var anime := $AnimationPlayer

func _unhandled_input(event: InputEvent) -> void:
		if Input.is_action_pressed('shot'):
			anime.play('shot')
			yield(anime, "animation_finished" )
			anime.play('return')
		
