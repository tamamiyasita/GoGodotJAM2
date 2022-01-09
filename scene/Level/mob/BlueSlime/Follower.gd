extends Node2D

var acc = Vector2.ZERO
var pos = Vector2.ZERO

func _ready() -> void:
	set_process(false)
	
func _process(delta: float) -> void:
	update_vel_pos()

func update_vel_pos() -> void:
	var followers = get_children()
	for b in followers:
		b.update_vel(followers)
		b.update_pos()
