extends Node

onready var L_anime :AnimationPlayer = $L_pos/L_AnimationPlayer
onready var R_anime :AnimationPlayer = $R_pos/R_AnimationPlayer

func _unhandled_input(event: InputEvent) -> void:
	if Input.is_action_pressed('left_c'):
#		yield(anime, "animation_finished" )
		L_anime.play('bar_L')
		print("LLL")
	if Input.is_action_pressed('rigit_c'):
		R_anime.play('bar_R')
		


func L_bar() -> void:
	L_anime.play('bar_L')
	
func R_bar() -> void:
	R_anime.play('bar_R')
