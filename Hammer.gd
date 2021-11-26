extends Node2D
export(PackedScene) var Ball 

onready var anime := $AnimationPlayer

func _unhandled_input(event: InputEvent) -> void:
		if Input.is_action_pressed('shot'):
			shot()
		
func shot() -> void:
	var b = Ball.instance()
	b.position = position
	b.position.y -= 130
	get_parent().add_child(b)
	yield(get_tree().create_timer(0.2), "timeout") 
	
	anime.play('shot')
	yield(anime, "animation_finished" )
	anime.play('return')
	
