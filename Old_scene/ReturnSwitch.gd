extends Node2D


func _on_Area2D_body_entered(body: Node) -> void:
	if get_parent().on_ball == false:
		$AnimationPlayer.play('rtn')
		yield($AnimationPlayer, "animation_finished" )
		get_tree().call_group("generator", "return_ball")
		get_tree().call_group("ball", "home")
		$AnimationPlayer.play('mdr')


