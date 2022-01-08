extends Path2D

var speed := 400.0

export var _navi_path : NodePath
export var _home_path : NodePath
export(PackedScene) var enemy_body


onready var navigator : Navigation2D = get_node(_navi_path)
onready var home = get_node(_home_path)

#onready var enemy_body = $PathFollow2D/BodyArea2D

onready var path_flollow := $PathFollow2D

onready var timer :Timer = $PathFollow2D/Timer
onready var tween :Tween = $PathFollow2D/Tween

onready var anime :AnimationPlayer= $PathFollow2D/BodyArea2D/AnimationPlayer

onready var states := $BlueSlimeStates

#var h

func _ready():
	for e in range(4):
		
		var enemy = enemy_body.instance()
		enemy.position.x += rand_range(12,120)
		path_flollow.add_child(enemy)
		yield(get_tree().create_timer(0.3), "timeout")
#		path_flollow.h_offset += rand_range(1,100)
	
func _process(_delta):
	pass
	#test
#	h = get_global_mouse_position()

#func flip_change(body):
#	if body.global_position.x < enemy_body.global_position.x:
#		$PathFollow2D/BodyArea2D/Icon.flip_h = true
#	else:
#		$PathFollow2D/BodyArea2D/Icon.flip_h = false

func _on_Timer_timeout():
	home = get_node(_home_path)
	print(home.global_position)
#	flip_change(home)

	curve.clear_points()
	for point in navigator.get_simple_path(path_flollow.position, home.global_position):
		curve.add_point(point)
	var _t = tween.interpolate_property(path_flollow, "unit_offset",
							   0.0, 1.0, curve.get_baked_length() / speed)
	print(_t, " T")
	var _s = tween.start()
	print(_s, " S")
	timer.start()



#func _on_AttackArea2D2_body_entered(body):
#	if body.name == "HomeBody":
#		anime.play("attack")
#		yield(anime, "animation_finished" )
		
