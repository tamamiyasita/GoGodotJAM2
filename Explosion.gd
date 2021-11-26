extends Node2D

onready var anime := $AnimationPlayer

func _ready() -> void:
	set_as_toplevel(true)
	$Particles2D.one_shot = true
	$Particles2D2.one_shot = true
	anime.play("burst")
	yield(anime, "animation_finished" )
	get_parent().queue_free()


