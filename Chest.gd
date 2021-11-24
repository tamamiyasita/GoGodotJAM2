extends Node2D
onready var anime := $AnimationPlayer
onready var cake = $Area2D/Cake

func _ready() -> void:
	pass


func _on_Area2D_body_entered(body: Node) -> void:
	anime.play('open')
	yield(anime, "animation_finished" )
	cake.show()
	anime.play('cake_pop')
