extends Node2D


onready var anime := $AnimationPlayer
func _ready() -> void:
	pass


func _on_Area2D_body_entered(body: Node) -> void:
	open()
	
	
func open() -> void:
	anime.play('open')
	yield(anime, "animation_finished" )
	var item = randi() % 3+1
	match item:
		1:
			anime.play('cake_pop')
			print("1")
			get_tree().call_group("base", "update_base_max_hp", 10)
		2:
			anime.play('pan_pop')
			get_tree().call_group("ball", "update_max_ball_en", 10)
			print("2")
		3:
			print("3")

	
