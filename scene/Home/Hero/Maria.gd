extends "res://scene/Home/Hero/DefaultPaddle.gd"



func _ready() -> void:
	$BallShape/CollisionShape2D.shape.set("radius", 500)
	pass # Replace with function body.
	
