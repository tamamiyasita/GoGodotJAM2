extends Area2D

var velocity = Vector2(350, 0)

func _ready() -> void:
	set_as_toplevel(true)

func _process(delta: float) -> void:
	velocity.y += gravity * delta
	position += velocity * delta
	rotation = velocity.angle()

func _on_Bullet_body_entered(body: Node) -> void:
	queue_free()


func _on_Bullet_area_entered(area: Area2D) -> void:
	pass # Replace with function body.
