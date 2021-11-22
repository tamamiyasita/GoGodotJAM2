extends Node2D

onready var rigid_body := $RigidBody2D
export(PackedScene) var Fire


func _on_Area2D_area_entered(area: Area2D) -> void:


	pass # Replace with function body.

func _on_Area2D_body_entered(body: Node) -> void:
	print("body_on")
	var fire = Fire.instance()
#	fire.position = body.position
	rigid_body.add_child(fire)
	$AnimationPlayer.play('hit')
