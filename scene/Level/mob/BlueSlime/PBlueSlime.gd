extends Path2D

var speed := 400.0

export var _navi_path : NodePath
export var _home_path : NodePath

onready var navigator : Navigation2D = get_node(_navi_path)
onready var home : HOME = get_node(_home_path)

onready var enemy = $PathFollow2D/Area2D
onready var path_flollow := $PathFollow2D

onready var timer :Timer = $PathFollow2D/Area2D/Timer
onready var tween :Tween = $PathFollow2D/Tween


func _ready():
	pass


func _on_Timer_timeout():
	curve.clear_points()
	for point in navigator.get_simple_path(path_flollow.position, home.position):
		curve.add_point(point)
	tween.interpolate_property(path_flollow, "unit_offset",
							   0.0, 1.0, curve.get_baked_length() / speed)
	tween.start()
