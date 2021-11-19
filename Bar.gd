extends Node

onready var anime := $AnimationPlayer
onready var L_Bar := $L_Bar

func _unhandled_input(event: InputEvent) -> void:
	if Input.is_action_pressed('left_c'):
		anime.play('bar_L')
	if Input.is_action_pressed('rigit_c'):
		anime.play('bar_R')
		
#	if Input.is_action_just_released('left_c'):
#		anime.play('bar_D')



func _on_AnimationPlayer_animation_finished(anim_name: String) -> void:
	if anim_name == "bar_L":
		anime.play('bar_D')
	if anim_name == "bar_R":
		anime.play('bar_D2')
