extends Node2D
onready var anime := $AnimationPlayer

func _ready() -> void:
	pass


func _on_Area2D_body_entered(body: Node) -> void:
	anime.play('open')
