extends Node2D

var HP = 10

func _ready() -> void:
	get_tree().call_group("ui", "update_hp", HP)
	get_tree().call_group("ui", "update_max_hp", HP)
	$Camera2D.current = true


func _on_Area2D_area_entered(area: Area2D) -> void:
	HP -= area.get_parent().damage
	if 1 > HP:
		print("game_over") 
	area.queue_free()
	get_tree().call_group("ui", "update_hp", HP)
