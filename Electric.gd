extends Node2D


func _ready() -> void:
	pass

func timer_set(value) -> void:
	$Timer.start(value)


func _on_Timer_timeout() -> void:
	queue_free()
