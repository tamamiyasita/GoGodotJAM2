extends Node2D


func _ready() -> void:
	pass


func _on_Area2D_body_entered(body: Node) -> void:
	$AnimationPlayer.play('pon')