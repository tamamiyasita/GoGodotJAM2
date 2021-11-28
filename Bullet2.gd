extends Area2D

var velocity = Vector2(350, 0)
var Burst = preload('res://Explosion2.tscn')


func _ready() -> void:
	set_as_toplevel(true)
	yield(get_tree().create_timer(2.3), "timeout")
	var b = Burst.instance()
	add_child(b)
	yield(get_tree().create_timer(0.1), "timeout")
	queue_free()

func _process(delta: float) -> void:
	velocity.y += gravity * delta
	position += velocity * delta
	rotation = velocity.angle()

func _on_Bullet_body_entered(body: Node) -> void:
	pass
#	queue_free()


func _on_Bullet_area_entered(area: Area2D) -> void:
	pass # Replace with function body.
