class_name HOME
extends Path2D

onready var root_path := $PathFollow2D

var a = .5
var b = .7
var t = .2

func _ready():
	pass
	
func _physics_process(_delta):
#	root_path.unit_offset += .0007
	$PathFollow2D/KinematicBody2D.position.x += (a-b)*cos(t) - b*cos(((a-b)/b)*t)
	$PathFollow2D/KinematicBody2D.position.y += (a-b)*sin(t) - b*sin(((a-b)/b)*t)

