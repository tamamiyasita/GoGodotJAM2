extends PathFollow2D

onready var mob := $Area2D
export(PackedScene) var explosion
export(float) var move_speed := 3.0
export var damage := 1
export var hp = 1
onready var col = $Area2D/CollisionShape2D as CollisionShape2D
onready var anime := $AnimationPlayer

func _ready() -> void:
	move_speed *= 0.0001
#	randomize()
#	h_offset += randi() % 3
#	v_offset += randi() % 3
	
	
func _process(delta: float) -> void:
	unit_offset += move_speed


func dead() -> void:
	$Area2D/CollisionShape2D.disabled = true
	$Area2D/Icon.hide()
	$Area2D/Shadow.hide()
	get_tree().call_group("ui", "update_enemies")
	var e = explosion.instance()
	e.global_position = mob.global_position
	add_child(e)
	yield(get_tree().create_timer(0.35), "timeout")
	queue_free()




func _damege_flash() -> void:
	mob.monitoring = false
	col.disabled = true
	print(hp,  " hp")
	if 2 <= hp:
		anime.play('take_damage')
		yield(anime, "animation_finished" )
		hp -= 1
		col.disabled = false
		mob.monitoring = true

	else:
		dead()
	


func _on_Area2D_area_entered(area: Area2D) -> void:
	if area.is_in_group("damage"):
		_damege_flash()
