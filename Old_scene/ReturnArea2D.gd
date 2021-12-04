extends Area2D



func _on_ReturnArea2D_body_entered(body: Node) -> void:
	if body.is_in_group("ball"):
		body.queue_free()
		get_tree().call_group("generator", "return_ball")
