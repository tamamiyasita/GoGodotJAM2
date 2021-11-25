extends PathFollow2D

onready var mob := $Area2D
export(PackedScene) var explosion
export var damage := 1
export var hp = 1
onready var col = $Area2D/CollisionShape2D as CollisionShape2D
onready var anime := $AnimationPlayer

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
	_damege_flash()
