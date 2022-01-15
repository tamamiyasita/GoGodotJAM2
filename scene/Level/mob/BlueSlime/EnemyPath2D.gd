extends Path2D
onready var navigator = MainPath.navi2d as Navigation2D
onready var home = MainPath.home as KinematicBody2D

onready var path_flollow := $PathFollow2D
onready var mob := $PathFollow2D/BlueSlime
var speed := 390.0
onready var tween :Tween = $Tween
onready var timer :Timer = $Timer



func _ready():
	path_flollow.global_position = get_parent().global_position
	r()
	pass
	
func r():
	var x = rand_range(-100, 100)
	var y = rand_range(-100, 100)
	path_flollow.global_position += Vector2(x, y)

func _on_Timer_timeout():
#	flip_change(home)
	mob.set_physics_process(true)

	curve.clear_points()
	for point in navigator.get_simple_path(path_flollow.global_position, home.global_position):
		curve.add_point(point)
	var _t = tween.interpolate_property(path_flollow, "unit_offset",
							   0.0, 1.0, curve.get_baked_length() / speed)
	print(_t, " T")
	var _s = tween.start()
	print(_s, " S")
	timer.start()
