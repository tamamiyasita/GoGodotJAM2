extends Node2D

var apple := false

func _ready():
	pass


func _on_Area2D_area_entered(area):
	if apple == false:
		$Appls.show()
		apple = true
	else:
		apple = false
		$Appls.hide()
		get_tree().call_group("base", "update_hp", 3)
		$chargeParticles2D2.emitting = true
