extends Area2D





func _on_Fire_area_entered(area: Area2D) -> void:
	area.queue_free()


