class_name HOME
extends Path2D

onready var root_path := $PathFollow2D

var a = .5
var b = .7
var t = .2

func _ready():
	pass
	
func _physics_process(_delta):
	root_path.unit_offset += .0007


