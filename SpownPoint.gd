extends Node

export(PackedScene) var Mob
export(Curve2D) var curve

onready var path := $Path2D
onready var timer := $Timer

func _ready() -> void:
	pass


func _on_Timer_timeout() -> void:
	var m = Mob.instance()
#	m.curve = curve
	path.add_child(m)
	m.h_offset += randi() % 30
	m.v_offset += randi() % 30
	timer.start(1)
