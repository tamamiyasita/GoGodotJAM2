extends Node2D


func _ready() -> void:
	pass # Replace with function body.


func _on_SkillTimer_timeout() -> void:
	queue_free()


func _on_SkillArea2D_area_entered(area: Area2D) -> void:
	if area in get_tree().get_nodes_in_group("mob"):
		print(area)
