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
		
#	if Input.is_action_just_released('left_c'):
#		anime.play('bar_D')



#func _on_AnimationPlayer_animation_finished(anim_name: String) -> void:
#	if anim_name == "bar_L":
#		anime.play('bar_D')
#	if anim_name == "bar_R":
#		anime.play('bar_D2')
