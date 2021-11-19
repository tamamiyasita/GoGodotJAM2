extends Path2D

onready var path := $PathFollow2D

func _ready() -> void:
	path.h_offset += randi() % 30
	path.v_offset += randi() % 30



func _on_Area2D_body_entered(body: Node) -> void:
	queue_free()
