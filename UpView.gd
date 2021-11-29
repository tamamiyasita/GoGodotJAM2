extends Node2D
onready var anime := $AnimationPlayer
var Success = preload("res://Scccess.tscn")

func _ready() -> void:
	$Camera2D.current = true
	print("reade")
	get_tree().paused = true
	anime.play('start')
	yield(anime, "animation_finished" )
	get_tree().paused = false


func game_over() -> void:
	get_tree().paused = true
	anime.play('game_over')
	yield(anime, "animation_finished" )
	yield(get_tree().create_timer(4), "timeout")
	get_tree().paused = false
	get_tree().reload_current_scene()

func success() -> void:
	var s = Success.instance()
	add_child(s)
