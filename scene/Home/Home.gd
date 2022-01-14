class_name HOME
extends Path2D


onready var path_flollow := $PathFollow2D
onready var tween := $Tween

var speed = 3000

var a = .5
var b = .7
var t = .2

func _ready():
	print(MainPath.home)
	pass
func _physics_process(_delta):
#	path_flollow.unit_offset += .0007
	pass



func _on_Timer_timeout():
	var _t = tween.interpolate_property(path_flollow, "unit_offset",
						path_flollow.unit_offset, path_flollow.unit_offset+.02,
						curve.get_baked_length() / speed,Tween.EASE_IN_OUT)
	print(_t, " T")
	var _s = tween.start()
	$Timer.start()
