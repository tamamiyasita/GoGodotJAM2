class_name HOME
extends Path2D

onready var root_path := $PathFollow2D

func _ready():
	pass
	
func _physics_process(delta):
	root_path.unit_offset += .0007
