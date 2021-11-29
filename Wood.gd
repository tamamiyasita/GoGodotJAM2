extends Node2D

var apple := false

func _ready():
	$Appls.hide()


func _on_Area2D_area_entered(area):
	if area.is_in_group("ball"):
		apple_hp()


func apple_hp() -> void:
	if apple == false:
		$Appls.show()
		apple = true
	else:
		apple = false
		$Appls.hide()
		get_tree().call_group("base", "update_base_hp", 3)
		$chargeParticles2D2.emitting = true
	


#
#func _unhandled_input(event: InputEvent) -> void:
#		if Input.is_action_pressed("ui_accept"):
#			apple_hp()
