extends PathFollow2D

onready var mob := $Area2D
export(PackedScene) var explosion
export var damage := 1
#func _ready() -> void:
#	randomize()
#	h_offset += randi() % 3
#	v_offset += randi() % 3
	
	
func _process(delta: float) -> void:
	unit_offset += 0.0004


func dead() -> void:
	$Area2D/CollisionShape2D.disabled = true
	$Area2D/Icon.hide()
	get_tree().call_group("ui", "update_enemies")
	var e = explosion.instance()
	e.global_position = mob.global_position
	add_child(e)
	e.anime.play("burst")
	yield(e.anime, "animation_finished" )
	queue_free()


#func _on_Area2D_body_entered(body: Node) -> void:
#	dead()


func _on_Area2D_area_entered(area: Area2D) -> void:
	dead()
